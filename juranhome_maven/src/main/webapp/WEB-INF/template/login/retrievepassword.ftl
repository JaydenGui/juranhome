<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<!-- saved from url=(0043)http://localhost:8080/juranhome/login/index -->
<html id="ng-app" ng-app="app" class="ng-scope"><head lang="en"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide{display:none !important;}ng\:form{display:block;}</style>
    <meta charset="UTF-8">
    <title>login</title>
    <!--include css file-->
    <link rel="stylesheet" href="${baseUrl}/css/login/regsiter.css">
    <link rel="stylesheet" href="${baseUrl}/css/login/login.css">
    <link rel="stylesheet" href="${baseUrl}/css/login/retrievepassword.css">
</head>
<body ng-controller="ctrl" class="ng-scope">
<input type="hidden" id="loginze" value="1">

<div class="regsiter_bj">
    <div id="center">
        <div class="regsiter_top">
        <ul class="reg_logo">
            <a href="http://localhost:8080/juranhome/"><li class="shlo"><img src="${baseUrl}/images/login/logina_03.png"></li></a>
        </ul>
     </div>
        <div class="regsitera">
           <div class="tou">
               <div id="head">
                   <img src="${baseUrl}/images/login/toux.png">
               </div>
               <span style="margin-top: 5px; display: inline-block">QQ昵称</span>
           </div>
        <ul class="handover">
            <p class="handover">欢迎来到设计家</p>
        </ul>
        <div class="contact_zhuce emlly">
            <form name="form1" method="post" ng-submit="submit($event)" class="ng-pristine ng-invalid ng-invalid-required">
                <input type="hidden" id="type" name="type" ng-model="userLoginType" class="ng-pristine ng-valid">
                <ul>
                    <div ng-class="{hint:isError==1,hintnone:isError==2}" class="hintnone"><p>您输入的帐号或密码有误,请重新输入!</p><div>
                        <div class="yuedu">
                            <div class="prompt">请选择你的账号类型：</div>
                            <input type="radio" ng-model="rememberPwd" class="ng-pristine ng-valid"><span id="remembe" class="xieyi">我是消费者</span>
                            <input type="radio" ng-model="rememberPwd1" class="ng-pristine ng-valid"><span class="xieyi">我是设计师</span>
                        </div>
                     </div>
                    </div>
                    <li>
                        <div class="prompt">输入您的邮箱：</div>
                        <input style="width: 100%" type="text" id="emailm" placeholder="请输入正确的邮箱地址" onblur="mail()" required="" autocomplete="off" ng-model="phone" class="ng-pristine ng-invalid ng-invalid-required">
                        <span class="tips" id="dmail"></span>
                    </li>
                </ul>
                <b class="btn"><input type="submit" value="立即登录" ng-disabled="!phone||!password" disabled="disabled"></b>
                <a class="ememb"target="_blank" href="${baseUrl}/login/steone">忘记密码?</a>
            </form>
        </div>
     </div>

        <div class="bottomnav">
        <ul>
            <li><a href="http://localhost:8080/juranhome/login/index#">关于我们</a></li>
            <li><a href="http://localhost:8080/juranhome/login/index#">帮助中心</a></li>
            <li><a href="http://localhost:8080/juranhome/login/index#">招贤纳士</a></li>
            <li><a href="http://localhost:8080/juranhome/login/index#">友情链接</a></li>
            <li><a href="http://localhost:8080/juranhome/login/index#">合作伙伴</a></li>
        </ul>
        <div class="copyright-info">Copyright ©2012-2015  设计家网上商城  版权所有 | 京ICP备13010107号 | 京公网安备11010102001154号  </div>
        </div>
    </div>
</div>
<#include '/common/commonjs.html'/>	
<script>
    $(window).resize(function(){
        $("#center").css({
            position: "absolute",
            left: ($(window).width() - $("#center").outerWidth())/2,
            top: ($(window).height() - $("#center").outerHeight())/2
        });
    });
</script>
</body></html>
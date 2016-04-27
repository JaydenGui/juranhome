<!DOCTYPE html>
<!-- saved from url=(0043)http://localhost:8080/juranhome/login/index -->
<html id="ng-app" ng-app="app" class="ng-scope">
<head lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide{display:none !important;}ng\:form{display:block;}</style>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="css/regsiter.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/retrievepassword.css">
</head>
<body ng-controller="ctrl" class="ng-scope">
<input type="hidden" id="loginze" value="1">

<div class="regsiter_bj">
    <div id="center">
        <div class="regsiter_top">
        <ul class="reg_logo">
            <a href="http://localhost:8080/juranhome/"><li class="shlo"><img src="images/logina_03.png"></li></a>
        </ul>
    </div>
        <!--complete d-->
        <div class="regsitera" id="account">
            <ul class="steps">
                <li>
                    <div class="tothe">
                        <span></span>
                        <p>1</p>
                        <span></span>
                    </div>
                    <a>输入账户名</a>
                </li>
                <li>
                    <div class="tothe">
                        <span></span>
                        <p>2</p>
                        <span></span>
                    </div>
                    <a>验证身份</a>
                </li>
                <li>
                    <div class="tothe">
                        <span></span>
                        <p>3</p>
                        <span></span>
                    </div>
                    <a>修改密码</a>
                </li>
                <li>
                    <div class="tothe  default">
                        <span></span>
                        <p>4</p>
                        <span></span>
                    </div>
                    <a  class="avte">完成</a>
                </li>
            </ul>
            <div class="contact_zhuce caasi">
                <div class="keemind">
                    <i><img src="images/gongxi.png"></i>
                    <p>您已成功修改密码，请牢记！</p>
                </div>
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
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
        <!--authenticate b-->
        <div class="regsitera pannd" id="account">
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
                    <div class="tothe default">
                        <span></span>
                        <p>2</p>
                        <span></span>
                    </div>
                    <a class="avte">验证身份</a>
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
                    <div class="tothe">
                        <span></span>
                        <p>4</p>
                        <span></span>
                    </div>
                    <a>完成</a>
                </li>
            </ul>
            <div class="contact_zhuce caasi">
                <form name="form1" action="${baseUrl}/login/stethree" method="post" ng-submit="submit($event)" class="ng-pristine ng-invalid ng-invalid-required">
                    <input type="hidden" id="type" name="type" ng-model="userLoginType" class="ng-pristine ng-valid">
                    <ul>
                        <li>
                            <p>验证方式:</p>
                            <select class="form-control ng-pristine ng-valid" id="renovationStylereq" name="renovationStylereq" ng-model="renovationstyle">
                                <option value="1" selected="selected">通过手机验证个人身份</option>
                                <option value="2">通过邮箱验证个人身份</option>
                                <option value="3">通过安全问题验证个人身份</option>
                            </select>
                            <span class="tips" id="divmail"></span>
                        </li>
                    </ul>
                    <ul id="cellphone">
                        <li>
                            <p>手机号：</p>
                              <input type="text" maxlength="11" required name="phone" id="mphone" onblur="mobilephone()">
                            <span class="hyanzm" id="mmphone"><font class="tips_false"></font></span>
                        </li>
                        <li>
                            <p>手机验证码:</p>
                            <input class="hsinv hsda" type="yanzh" name="yanzh" maxlength="6" required autocomplete="off" ng-model="captcha" class="ng-pristine ng-invalid ng-invalid-required">
                            <i id="huoqu">获取验证码</i>
                            <span class="hyanzm"><font class="tips_false"></font></span>
                        </li>
                    </ul>
                    <ul id="email">
                        <li>
                            <p>邮箱：</p>
                            <input type="text" required nama="phone" id="emailm" onblur="kmail()">
                            <span class="hyanzm" id="dmail"><font class="tips_false"></font></span>
                        </li>
                    </ul>

                    <ul id="unlockme">
                        <li>
                            <p>问题一：</p>
                            <span>您的出生地是？</span>
                        </li>
                        <li>
                            <p>回答：</p>
                            <input type="text" required>
                            <span class="hyanzm"><font class="tips_false"></font></span>
                        </li>
                        <li>
                            <p>问题二：</p>
                            <span>您大学的名称是？</span>
                        </li>
                        <li>
                            <p>回答：</p>
                            <input type="text" required>
                            <span class="hyanzm"><font class="tips_false"></font></span>
                        </li>
                    </ul>
                    <uL>
                        <li>
                            <p>验证码:</p>
                            <input class="hsinv hsda" type="yanzh" name="yanzh" maxlength="6" required autocomplete="off" ng-model="captcha" class="ng-pristine ng-invalid ng-invalid-required">
                            <i><img src="${baseUrl}/images/login/yan.png"></i>
                            <a id="svcb" href="#"><img src="${baseUrl}/images/login/806.png"/></a>
                            <span class="hyanzm" ><font class="tips_false"></font></span>
                        </li>
                    </uL>
                    <b class="nextstep"><input type="submit" value="下一步" ng-disabled="!captcha||!captcha2"><input class="xnet" type="button" value="上一步" onclick="history.back()"></b>
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
<script src="${baseUrl}/js/public/jquery-1.11.2.min.js" charset="utf-8" type="text/javascript"></script>
<script src="${baseUrl}/js/user/passwordregsiter.js"></script>
<script>
    $(window).resize(function(){
        $("#center").css({
            position: "absolute",
            left: ($(window).width() - $("#center").outerWidth())/2,
            top: ($(window).height() - $("#center").outerHeight())/2
        });
    });


    $(function(){
        $("#unlockme,#email").hide();
        $("#renovationStylereq").change(function () {
            var a=$(this).attr("selected","selected").val();
            if(a==1){
                $("#cellphone").show();
                $("#email").hide();
                $("#unlockme").hide();
            }else if(a==2){
                $("#cellphone").hide();
                $("#email").show();
                $("#unlockme").hide();
            }else{
                $("#email").hide();
                $("#cellphone").hide();
                $("#unlockme").show();
            }

        });

    })
</script>
</body>
</html>
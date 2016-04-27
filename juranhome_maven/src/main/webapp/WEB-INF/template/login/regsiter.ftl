<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html id="ng-app" ng-app="app" ng-cloak>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>login</title>
    <#--include commonhead-->
    <#include '/common/commonhead.html'/>
    <script src="${baseUrl}/angularjs/regsiter/regsiter-app.js" ></script>
	<script src="${baseUrl}/js/user/jquery.cookie.js"></script>
	
    <link rel="stylesheet" href="${baseUrl}/css/regsiter.css">
    <script src="${baseUrl}/js/user/regsiter.js"></script>
</head>
<body  ng-controller="ctrl">
<input type="hidden" id="loginze" value="2"/>
    <div class="regsiter_bj">
      <div id="center">
        <div class="regsiter_top">
             <ul class="reg_logo">
            	<a href="${baseUrl}/"><li class="shlo"><img src="${baseUrl}/images/login/logina_03.png"></li></a>
            	<a href="${baseUrl}/"><li class="shlo"><img src="${baseUrl}/images/login/logina_05.png"></li></a>
            	<a href="${baseUrl}/"><li class="shlo"><img src="${baseUrl}/images/login/logina_07.png"></li></a>
        	</ul>
        </div>
        <div class="regsitera">
            <ul class="handover">
                 <p class="handover">注册账号</p>
        	</ul>
        	<ul class="accounttype">
        		<li class="accoua">请选择你的账号类型：</li>
        		<li class="accoub">
        			<input type="radio" name="1" value="1" ng-model=""><span  id="remembe" class="xieyi">我是消费者</span>
	                <input type="radio" name="1" value="2" ng-model=""><span class="xieyi">我是设计师</span>
        		</li>
        	</ul>
        	<div class="mezhuce">
                <a onclick="register(1)" class="mobilereg defaults" href="javascript:void(0)">手机注册</a>
                <a onclick="register(2)" class="emailereg" href="javascript:void(0)">邮箱注册</a>
            </div>
<!--mobile phone Register-->
            <div class="contact_zhuce" id="hope">
                <form name="form1" method="post" ng-submit="submit($event)">
                    <input type="hidden" id="type" name="type" ng-model="userRegisteType">
                    <ul>
                        <li>
                            <input type="text" id="youremail" placeholder="手机号码：" maxlength="11" onBlur="checkmail()" ng-blur="blur()" required autocomplete="off" ng-model="phone" />
                            <span class="tips" id="divmail"></span>
                        </li>
                        <li>
                            <input type="yanzh" name="yanzh" placeholder="验证码：" maxlength="6" required autocomplete="off" ng-model="captcha" />
                            <input type="button"  class="yanzm" id="getting" value="点击获取验证码" ng-click="Captcha()" >
                            <span class="hyanzm" id="divpassword2"><font class="tips_false"></font></span>
                        </li>
                        <li>
                            <input type="password" name="yourpass" id="yourpass" placeholder="密码：" maxlength="12" onblur="checkna()" required autocomplete="off" ng-model="name" />
                            <span class="tips" id="passwor"></span>
                        </li>
                        <li>
                            <input type="password" name="pass" id="pass" placeholder="确认密码：" maxlength="12" onBlur="checkpsd1()" required autocomplete="off" ng-model="password" />
                            <span class="tips" id="passworb"></span>
                        </li>
                        <div class="yuedu"><input type="checkbox"><span class="xieyi">我已阅读并接受<a  target="_blank" href="${baseUrl}/login/protocol">《居然在线注册协议》</a></span></div>
                    </ul>
                    <b class="btn"><input type="submit" value="注册" ng-disabled="!phone||!name||!password||!captcha"/></b>
                </form>
                <div class="other">
                    <span></span>
                    <p class="employ">使用其它方式注册</p>
                    <span></span>
                </div>
                <div class="third-party">
                  	<a href="https://graph.qq.com/oauth2.0/authorize?client_id=100570502&response_type=code&scope=get_user_info&redirect_uri=&state=juran"><img src="${baseUrl}/images/login/logina_13.png"></a>
                	<a href="https://open.weixin.qq.com/connect/qrconnect?appid=wx43be110e367dc022&redirect_uri=http://www.juran.cn/member/qqlogin.htm&response_type=code&scope=snsapi_login&state=3d6be0a4035d839573b04816624a415e#wechat_redirect"><img src="${baseUrl}/images/login/logina_15.png"></a>
                	<a href="https://api.weibo.com/oauth2/authorize?client_id=2356002792&response_type=code&redirect_uri="><img src="${baseUrl}/images/login/logina_17.png"></a>
                	<a href="https://api.weibo.com/oauth2/authorize?client_id=2356002792&response_type=code&redirect_uri="><img src="${baseUrl}/images/login/logina_19.png"></a>
                </div>
                <div id="returnlogin"><a href="${baseUrl}/login/index" >已有账号 返回登陆!</a></div>
            </div>
  <!--E-Mail Register-->
            <div class="contact_zhuce" id="email">
                <form name="form1" method="post" ng-submit="submit($event)" class="ng-pristine ng-invalid ng-invalid-required">
                    <input type="hidden" id="type" name="type" ng-model="userRegisteType" class="ng-pristine ng-valid">
                    <ul>
                        <li>
                            <input type="text" id="emailm" placeholder="邮箱：" onblur="kmail()" required="" autocomplete="off" ng-model="phone" class="ng-pristine ng-invalid ng-invalid-required">
                            <span class="tips" id="dmail"></span>
                        </li>
                        <li>
                            <input type="password" name="yourpass" id="yourpass" placeholder="密码：" onblur="checkna()" required="" autocomplete="off" ng-model="name" class="ng-pristine ng-invalid ng-invalid-required">
                            <span class="tips" id="divpassworda"></span>
                        </li>
                        <li>
                            <input type="password" name="pass" id="pass" placeholder="确认密码：" onblur="checkpsd1()" required="" autocomplete="off" ng-model="password" class="ng-pristine ng-invalid ng-invalid-required">
                            <span class="tips" id="divpasswordb"></span>
                        </li>
                        <li>
                            <input type="yanzh" name="yanzh" placeholder="验证码：" maxlength="6" required="" autocomplete="off" ng-model="captcha" class="ng-pristine ng-invalid ng-invalid-required">
                            <i>87136</i>
                            <span class="hyanzm" id="divpassword2"><font class="tips_false"></font></span>
                        </li>
                        <div class="yuedu"><input type="checkbox"><span class="xieyi">我已阅读并接受<a haref="#">《居然在线注册协议》</a></span></div>
                    </ul>
                    <b class="btn"><input type="submit" value="注册" ng-disabled="!phone||!name||!password||!captcha" disabled="disabled"></b>
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
                <div id="returnlogin"><a href="${baseUrl}/login/index" >已有账号 返回登陆!</a></div>
            </div>
        </div>
        <#include '/common/loginfooter.html'/>
    </div>
  </div>
    
<!--Registered title switch--> 
    <script language="javascript">
	    $('.mezhuce a').click(function(){
	        $(this).addClass('mezhuce defaults').siblings().removeClass('mezhuce defaults');
	    });
	    
	    $("#email").hide();
	    	function register(type){
	    		$(":input[type=text]").val("");
	    		$(":input[type=password]").val("");
	    		$(".tips").html("");
		        if(type==1){
		            $("#email").hide();
		            $("#hope").show();
		        }else{
		            $("#email").show();
		            $("#hope").hide();
		        }
	    }
</script>
</body>
</html>


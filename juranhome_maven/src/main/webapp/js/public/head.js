/*++++++++++++++++++++++++++++++++++++++++++++
 * commonality js(login、logout、The browser version of judgment)
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2016-04-19
 *+++++++++++++++++++++++++++++++++++++++++++++*/
//login 
userLogin = function()
{   
	$("#LIOF").attr("style", "width:100%; height:100%; display:block;position:fixed;top:0;left:0;");
	$("#logInOutFrame").attr("src", loginPaht()+"/SSO_login.html?caller=shejijia&browser_type=windows"); 	
};

//logout
userLogoug = function() {
	$("#logInOutFrame").attr("src", logoutPath()+"/member/sso_login_out.htm");
	clearCookie("users");
	setTimeout('logout()',1500);
};

function logout(){
	location.href=baseUrl+"/login/loginOut";
}
refrashParent = function() {
	alert("refrash");
};

$(document).ready(function(){
	
	$('.versioncue').hide();
	//determine the current browser version
	browserWarning();
	//according to the different browser equipment to download the browser
	browserRedirect();
	
	$(window).scroll(function(event) {
		if($(window).scrollTop() > 50){
			$('#naver').css({
					'position':'fixed',
					'top':'0',
					'left':'0',
					'width':'100%',
					'z-index':'9999',
					'box-shadow':'0 0 15px rgba(0,0,0,0.8)'
				})
		}else{
			$('#naver').css({
					'position':'absolute',
					'top':'50px',
					'width':'100%',
					'z-index':'999',
					'box-shadow':'0 0 15px rgba(0,0,0,0.3)'
				})
		}
	});
	

	$(document).each(function(){  
	    $("#menu a").each(function(){  
	        $this = $(this);  
	        if($this[0].href==String(window.location)){  
	            $this.addClass("activeaa");  
	        }  
	    });  
	});  
	
	//login success page jump
    $(window).on('message', function(e) {
    	var dataBase64 = Base64.decode(decodeURIComponent(e.originalEvent.data).replace(/(\s*)/g, ""),'utf-8');
    	var memberType = JSON.parse(dataBase64).Member_Type;
    	
    	setCookie('users', decodeURIComponent(e.originalEvent.data), 7 , "/" );
    	if(memberType == "designer"){
        	location.href = baseUrl+"/mark/index";
    	}
    	else{
       		location.href = location.pathname;
    	}
    });
    
    //case search page jump
    $('#searchbox').click(function(){
		if($('#searchKeyWord').val()==''){
			$(this).attr("disabled");
		}else{
			var keyWord = $('#searchKeyWord').val();
			location.href=baseUrl+"/caseBase/index/keyWord/"+keyWord;
		}
	});
    
    $('.logInOutFrame button').click(function(){
		$('.logInOutFrame').css({"display":"none"});
	});
    
}); 
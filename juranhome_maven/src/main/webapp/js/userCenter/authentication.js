$(function(){
    //name
    var name=/^[\u4e00-\u9fa5]{2,10}$/;
    var num=/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
    var id=/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
    ok1=true;
    ok2=true;
    ok3=true;
    ok4=false;
    ok5=false;
    

	

    $("#lastname").focus(function(){
        $(this).next().text('请输入2-10个汉字').removeClass('state1').addClass('state2');
    }).blur(function(){
        if(!name.test($(this).val())){
            ok1=false;
            $(this).next().text('请输入2-10个汉字').removeClass('state1').addClass('state3');
            $(this).attr('style','border: 1px red solid');

        }else{
            ok1=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
            $(this).attr('style','border: 1px #ccc solid');
        }

    });
    //phone
    $("#phone").focus(function(){
        $(this).next().text('请输入11位手机号码').removeClass('state1').addClass('state2');
    }).blur(function(){
        if(!num.test($(this).val())){
        	ok2=false;
            $(this).next().text('请输入正确的格式').removeClass('state1').addClass('state3');
            $(this).attr('style','border: 1px red solid');
        }else{
            ok2=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
            $(this).attr('style','border: 1px #ccc solid');
        }

    });
    //id-card
    $("#id-card").focus(function(){
        $(this).next().text('请输入正确的身份证号码').removeClass('state1').addClass('state2');
    }).blur(function(){
        if(ValidateNumber($(this).val())){
        	 $(this).next().text('输入成功').removeClass('state1').addClass('state4');
             $(this).attr('style','border: 1px #ccc solid');
             ok3=true;
        }else{
        	ok3=false;
            $(this).next().text('身份证输入格式错误').removeClass('state1').addClass('state3');
            $(this).attr('style','border: 1px red solid');
        }

    });
    /**
    //getCode
    $("#getCode").focus(function(){
        $(this).next().text('请输入您收到的验证码').removeClass('state1').addClass('state2');
    }).blur(function(){
        if(($(this).val())==''){
            $(this).next().text('验证码不能为空').removeClass('state1').addClass('state3');
            $(this).attr('style','border: 1px red solid');
        }else{
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
            $(this).attr('style','border: 1px #ccc solid');
            ok3=true;

        }

    });**/
   
    //The submit button, all validation through before submission
    $('.button').click(function(){
    	 if($('input[type=file]').val()){
    		 ok5=true;
    	 }
    	 var lastname=$("#lastname").val();
    	 var phone=$("#phone").val();
    	 var idcard=$("#id-card").val();
    	 var idImageChecked = checkIDImages();
		if($('#phone2').val()&&$('#phone2').val().length>0){
			if(ok1&&ok2&&ok3&&lastname&&idcard&&idImageChecked){
				$(form).submit();
				$('#btnSubmit').attr('disabled',true);
		    }else{
		        alert('表单填写有误或不完整，请检查');
		        return false;
		    }
		}else{
			if(ok1&&ok2&&ok3&&lastname&&phone&&idcard&&idImageChecked){
				$(form).submit();
				$('#btnSubmit').attr('disabled',true);
		    }else{
		        alert('表单填写有误或不完整，请检查');
		        return false;
		    }
		}
        
    });
   
    //TestGetCode
	$('#getting').click(function(){
		 count=60;
		 verificationcode();
	});
    	  
})

function checkIDImages()
{
	var result = false;
	var imgCount = 0;
	var frontImg = baseUrl+"/images/userCenter/facade.png";
	var backImg = baseUrl+"/images/userCenter/backfaces.png";
	var holdImg = baseUrl+"/images/userCenter/shouchi.png";
	
	if($('#id-img-front').attr("src") != frontImg)imgCount++;
	if($('#id-img-back').attr("src") != backImg)imgCount++;
	if($('#id-img-holder').attr("src") != holdImg)imgCount++;
	
	result = imgCount >= 3;
	
	return result;
}

function previewImage(file,type)
{
	var matchType = 0;
	if(file.files[0].type=="image/jpeg")matchType++;
	if(file.files[0].type=="image/png")matchType++;
	if(file.files[0].type=="image/gif")matchType++;
        if(matchType == 0 || file.files[0].type==''){
            alert("您上传的图片格式有误！请选择png、gif、jpg、bmp格式的图片");
            return false;
        }
        var reader = new FileReader();
        reader.readAsDataURL(file.files[0]);
        reader.onload = function(evt){

            var srcUrl=evt.target.result;
            if(type==1){
                $("#id-img-front").attr("src",srcUrl);
            }else if(type==2){
                $("#id-img-back").attr("src",srcUrl);
            }else{
            	$("#id-img-holder").attr("src",srcUrl);
            }
           
        }

}

function ValidateNumber(cardid) {
	//身份证正则表达式(18位)
	var isIdCard2 = /^[1-9]\d{5}(19\d{2}|[2-9]\d{3})((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])(\d{4}|\d{3}X)$/i;
	var stard = "10X98765432"; //最后一位身份证的号码
	var first = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]; //1-17系数
	var sum = 0;
	if (!isIdCard2.test(cardid)) {
		//alert("身份证号码填写不正确");
		//$("#id-card").focus();
		return false;
	}
	var year = cardid.substr(6, 4);
	var month = cardid.substr(10, 2);
	var day = cardid.substr(12, 2);
	var birthday = cardid.substr(6, 8);
	if (birthday != dateToString(new Date(year + '/' + month + '/' + day))) { //校验日期是否合法
		//alert("身份证号码填写不正确");
		//$("#id-card").focus();
		return false;
	}
	for (var i = 0; i < cardid.length - 1; i++) {
		sum += cardid[i] * first[i];
	}
	var result = sum % 11;
	var last = stard[result]; //计算出来的最后一位身份证号码
	if (cardid[cardid.length - 1].toUpperCase() == last) {
		return true;
	} else {
		//alert("身份证号码填写不正确");
		//$("#id-card").focus();
		return false;
	}
	//日期转字符串 返回日期格式20080808
	function dateToString(date) {
		if (date instanceof Date) {
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			month = month < 10 ? '0' + month: month;
			var day = date.getDate();
			day = day < 10 ? '0' + day: day;
			return "" + year + month + day;
		}
	return '';
	}
};






function verificationcode(){
	
	var btn = $('#getting');
	var resend = setInterval(function(){
	count--;
   if (count > 0){
       btn.text(count+"s后重新发送验证码");
       //alert();
       $.cookie("captcha", count, {path: '/', expires: (1/86400)*count});
   }else{
   	 clearInterval(resend);
   	 btn.text("点击获取验证码").removeAttr('disabled style');
   }
  }, 1000);
 btn.attr('disabled',true).css('cursor','not-allowed');
}

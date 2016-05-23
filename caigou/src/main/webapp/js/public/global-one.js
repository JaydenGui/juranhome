'use strict';
$(function() {
	$(function City_group(){
		/*切换城市部分的JS代码   开始*/
		$('.City-group .cut').click(function(event) {
			$('.City-group-one').css('display', 'block');
		});
		$('.City-group-one li a').click(function(event) {
			$('.City-group-one').css('display', 'none');
			var sss = $(this).html();
			$('.City-group .city .span').html(sss);
		});
		$('.City-group .other').click(function(event) {
			$('.City-group-one').css('display', 'none');
			$('.City-group .submitCT').css('display', 'block');
		});
		var eee = $('.submitCT input').attr('value');
		$('.City-group .submitCT .submit').click(function(event) {
			$('.City-group .submitCT').css('display', 'none');
			var rrr = $('.submitCT input').val();
			var qqq = $('.submitCT input').attr('value','');
			var thspan = $('.span').html();
			qqq = rrr;
			//alert(qqq);
			//alert(rrr);
			if(rrr==''){
				alert('请输入您所在的城市！')
				$('.city .span').html(thspan);
			}else{
				$('.city .span').html(qqq);
			}
		});
		$('.City-group .input').mouseleave(function(event) {
			$(this).css('display', 'none');
		});
		$(document).ready(function(){
			//通过调用新浪IP地址库接口查询用户当前所在国家、省份、城市、运营商信息
			$.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js',function(){     
				$(".City-group .span").html(remote_ip_info.city);    
			});
		});
		/*切换城市部分的JS代码   开始*/
		//alert('dfdf');
	});
	/*DIY 部分*/
	var flag=true;
	$('.diy').click(function(event) {
		if (flag == true) {
			$('.diy-box').animate({'top':'-86'}, 400);
			$(this).animate({'bottom':'-60'}, 400);
			flag = false;
		}else{
			$('.diy-box').animate({'top':'-366'}, 400);
			$(this).animate({'bottom':'-120'}, 400);
			flag = true;
		};
	});
	/*DIY 部分*/
	/*个人中心部分*/
	$('.personage').hover(function(){
		$('.per-content').stop().fadeIn();
	}, function() {
		$('.per-content').stop().fadeOut(100);
	});
	/*个人中心部分*/
	
	$(".nav-content li a").each(function(){  
        if($(this)[0].href==String(window.location)){  
        	$(this).addClass("nav-first");
        	$(this).click(function(){});
        }  
    });  
	
	//获取窗口的高度
	var h1 = $(window).height();
	$(window).scroll(function(event) {
		var h2 = $(window).scrollTop();
		if(h2 > h1/2){
			$('.bottom_tools').fadeIn(800);
		}else{
			$('.bottom_tools').fadeOut(800);
		}
	});
	$('.bottom_tools').click(function(event) {
		$('html,body').animate({scrollTop:0}, 600);
	});
	
	
	/*Post Your WANT 首页发布需求*/
	$('#requ').click(function(event) {
		$('.requirements').slideToggle("fast");
	});
	

	/*发布需求关闭按钮*/
	$('#upone').click(function(event) {
		$('.requirements').css('display', 'none');
	});
	
});

'use strict';
$(document).ready(function() {
	$(function() {
		/*DIY 部分*/
		$('.dropdown,.nav li').hover(function(event) {
			$(this).css({'background':'#ccc'});
			$(this).children('.dropdown-menu').addClass('open');
			$('.nav li').children('.dropdown-menu').css({'borderTop':'2px solid #007AFF'});
		},function(event){
			$(this).css({'background':'#F5F3F3'});
			$(this).children('.dropdown-menu').removeClass('open');
		});

		$('.clip-search-3 a').click(function(event) {
			$('.clip-search').toggle();
			/*$('.clip-search').css({'borderTop':'2px solid #007AFF'});*/
		});
		$(".clip-search input").focus(function(){
			$(this).addClass('add_input');
		});
		$(".clip-search input").blur(function(){
			$(this).removeClass('add_input');
		});
	});
});
$(document).ready(function(){
	$(function() {
		var  color = ['#ffffff','#f1ebe5','#f4e8b1','#f4cdb0','#eca9b1','#f4c6cf','#dfe6ae','#bcd1e6','#ccb8e0','#999999','#d6c5b3','#d0d0d0'];
		$('.color ul li').each(function(index, el) {
			//alert(index);
			$(el).css({'background':color[index]});
		});
		$('.color ul li').click(function(event) {
			//alert('d');
			$(this).addClass('color-li-bg').siblings().removeClass('color-li-bg');
		});
		var margin = 10;
			var li=$(".pli");
			var li_W = li[0].offsetWidth+margin;//practical width
			function cataract(){
			  	var h=[];
			  	var n = document.documentElement.offsetWidth/li_W|0;//Accommodate block
			  	for(var i = 0;i < li.length;i++) {//li cycle
			    	li_H = li[i].offsetHeight;//one li height
			    	if(i < $('#lxf-box').width()/li_W) {
			     		h[i]=li_H;//An array of
			     		li.eq(i).css("top",0);//top=0;
			      		li.eq(i).css("left",i * li_W);//left=i*li_W
			      	}else{
			     		 min_H =Math.min.apply(null,h) ;//min heihgt
			     		 minKey = getarraykey(h, min_H);
					     h[minKey] += li_H+margin ;
					     li.eq(i).css("top",min_H+margin);
					     li.eq(i).css("left",minKey * li_W); 
			    	}
			  	}
			}
			
			/* to calculate the height of the minimum value is an array of p1 */
			function getarraykey(s, v) {for(k in s) {if(s[k] == v) {return k;}}}
			/*There must use onload, because the picture just didn't know not finish loading height*/
			window.onload = function() {cataract();};
			/*Also run when the browser window to change the function*/
			window.onresize = function() {cataract();};
			
			$('.tr-current-one').click(function(event) {
				$('.box').addClass('show-box-current').siblings().removeClass('show-box-current');
				$(this).addClass('tr-current').siblings().removeClass('tr-current');
			});
			$('.tr-current-two').click(function(event) {
				$('.show-list').addClass('show-box-current').siblings().removeClass('show-box-current');
				$(this).addClass('tr-current').siblings().removeClass('tr-current');
			});
			$('.content a').click(function(event) {
				$(this).addClass('content-click').siblings().removeClass('content-click');
			});
	});
})

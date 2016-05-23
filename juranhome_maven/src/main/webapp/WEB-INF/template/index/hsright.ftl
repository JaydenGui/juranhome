<#assign baseUrl=request.contextPath />
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<!-- Cloud Slider Style Sheet -->
<link rel="stylesheet" href="${baseUrl}/css/index/hs_cloudslider.css"
	type="text/css">

<!-- Importing jQuery -->
<script src="${baseUrl}/js/index1/jquery.js" type="text/javascript"></script>

<!-- Cloud Slider Library -->
<script src="${baseUrl}/js/index1/cloudslider.jquery.js"
	type="text/javascript"></script>
</head>
<body style="padding: 0;">
	<div id="cloudslider" style="margin: 0 auto;">
		<div class="kr-sky" data-duration="10000" data-transition="all"
			data-ken="scalefrom:1.2; positionfrom:left_center; scaleto:1.2; positionto:right_center; easing:linear; duration:20000;">
			<img src="${baseUrl}/images/index/hs-bg.jpg" class="sky-background"
				alt="Slide background" /> <img class="kr-cloud kr-cloudmad"
				style="top: 200px; left: 550px; filter: none;"
				src="${baseUrl}/images/index/hs_computer.png" />
			<div class="kr-cloud kr-cloudmab"
				style="top: 220px; left: 550px; border: 0px solid #fff; background: #000"
				data-transitionout="offsetx:80;offsety:top;duration:1000;easing:easeInOutQuart;scalex:0;scaley:0;transformorigin:20% 20% 0;">
				<div class="kr-cloud kr-cloudmab"
					style="top: 220px; left: 585px; border: 0px solid #fff; background: #000"
					data-transitionout="offsetx:80;offsety:top;duration:1000;easing:easeInOutQuart;scalex:0;scaley:0;transformorigin:20% 20% 0;">
					<video width="520px" height="300px" loop autoplay controls>
						<source src="${baseUrl}/mp4/hs02.mp4" type="video/mp4">
					</video>
				</div>
				<span class="kr-cloud"
					style="top: 100px; left: 100px; font-weigh: 100px; text-shadow: 2px 2px 2px #101c2c; letter-spacing: 1px; font-family: '微软雅黑'; font-size: 32px; color: #fff; white-space: nowrap;">做“最准”的3D云设计</span>
				<span class="kr-cloud"
					style="top: 140px; left: 102px; font-family: '微软雅黑'; text-shadow: 2px 2px 2px #101c2c; font-size: 16px; color: #fff; white-space: nowrap;">真实商品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;快速渲染&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一键出图</span>
				<span class="kr-cloud"
					style="top: 170px; left: 102px; font-family: '微软雅黑'; font-size: 16px; color: #0078EB; white-space: nowrap;"><a
					href="${baseUrl}/3Dscheme/create3D" target="_blank">立即开启设计之旅</a></span>
			</div>
		</div>
	</div>
	<script>
		var timer = window.setInterval(function() {
			if ('visible' == window.document.visibilityState) {
				$("#cloudslider").cloudSlider({
					width : 1280,
					height : 720,
					onHoverPause : false,
					fullSize : true
				});
				clearInterval(timer);
			}
		}, 200);
	</script>
</body>
</html>

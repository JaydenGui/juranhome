<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
  <meta http-equiv="X-UA-Compatible" content="IE=9" />
  <title>设计家在线设计平台</title>
  	<link rel="stylesheet" href="${baseUrl}/css/index/normalize.css">
  <link rel="stylesheet" href="${baseUrl}/css/index/superslides.css">
  <link rel="stylesheet" href="${baseUrl}/css/index/layout.css">
  
  <style type="text/css">
		.container{padding-left:0px!important;}
	    html, body {height: 100%; margin:0;padding:0; width:100%; }
        iframe {margin:0; padding:0; height:50%; width:100%;}
        .logo .logoleft{margin-left:32px;}
	 	.navbar-tools .indexlogohd{margin-right: 25px!important;}
	 	.navbar-tools .nadso{left:39.65%!important;}
  </style>
    
		
   <!-- Cloud Slider Style Sheet -->
   <link rel="stylesheet" href="${baseUrl}/css/index/cloudslider.css" type="text/css">

   <!-- Importing Google Fonts -->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>	
		

  <#include '/common/commonhead.html'/>
  <script > var baseUrl = "${baseUrl}";</script>
  <script src="${baseUrl}/js/index/cloudslider.jquery.js" type="text/javascript"></script>
  <script type="text/javascript" src="${baseUrl}/js/index/owl.carousel.js"></script>

  
	</head>
	<body>
	   	<!-- header end -->
	   <div id="cloudslider">
	   		<!-- header start-->
		   	<div style="height:93px;display: block;">
		   	   <#include '/common/header.html'/>
		   	</div>
		       
		       <div class="kr-sky" >
		            <a href="${baseUrl}/caseBase/index" target="_blank"><img style="cursor: pointer;" onclick="window.open(baseUrl+'/caseBase/index')" class="sky-background" src="${baseUrl}/images/index/anli.jpg"></a>
		        </div>
	
				<div class="kr-sky" >
	            <a href="${baseUrl}/designer/index" target="_blank"><img style="cursor: pointer;" onclick="window.open(baseUrl+'/designer/index')" class="sky-background" src="${baseUrl}/images/index/slidebg11.jpg"></a>
	            </div>
				
				<div class="kr-sky">
				
	            <a href="javascript:void(0);">
	            <img style="cursor: pointer;" class="sky-background" src="${baseUrl}/images/index/slidebg14.jpg">
	            <div class="kr-cloud" style="top:-240px; left:90px; width:100%;" data-transitionin="easing:swing; duration:1000;" data-transitionout="easing:easeOutCubic; duration:1000">
	            <img src="${baseUrl}/images/index/qrcode-word.png" style="filter:
    progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='crop');
	            "></div>
	            </a>
	            </div>
	            
				<div class="kr-sky">
	            <a  href="${baseUrl}/3Dscheme/create3D" target="_blank"><img style="cursor: pointer;" onclick="window.open(baseUrl+'/3Dscheme/create3D')" class="sky-background" src="${baseUrl}/images/index/slidebg13.jpg"></a>
	            </div>
			
		
	    <!-- footer start-->
		 <div id="footer_active" style="position: fixed; height:10px; width: 100%; left:0; bottom:0; z-index: 100000; background: url(/images/index/transparent.png) repeat">
		 	
		 </div>
	     <div id="footer" style="display: none; position:fixed; bottom:0px; left:0;  z-index: 10000; width:100%;">
			<#include '/common/footer.html'/>
		 </div>
</div>

<!--  footer end-->
	<script>
	    $(function() {
	   	 	$("#footer").mouseleave(function () {
	            $(this).stop(true).fadeOut(600);
	        });
	        
	        $("#menu a").eq(0).addClass("activeaa");	
	        
	        $("#cloudslider").cloudSlider({
				width: $(window).width,
				height: $(window).height,
				onHoverPause: false,
				fullSize: true,
				responsive: true
			});
	    });       
  	</script>
	</body>
</html>
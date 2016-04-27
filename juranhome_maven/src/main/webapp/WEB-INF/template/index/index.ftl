<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html ng-app="app" id="ng-app" ng-cloak>
<head ng-controller="seoCtrl">
 
  <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
  <meta http-equiv="X-UA-Compatible" content="IE=9" />
  <link rel="stylesheet" href="${baseUrl}/css/index/normalize.css">
  <link rel="stylesheet" href="${baseUrl}/css/index/superslides.css">
  <link rel="stylesheet" href="${baseUrl}/css/index/layout.css">
  
  <style type="text/css">
	 
  </style>
  
  	<#include '/common/commonhead.html'/>
  	<script src="${baseUrl}/angularjs/index/index-app.js" charset="utf-8"></script>
</head>
<body ng-controller="ctrl">
<!--header-->


<!--content-->
<div id="slides">
<div style="height:88px;display: block;">
	<div style="position:position;z_index:999999999;">
		<#include '/common/header.html'/></div>
	</div>
  <ul class="slides-container" style="top:7px;">
  	<a class="item" href="${baseUrl}/caseBase/index/" target="_blank" > 
       <li>
        <div class="container">
	        <div class="iframeContainer">
	          <iframe  src="${baseUrl}/caselibrary" width="100%" height="100%" marginheight="0" marginwidth="0" scrolling="no" style="top:0%; left:0%; width:100vw; height:100vh" ></iframe>
	        </div>
         </div>
       </li>
      </a>
      <li>
        <img src="${baseUrl}/images/index/slidebg1.jpg" alt="">
        <div class="container" style="position:relative" id="contwe">
         <ul class="viewFrame">
          <li><h3 class="p01title">选“最优”的设计师</h3></li>
          <li><p class="p01p">服务真诚&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;经验丰富&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;理念创新</p></li>
          <li><iframe src="${baseUrl}/index3d" class="p01iframe" width="100%" scrolling="no" allowtransparency="true"  frameborder="0"></iframe></li>
          <li><div class="caselibraryframe" ><a href="${baseUrl}/designer/index/" class="caselibrarybn"></a></div></li>
          </ul>
        </div>
      </li>
      <a class="item" href="javascript:();">
      <li>
        <div class="container">
        <div class="iframeContainer">
          <iframe src="${baseUrl}/appright" width="100%" height="100%" marginheight="0" marginwidth="0" scrolling="no" style="top:0%; left:0%; width:100vw; height:100vh" ></iframe>
        </div>
        </div>
      </li>
	  </a>	
      <a class="item" href="javascript:();">
       <li>
        <div class="container">
        <div class="iframeContainer">
          <iframe  src="${baseUrl}/hsright" width="100%" height="100%" marginheight="0" marginwidth="0" scrolling="no" style="top:0%; left:0%; width:100vw; height:90vh" ></iframe>          
          </div>
          </div>
       </li>
      </a>
    </ul>
    <nav class="slides-navigation">
      <a href="javascript:void(0);" class="next">
        <i class=""><img style="position: absolute;bottom: 9px;display: block;left: 12px;" src="${baseUrl}/images/index/next_03.png" alt=""></i><!-- icon-chevron-right -->
      </a>
      <a href="javascript:void(0);" class="prev">
        <i class=""><img style="position: absolute;bottom: 9px;display: block;right: 15px;" src="${baseUrl}/images/index/next_06.png" alt=""></i>
      </a>
    </nav>
    <div id="footer_active" style="position: absolute; height:10px; width: 100%; left:0; bottom:0px; z-index: 100000; background-color: transparent; opactiy:1;"></div>
    <div id="footer" style="display: none; position:fixed; bottom:0px; left:0;  z-index: 10000; width:100%;">
		<#include '/common/footer.html'/>
	</div>
 
 <!--footer-->
 

	
  <script type="text/javascript" src="${baseUrl}/js/index/owl.carousel.min.js"></script>
  <script type="text/javascript" src="${baseUrl}/js/index/owl.carousel.js"></script>

  <script src="${baseUrl}/js/index1/jquery.easing.1.3.js"></script>
  <script src="${baseUrl}/js/index1/jquery.animate-enhanced.min.js"></script>
  <script src="${baseUrl}/js/index1/jquery.superslides.js" type="text/javascript" charset="utf-8"></script>
  <script src="${baseUrl}/js/index1/jquery.hammer.min.js"></script>
  <script src="${baseUrl}/js/index1/application.js"></script>

  
  <script>
    $(function() {     
	      $('#slides').superslides({
	        hashchange: true
	      });
	      
	      $("#footer").mouseleave(function () {
	          $(this).stop(true).fadeOut(600);
	      });
	      $("#menu a").eq(0).addClass("activeaa");	
	     
	      $('#slides').on('mouseover', function() {
	      	$(this).superslides('stop');
	      });
	      
	      $('#slides').on('mouseout', function() {
	          $(this).superslides('start');
	      });   
	      
		  $('#slides').on('mouseover', function() {
		    $(this).superslides('stop');
		  });

   		  $('#slides').on('mouseout', function() {
    		$(this).superslides('start');
    	  });
    	  
    	  $("#footer").mouseleave(function () {
            $(this).stop(true).fadeOut(600);
          });
        
          $("#menu a").eq(0).addClass("activeaa");
    });

  </script>
</body>
</html>

<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html  ng-app="app" id="ng-app" ng-cloak>
	<head lang="en">
	     <title>设计家在线设计平台</title>
		 <meta charset="UTF-8">
	     <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	     <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
         <meta http-equiv="X-UA-Compatible" content="IE=9" />
         <link rel="icon" href="${baseUrl}/images/global/favicon.ico" type="image/x-icon" media="screen"/>
        
	     <link rel="stylesheet" type="text/css" href="${baseUrl}/css/index/skin_modern_warm.css"/>
	     <link href="${baseUrl}/css/index/conter.css" rel="stylesheet" />
	     <link rel="icon" href="${baseUrl}/images/global/favicon.ico" type="image/x-icon" /> 
	    
	      <!-- include angular file -->
		  <script type="text/javascript">
		     var baseUrl="${baseUrl}";
		  </script>
	    
	     <!--angular Ie8 compatible-->
		 <script src="${baseUrl}/angularjs/js/ie-shiv.js" charset="utf-8" type="text/javascript"></script>
		 <script src="${baseUrl}/angularjs/js/json2.js" charset="utf-8" type="text/javascript"></script>
	    
	     <script src="${baseUrl}/js/public/jquery-1.11.2.min.js" charset="utf-8" type="text/javascript"></script>
		 <script src="${baseUrl}/js/public/global-one.js" charset="utf-8" type="text/javascript"></script>
		 <script src="${baseUrl}/js/user/jquery.cookie.js"></script>
	    
		 <script src="${baseUrl}/angularjs/js/angular.min.js" charset="utf-8" type="text/javascript"></script>
		 <script type="text/javascript" src="${baseUrl}/angularjs/3DScheme/3DScheme-app.js"></script>
		 <script src="${baseUrl}/angularjs/js/filter.js" charset="utf-8" type="text/javascript"></script>
	</head>
	<body ng-controller="ctrl">
		<div  >
		    <#include '/common/homeStyleheader.html'/>
		    <input id="hid_asset_id" type="hidden"  value="{{asset_id}}" /> 
		    <input id="hid_design_id" type="hidden"  value="{{design_id}}" /> 
		    <input id="hid_project_id" type="hidden"  value="{{project_id}}" /> 
		    <#if !users?exists>
		        <input id="hid_jwt" type="hidden" value="" />
		    <#else>
		        <input id="hid_jwt" type="hidden" value="${users.diy_jwt}" />
		    </#if>		
		</div>
		
		<iframe id="3DiFrame" style="width:100vw;height:90vh; background-size:100%; margin-top:0px;" border=2 frameborder=0 width=100% height=806px marginheight=0 marginwidth=0 scrolling=no></iframe>
          
		 <script>
		 	$(function() {
		 		var assetId = $('#hid_asset_id').val();
		 		var designId = $('#hid_design_id').val();
		 		var projectId = $('#hid_project_id').val();
		 		var jwt = $('#hid_jwt').val();

				//var url = 'http://uat-3d.homestyler.com/?brand=ezhome&mode=iframe&jwt=' + jwt;
		 	    //var url = 'http://ezhome-alpha-3d.homestyler.com/?brand=ezhome&mode=iframe&jwt=' + jwt;
		 	    var url = 'http://uat-3d.homestyler.com/?brand=ezhome&mode=iframe&jwt=' + jwt;
			    url += '&acs_project_id=' + projectId + '&hs_design_id=' + designId + '&acs_asset_id=' + assetId; 	
		 		$("#3DiFrame").attr('src', url);
		 	});
             
		 	
		 	window.addEventListener('message',function(e){ 
                  if(!e.data.eData){
		 			var asset_id=e.data.acs_asset_id?e.data.acs_asset_id:0;
		 			var project_id=e.data.acs_project_id?e.data.acs_project_id:0;
		 			var hs_design_id=e.data.hs_design_id?e.data.hs_design_id:0;
		 			
		 			var url= baseUrl+"/3Dscheme/open3Dscheme/hs_design_id/"+hs_design_id+"/acs_asset_id/"+asset_id+"/acs_project_id/"+project_id+"/";
		 			
		 			history.pushState(new Object(),document.title,url);
		 		}
		 	});
		 	
		 </script>
  </body>
</html>
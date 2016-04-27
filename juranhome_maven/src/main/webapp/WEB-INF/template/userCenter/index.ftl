<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<!--[if IE 8]><html class="ie8 no-js" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9 no-js" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js" ng-app="app" id="ng-app" ng-cloak>
	 <head ng-controller="seoCtrl">
		
		<!-- start: META -->
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!-- end: META -->
		
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/font-awesome.min.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/style.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/main-responsive.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/all.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/bootstrap-colorpalette.css">
		<!-- <link rel="stylesheet" href="${baseUrl}/css/userCenter/perfect-scrollbar.css"> -->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/theme_light.css" type="text/css" >
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/tietolomake.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/detail.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/fileinput.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/mymoney.css">
	
		
		<!--<link rel="stylesheet" href="${baseUrl}/css/userCenter/certificate.css"> -->
		<!--<link rel="stylesheet" href="${baseUrl}/css/userCenter/print.css" type="text/css" media="print"/>-->
		
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/centerindex.css" type="text/css">
		<!-- end: MAIN CSS -->
		
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/bootstrap-fileupload.min.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/social-buttons-3.css">
		
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
    	<!--<link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css">-->
		<!--<link rel="stylesheet" href="${baseUrl}/css/userCenter/main-responsive.css">-->
		<!--<link rel="stylesheet" href="${baseUrl}/css/userCenter/theme_blue.css" type="text/css" id="skin_color">-->
		
    	<link rel="stylesheet" href="${baseUrl}/css/userCenter/jquery.fileupload-ui.css">
		<!-- CSS adjustments for browsers with JavaScript disabled -->
		<!--<noscript>-->
			<!--<link rel="stylesheet" href="${baseUrl}/plugins/jQuery-File-Upload/css/jquery.fileupload-ui-noscript.css">-->
		<!--</noscript>-->
		
		<!---designer-->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/attentionDesigner.css">
		<link  rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/id-card.css">
		
		<!--map-->
		<link rel="stylesheet" href="${baseUrl}/css/markHall/designerMain.css">
		
		<!--order detail-->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/Designer-list.css">
		
		<!--message css-->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/message.css">
		<!--design plan css-->
		<link  rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/myhomestyler.css">
		<!-- Information-mian css -->
		<link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/Information-mian.css">
		
		<link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/bootstrap-combined.min.css">
		<!--<link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/bootstrap-datetimepicker.min.css">-->
		
		<!--  page css -->
		<link rel="stylesheet" type="text/css" href="${baseUrl}/css/public/paging.css">
		
		<#include '/common/commonhead.html'/>		
		
		
		<script src="${baseUrl}/angularjs/user/userCenter-app.js" charset="utf-8" type="text/javascript"></script>
		
	</head>
	<!-- start: BODY -->
	<body ng-controller="ctrl" sytle="width:100px">
	
	<div id="loadingMask" class="loadingMask" style="display:none">
		<div class="loadingFont">
			<img src="${baseUrl}/images/global/LoadingCursor2.gif" />
		</div>
	</div>
				
        <!--Release success tips-->
        <#include '/common/header.html'/>
		<!-- end: HEADER -->
		<!-- start: MAIN CONTAINER -->
		<div style="width:1200px;margin:0 auto;overflow:hidden;margin-bottom: 2.5%;">
			<div class="main-container" style="margin-top: 50px;">
				<div class="navbar-content">
					<!-- start: SIDEBAR -->
					<div class="main-navigation navbar-collapse collapse">
						<!-- start: MAIN MENU TOGGLER BUTTON -->
						<!-- end: MAIN MENU TOGGLER BUTTON -->
						<!-- start: MAIN NAVIGATION MENU -->
						<#include '/common/userCenteLeft.html'/>
						<!-- end: MAIN NAVIGATION MENU -->
					</div>
					<!-- end: SIDEBAR -->
				</div>
				<!-- start: PAGE -->
				<!-- end: PAGE -->
			</div>
			<!-- end: MAIN CONTAINER -->
			<div ng-view></div>
		</div>
		<!-- start: FOOTER -->
		<#include '/common/footer.html'/>
		<!-- end: FOOTER -->
		
		<!--[if gte IE 9]><!-->
		
		<!--<![endif]-->
		
		<!--[if lt IE 9]>
		<!--<script src="${baseUrl}/js/public/respond.min.js"></script>-->
		<![endif]-->
		
		<script src="${baseUrl}/js/public/bootstrap-hover-dropdown.min.js"></script>
		<!-- <script src="${baseUrl}/js/public/newArea.js"></script>  -->
	    <!-- <script src="${baseUrl}/js/userCenter/perfect-scrollbar.js"></script> -->
		<script src="${baseUrl}/js/userCenter/main.js"></script>
		<script src="${baseUrl}/js/public/bootstrap-fileupload.min.js"></script>
		<script src="${baseUrl}/js/userCenter/perfect-scrollbar-v0.5.2.js" type="text/javascript"></script>
		<script src="${baseUrl}/js/markHall/back-the-top.js"></script>
		<!--<![endif]-->
			
		<!--data verification-->
		<!--Release requirements form validation-->
		<script src="${baseUrl}/js/userCenter/postyourwant.js" type="text/javascript"></script>
		<script src="${baseUrl}/js/userCenter/center_message.js"></script>
		<!--Initialize the provinces and cities-->
	</body>	
</html>
<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html  ng-app="app"  id="ng-app" ng-cloak>
	<#--include commonhead-->
	<head ng-controller="seoCtrl">
	
		<title ng-bind="title"></title>
		<meta
			name="keywords"
			content="{{keywords}}">
		<meta
			name="description"
			content="{{description}}">
		<#--include commonhead--> 
		<#include '/common/commonhead.html'/>
		<link
			href="${baseUrl}/css/designer/designer_list_white.css"
			rel="stylesheet"
			type="text/css">
		<link
			href="${baseUrl}/css/designer/designer_list_black.css"
			rel="stylesheet"
			type="text/css">
		<link
			href="${baseUrl}/css/public/paging.css"
			rel="stylesheet"
			type="text/css">
		<link
			rel="stylesheet"
			href="${baseUrl}/css/userCenter/main.css" />
		<!-- animate -->
		<link
			type="text/css"
			rel="stylesheet"
			href="${baseUrl}/js/designer/animate.min.css">
		<!-- animate -->
		<script
			src="${baseUrl}/angularjs/designer/designer-app.js"
			charset="utf-8"></script>
		<script src="${baseUrl}/js/markHall/back-the-top.js"></script>
		
   </head>
<body  ng-controller="ctrl"  style="background: #f3f3f3;">
	<#--include common header--> 
	<#include '/common/header.html'/>
	<!-- content start -->
	<div  class="find-designer-main-content" style="margin-top: -17px;padding-top:20px;"></div>
	<div class="content">
		<!--classify-->
		<!--Exhibition Designer-->
		<!-- loading start -->
		<div class="loading fixed" id="loading">
			<img src="${baseUrl}/images/global/LoadingCursor2.gif" 	style="display: inline-block" />
		</div>
		<!-- loading end -->
		<!-- new page start -->
		<!-- <div class="find-designer-main-content"> -->
		<div class="find-designer-container">
			<div  class="find-designer-container-mian" ng-repeat="d in designerlist" ng-init="index=$index"
				style="overflow: hidden;">
				<div class="row find-designer-container-mian-header">
					<div class="col-md-2"  style="width: 13%; padding-left: 0;">
						<div class="find-designer-container-img find_desimga">
							<a href="${baseUrl}/mark/main/id/{{d.designer.acs_member_id}}/uid/{{d.hs_uid}}/" target="_blank">
							   <img ng-src="{{d.avatar}}" alt="" ng-if="d.avatar" />
							   <img src="${baseUrl}/images/global/avatar_def.jpg" alt="" ng-if="d.avatar==''||d.avatar==undefined" />
							 </a>
						   <br />
						</div>
						<p
							class="find-designer-authenticated"
							ng-if="d.designer.is_real_name==2">
							<img
								src="${baseUrl}/images/markHall/find-designer--authenticated_03.png"
								alt="" />
						</p>
					</div>
					<div class="col-md-7 find-designer-container-messages">
						<h3>{{d.nick_name}}</h3>
						<p ng-if="d.designer.case_count>0">
							<span>作品：</span>
							{{d.designer.case_count}}套
						</p>
						<p ng-if="d.designer.case_count<0||d.designer.case_count==undefined">
							<span>作品：</span>
							0套
						</p>
						<p>
							<span>擅长风格：</span>
							{{d.designer.style_names}}
						</p>
					</div>
					<div class="col-md-3 find-designer-container-fee">
						<h3 class="text-right">设计费</h3>
						<p
							class="text-right"
							style="white-space: nowrap;"
							ng-if="d.designer.design_price_min>=0&&d.designer.design_price_max>=0">
							<span>{{d.designer.design_price_min}}~{{d.designer.design_price_max}}</span>
							元/m²
						</p>
						<p
							class="text-right"
							style="white-space: nowrap;"
							ng-if="d.designer.design_price_min<0||d.designer.design_price_min==null||d.designer.design_price_max<0||d.designer.design_price_max==null">未填写</p>
					</div>
				</div>
				<div
					class="row find-designer-show-img aniview"
					ng-if="d.cases_list.length>0"
					av-animation="slideInUp"
					style="transtion: all 0.8s;">
					<ul>
						<li
							class="col-md-3" ng-repeat="case in d.cases_list" ng-init="index=$index">
							<a href="${baseUrl}/caseBase/casedetail/caseid/{{case.id}}/uid/{{case.hs_designer_uid}}/" target="_blank">
								<img  ng-if="img.is_primary" ng-src="{{img.file_url}}Large.jpg" alt="" ng-repeat="img in case.images" ng-init="indexs=$index"/>
								<img ng-if="case.images.length==0" height="196px" width="265px"  src="${baseUrl}/images/global/default_image.jpg" alt="" />
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="find-designer-container-arrow-top">
				<img
					src="${baseUrl}/images/markHall/arrow-top-find-designer_11.png"
					alt="" />
			</div>
			<pagination
				ng-if="conf.totalItems>conf.itemsPerPage"
				conf="conf"
				go-page="page.go_page(num)"></pagination>
		</div>
	</div>
	<!-- content end -->
	<#--include common footer--> <#include '/common/footer.html'/> <#--include index-app.js file -->
	<link
		rel="stylesheet"
		href="${baseUrl}/css/markHall/markHall.css" />
	<script>
		$(document).on('click', '#scrollTopG .scrollTopG', function() {
			//console.log( $('#scrollTopG .scrollTopG').html() );
			//alert();
			$('html,body').animate({
				scrollTop : 0
			}, 'slow');
		});
		$(document).ready(function() {
			//alert();
			var i = {
				animateThreshold : 100
			};
			setTimeout(function() {
				$(".aniview").AniView(i), $(".code").each(function(i, e) {
					hljs.highlightBlock(e)
				})
			}, 400);
		});
	</script>
	<script
		src="${baseUrl}/js/designer/jquery.aniview.min.js"
		type="text/javascript"></script>
</body>
</html>
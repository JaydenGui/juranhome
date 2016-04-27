<#assign baseUrl=request.contextPath />
﻿<!DOCTYPE html>
<html ng-app="app" ng-cloak>
<head>
	<title>帮助热线</title>	
	<link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css">
	<#include '/common/commonhead.html'/>
</head>

<body style="background:#f3f3f3;" ng-controller="ctrl">
<div style="position:absolute;top:0px;width:100%">
	<script src="${baseUrl}/angularjs/floorlink/helpcenter-app.js" charset="utf-8" ></script>
	<#include '/common/header.html'/>
</div>	
	<div class="help-center">
		<ol class="breadcrumb">
			<li><a href="${baseUrl}/">首页</a></li>
			<li class="active">帮助热线</li>
		</ol>
		<h3>帮助热线</h3>
		<div class="help-center-body">
			<div class="help-center-img">
					<img src="${baseUrl}/images/footer/help-center01.png" alt="">
		    </div>
		</div>
		
	</div>
	<#include '/common/footer.html'/>
</body>
</html>
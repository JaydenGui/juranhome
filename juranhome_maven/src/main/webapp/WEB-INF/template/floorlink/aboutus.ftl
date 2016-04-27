
<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html ng-app="app" ng-cloak>
<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <title>关于我们</title>
    <link rel="stylesheet" href="${baseUrl}/css/footer/aboutus.css"/>
	<#include '/common/commonhead.html'/>
    <script src="${baseUrl}/angularjs/floorlink/aboutus-app.js" charset="utf-8" ></script>
</head>
<body ng-controller="ctrl">
	<#include '/common/header.html'/>
	<div class="aboutus-container">
	        <div class="aboutus-breadcrumbs">
	            <a href="${baseUrl}/">首页</a> &gt;
	            <a href="">关于我们</a>
	        </div>
	        <div class="aboutus-content">
	            <div class="aboutus-body">
	                <h3>关于设计家</h3>
	                <p>设计家（www.shejijia.com），是北京居然之家投资控股集团（以下简称“居然之家”）投资创立的采用线上线下融为一体的“O2O”+“全渠道” 商业模式，构建同担共赢生态圈式的全价值链大家居服务平台。设计家平台针对全社会所有设计师和装修业主免费开放，为他们提供设计、施工、材料选购服务的互动平台。</p>
	                <p>设计家依托居然之家的品牌影响力和资源优势，构建以用户为中心，商品和设计资源为大数据的重要基础，集设计、装修、材料采购为一体，平台从技术上实现效果图设计、施工图设计、预算合一，是一个囊括居然之家所有材料品牌的平台，设计师和消费者通过使用3D设计工具，精确选择需要协商讨论的点，随时随地进行讨论，有助于设计师完全把握消费者的需求，使得设计方案能够完全贴合消费者理想的家，让整个家装过程变得可视化、透明化、信息化、自动化。</p>
	                <p>居然之家通过该平台在全国范围内提供设计、施工、材料采购服务，最终引领用户的家居消费潮流，创造新的用户消费行为模式与用户服务模式。让您的装修变得更简单、快捷、透明。</p>
	                <div >
	                    <img  src="${baseUrl}/images/footer/about-us_03.png" alt=""/>
	                </div>
	            </div>
	        </div>
	</div>
	<#include '/common/footer.html'/>
</body>

</html>
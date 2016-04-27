<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="app" id="ng-app" ng-cloak>
	    <head ng-controller="seoCtrl">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
        <meta http-equiv="X-UA-Compatible" content="IE=9" />
		<link rel="stylesheet" type="text/css" href="${baseUrl}/css/index/skin_modern_silver.css"/>
		<link rel="stylesheet" type="text/css" href="${baseUrl}/css/index/html_content1.css"/>
		<link rel="stylesheet" href="${baseUrl}/css/index/layout.css">
		<script type="text/javascript" src="${baseUrl}/js/index1/FWDRoyal3DCarousel.js"></script>
		<#include '/common/commonhead.html'/>
	    
	 	<script type="text/javascript" src="${baseUrl}/angularjs/index/indexDesigner-app.js"></script>
		<script type="text/javascript">
		  initFWDR3DCarUtils();
		  function initFWDR3DCarUtils(){
			FWDR3DCarUtils.onReady(function()
			{
				var carousel = new FWDRoyal3DCarousel({
					//required settings
					carouselHolderDivId:"myDiv",
					carouselDataListDivId:"carouselData",
					displayType:"fluidwidth",
					autoScale:"yes",
					carouselWidth:940,
					carouselHeight:538,
					skinPath:"${baseUrl}/images/index/skin_modern_silver",
												
					//main settings
					showDisplay2DAlways:"no",
					carouselStartPosition:"center",
					numberOfThumbnailsToDisplayLeftAndRight:4,
					slideshowDelay:1350,
					autoplay:"yes",
					showPrevButton:"no",
					showNextButton:"no",
					showSlideshowButton:"no",
					disableNextAndPrevButtonsOnMobile:"no",
					controlsMaxWidth:940,
					slideshowTimerColor:"#777777",
					showContextMenu:"no",
					addKeyboardSupport:"no",
												
					//thumbnail settings
					thumbnailWidth:380,
					thumbnailHeight:300,
					thumbnailSpaceOffset3D:-19,
					thumbnailSpaceOffset2D:-19,
					thumbnailBorderSize:0,
					thumbnailBackgroundColor:"#fff",
					thumbnailBorderColor1:"#fcfdfd",
					thumbnailBorderColor2:"#e4e4e4",
					transparentImages:"no",
					maxNumberOfThumbnailsOnMobile:13,
					showThumbnailsGradient:"no",
					showThumbnailsHtmlContent:"no",
					textBackgroundColor:"#000",
					textBackgroundOpacity:.9,
					showText:"yes",
					showTextBackgroundImage:"no",
					showThumbnailBoxShadow:"no",
					thumbnailBoxShadowCss:"4px 4px 4px 4px #fff",
					showReflection:"no",
					reflectionHeight:50,
					reflectionDistance:20,
					reflectionOpacity:.2,
												
					//scrollbar settings
					showScrollbar:"no",
					disableScrollbarOnMobile:"no",
					enableMouseWheelScroll:"yes",
					scrollbarHandlerWidth:300,
					scrollbarTextColorNormal:"#777777",
					scrollbarTextColorSelected:"#000000",
												
					//combobox settings
					showComboBox:"no",
					startAtCategory:1,
					selectLabel:"SELECT CATEGORIES",
					allCategoriesLabel:"All Categories",
					showAllCategories:"yes",
					comboBoxPosition:"topright",
					selectorBackgroundNormalColor1:"#fcfdfd",
					selectorBackgroundNormalColor2:"#e4e4e4",
					selectorBackgroundSelectedColor1:"#a7a7a7",
					selectorBackgroundSelectedColor2:"#8e8e8e",
					selectorTextNormalColor:"#8b8b8b",
					selectorTextSelectedColor:"#FFFFFF",
					buttonBackgroundNormalColor1:"#e7e7e7",
					buttonBackgroundNormalColor2:"#e7e7e7",
					buttonBackgroundSelectedColor1:"#a7a7a7",
					buttonBackgroundSelectedColor2:"#8e8e8e",
					buttonTextNormalColor:"#000000",
					buttonTextSelectedColor:"#FFFFFF",
					comboBoxShadowColor:"#000000",
					comboBoxHorizontalMargins:12,
					comboBoxVerticalMargins:12,
					comboBoxCornerRadius:0,
												
					//lightbox settings
					addLightBoxKeyboardSupport:"yes",
					showLightBoxNextAndPrevButtons:"yes",
					showLightBoxZoomButton:"yes",
					showLightBoxInfoButton:"yes",
					showLighBoxSlideShowButton:"yes",
					showLightBoxInfoWindowByDefault:"no",
					slideShowAutoPlay:"no",
					lightBoxVideoAutoPlay:"no",
					lightBoxVideoWidth:640,
					lightBoxVideoHeight:480,
					lightBoxIframeWidth:800,
					lightBoxIframeHeight:600,
					lightBoxBackgroundColor:"#000000",
					lightBoxInfoWindowBackgroundColor:"#FFFFFF",
					lightBoxItemBorderColor1:"#fcfdfd",
					lightBoxItemBorderColor2:"#e4FFe4",
					lightBoxItemBackgroundColor:"#333333",
					lightBoxMainBackgroundOpacity:.8,
					lightBoxInfoWindowBackgroundOpacity:.9,
					lightBoxBorderSize:5,
					lightBoxBorderRadius:0,
					lightBoxSlideShowDelay:4000
				});	
			});
		  }	
</script>		
	</head>

	<body ng-controller="ctrl">
		<!-- div used as a holder for the carousel -->
		<div id="myDiv"></div>
		<!-- carousel data -->
		<div id="carouselData" style="display: none;">
			<!-- category  -->
			<ul data-cat="Category one">         				
				<ul>
					<li data-type="link" data-url="${baseUrl}/mark/main/id/20738206/uid/c5358c28-b19f-4f78-a5a1-fd94e9c69bff/" data-target="_blank"></li>
					<li data-thumbnail-path="${baseUrl}/images/index/9.jpg"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="7">
						<p class="largeLabel">王超</p>
						<p class="smallLabel">设计理念：好的设计是创新的、实用的、富有美感的、易于理解的，经得住时间的考验、考虑每一个细节。</p>
					</li>
				</ul>
				
                <ul>
					<li data-type="link" data-url="${baseUrl}/mark/main/id/20735708/uid/c472c597-195f-42e8-a04c-453b312e95f0/" data-target="_blank"></li>
					<li data-thumbnail-path="${baseUrl}/images/index/5.jpg"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="7">
						<p class="largeLabel">柏华林</p>
						<p class="smallLabel">从业13年，个人设计理念:你认为美就是好的，用我专业的设计把这些美的元素体现出一副画的意境。</p>
					</li>
				</ul>
				<ul>
					<li data-type="link" data-url="${baseUrl}/mark/main/id/20741285/uid/247be5ed-3a44-4d65-b2ea-3d3671ba2805/" data-target="_blank"></li>
					<li data-thumbnail-path="${baseUrl}/images/index/6.jpg"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="7">
						<p class="largeLabel">卢丹</p>
						<p class="smallLabel">从业7年，中国装饰协会认证住宅设计师，擅长中式、美式、欧式、地中海风格。</p>
					</li>
				</ul>
				<ul>
					<li data-type="link" data-url="${baseUrl}/mark/main/id/20738203/uid/c3523260-9492-4e39-b8ae-6a42119fb28e/" data-target="_blank"></li>
					<li data-thumbnail-path="${baseUrl}/images/index/0.jpg"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="7">
						<p class="largeLabel">吴限</p>
						<p class="smallLabel">自2002年从事室内设计，一直主要从事私宅规划设计，样板间设计，办公空间设计。</p>
					</li>
				</ul>
                   <ul>
					<li data-type="link" data-url="${baseUrl}/mark/main/id/20736559/uid/4c1782e9-c852-4751-b969-6c916dc9994a/" data-target="_blank"></li>
					<li data-thumbnail-path="${baseUrl}/images/index/3.jpg"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="7">
						<p class="largeLabel">胡江</p>
						<p class="smallLabel">入行十年，对设计永远保持一颗在路上的心。深谙“形式服务功能，任何没有内涵的形式都是苍白的。”</p>
					</li>
				</ul>
				</ul>
             
                <ul data-cat="Category two">
                <ul>
					<li data-type="link" data-url="${baseUrl}/mark/main/id/20739752/uid/1b1b80d7-1e26-4ede-9271-0fcd281f2e47/" data-target="_blank"></li>
					<li data-thumbnail-path="${baseUrl}/images/index/4.jpg"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="7">
						<p class="largeLabel" >李雅堂</p>
						<p class="smallLabel">2011年作品<荷行泛舟>参选筑客网筑巢奖， 设计源于生活，用心诠释生活之美，乃我不懈之追求。</p>
					</li>
				</ul>
         
				  <ul>
					<li data-type="link" data-url="${baseUrl}/mark/main/id/20738209/uid/2f19b6e0-ab8c-4738-9fdf-a23e86ddfc53/" data-target="_blank"></li>
					<li data-thumbnail-path="${baseUrl}/images/index/1.jpg"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="7">
					<p class="largeLabel">李晗</p>
						<p class="smallLabel">2010年作品荣获室内空间最佳设计奖。设计理念： 简约中不失大雅，质朴中不失大气，细节中筑就品位。</p>
					</li>
				</ul>
			<!-- end  -->
			<!-- category  -->
				<ul>
					<li data-type="link" data-url="${baseUrl}/mark/main/id/20735716/uid/274669c4-9705-40df-9e5f-1c9ae383d191/" data-target="_blank"></li>
					<li data-thumbnail-path="${baseUrl}/images/index/7.jpg"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="7">
						<p class="largeLabel">牛冶陶</p>
						<p class="smallLabel">设计的道路是一个自我否定与肯定的过程，是一个需要交流与沟通的过程，跨越重重阻隔，面对一个色彩斑斓的世界。</p>
					</li>
				</ul>
				<ul>
					<li data-type="link" data-url="${baseUrl}/mark/main/id/20735712/uid/b5933fc8-be37-42eb-8605-076371f93719/" data-target="_blank"></li>
					<li data-thumbnail-path="${baseUrl}/images/index/2.jpg"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="7">
						<p class="largeLabel">梁娜</p>
						<p class="smallLabel">2012金堂奖•中国室内设计年度评选年度优秀别墅设计大奖。设计理念：一直专注于以独特的专业视角去诠释空间艺术。</p>
					</li>
				</ul>
			</ul>
			<!-- end  -->
			
		</div>
		
	</body>
</html>
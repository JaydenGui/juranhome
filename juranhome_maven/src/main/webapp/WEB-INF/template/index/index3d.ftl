<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
   <html xmlns="http ://www.w3.org/1999/xhtml"  ng-app="app" id="ng-app" ng-cloak>
	  <head  ng-controller="seoCtrl">
	      <!--The 3 d effect to-->
	      	<link rel="stylesheet" type="text/css" href="${baseUrl}/css/index/html_content.css"/> 
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDPage.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDPageMenu.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDPageMenuButton.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDPageThumbs.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDPageThumb.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDPageSimpleButton.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDSlidersMenu.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDSlidersMenuButton.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDSlider.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDResetButton.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDOnOffButton.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/3d/FWDRoyal3DCarousel.js"></script>
			
	     <#include '/common/commonjs.html'/>
	    
	 	 <script type="text/javascript" src="${baseUrl}/angularjs/index/indexDesigner-app.js"></script>
			
			<!-- Setup the carousel (all settings are explained in detail in the documentation files) -->
		<script type="text/javascript">
			var carousel;
			FWDR3DCarUtils.onReady(function(){ 
				init();
			});
			
			function setupCarousel(){
				carousel = new FWDRoyal3DCarousel({

					//required settings
					carouselHolderDivId :"myDiv",
					carouselDataListDivId :"playList1",
					displayType :"fluidwidth",
					autoScale :"yes",
					carouselWidth :2000,
					carouselHeight :920,
					skinPath :"load/skin_modern_warm",

					//main settings
					
					scrollbarBackgroundImagePath :"",
					backgroundRepeat :"repeat-x",
					showDisplay2DAlways :"no",
					carouselStartPosition :"center",
					numberOfThumbnailsToDisplayLeftAndRight :4,
					slideshowDelay :5000,
					autoplay :"no",
					showPrevButton :"no",
					showNextButton :"no",
					showSlideshowButton :"no",
					disableNextAndPrevButtonsOnMobile :"no",
					controlsMaxWidth :940,
					slideshowTimerColor :"#777777",
					showContextMenu :"no",
					addKeyboardSupport :"no",

					//thumbnail settings
					thumbnailWidth :380,
					thumbnailHeight :330,
					thumbnailSpaceOffset :0,
					thumbnailSpaceOffset3D :55,
					thumbnailSpaceOffset2D :100,
					thumbnailBorderSize :0,
					thumbnailBackgroundColor :"#999999",
					thumbnailBorderColor1 :"#fcfdfd",
					thumbnailBorderColor2 :"#e4e4e4",
					transparentImages :"no",
					maxNumberOfThumbnailsOnMobile :13,
					showThumbnailsGradient :"yes",
					showThumbnailsHtmlContent :"yes",
					textBackgroundColor :"#333333",
					textBackgroundOpacity :.7,
					showText :"no",
					showTextBackgroundImage :"yes",
					showThumbnailBoxShadow :"yes",
					thumbnailBoxShadowCss :"0px 2px 2px #666666",
					showReflection :"yes",
					reflectionHeight :60,
					reflectionDistance :0,
					reflectionOpacity :.2,

					//scrollbar settings
					showScrollbar :"no",
					disableScrollbarOnMobile :"yes",
					enableMouseWheelScroll :"yes",
					scrollbarHandlerWidth :300,
					scrollbarTextColorNormal :"#777777",
					scrollbarTextColorSelected :"#000000",

					//combobox settings
					showComboBox :"no",
					startAtCategory :1,
					selectLabel :"SELECT CATEGORIES",
					allCategoriesLabel :"All Categories",
					showAllCategories :"no",
					comboBoxPosition :"topright",
					selectorBackgroundNormalColor1 :"#FFFFFF",
					selectorBackgroundNormalColor2 :"#FFFFFF",
					selectorBackgroundSelectedColor1 :"#bab8b4",
					selectorBackgroundSelectedColor2 :"#a09e9a",
					selectorTextNormalColor :"#8b8b8b",
					selectorTextSelectedColor :"#FFFFFF",
					buttonBackgroundNormalColor1 :"#FFFFFF",
					buttonBackgroundNormalColor2 :"#FFFFFF",
					buttonBackgroundSelectedColor1 :"#bab8b4",
					buttonBackgroundSelectedColor2 :"#bab8b4",
					buttonTextNormalColor :"#8b8b8b",
					buttonTextSelectedColor :"#FFFFFF",
					comboBoxShadowColor :"#999999",
					comboBoxHorizontalMargins :12,
					comboBoxVerticalMargins :12,
					comboBoxCornerRadius :0,

					//lightbox settings
					addLightBoxKeyboardSupport :"no",
					showLightBoxNextAndPrevButtons :"no",
					showLightBoxZoomButton :"no",
					showLightBoxInfoButton :"no",
					showLighBoxSlideShowButton :"no",
					showLightBoxInfoWindowByDefault :"no",
					slideShowAutoPlay :"no",
					lightBoxVideoAutoPlay :"no",
					lightBoxVideoWidth :640,
					lightBoxVideoHeight :480,
					lightBoxIframeWidth :800,
					lightBoxIframeHeight :600,
					lightBoxBackgroundColor :"#000000",
					lightBoxInfoWindowBackgroundColor :"#FFFFFF",
					lightBoxItemBorderColor1 :"#fcfdfd",
					lightBoxItemBorderColor2 :"#e4e4e4",
					lightBoxItemBackgroundColor :"#333333",
					lightBoxMainBackgroundOpacity :.8,
					lightBoxInfoWindowBackgroundOpacity :.9,
					lightBoxBorderSize :0,
					lightBoxBorderRadius :0,
					lightBoxSlideShowDelay :4000
				});
			};
		</script>
		<style>}</style>
	  </head>
	  <body ng-controller="ctrl" style="background:url(${baseUrl}/images/index/slidebg1.png)" >
	    <!-- <ul id="hoamebg">
        	<li class="bg_1"></li>
            <li class="bg_2"></li>
        </ul> 
		<div style="position :absolute; bottom :230px; left :46%; z-index :9999999999;" >
			<a href="${baseUrl}/designer/index/" target="_blank" style="display :block; width :280px; height :38px; " class="slide_btn">
				<img src="${baseUrl}/images/index/more_d.png"/>				
			</a>
		</div>-->
	     <!-- header -->
		 <div id="mainHeader" style="height :1px">
			<img id="logoImages" src="" style="display :none;"/>
			<img id="byFWD" src="" style="display :none;"/>
		</div>

		<!-- menu holder -->
		<div id="menuHolder" style="display :none" ></div>

		<!-- div used as a holder for the carousel -->
		<div id="myDiv" style="display :none"></div>

		<!-- sliders holder -->
		<div id="mainSlidersHolder" style="display :none">
			<p id="preview"></p>
			<div id="slidersHolder"></div>
		</div>

		<!-- thumbnails holder -->
		<div id="mainThumbsHolder" style="display :none">
			<p id="examples"></p>
			<div id="thumbsHolder"></div>
		</div>

		<!-- what is -->
		<div id="mainInfoHolder " style="display :none">
			<p class="headerText"><span class="blue"></span> <span class="blue">3D</span> </p>
			<p id="whatIsMainText"></p>
			<p class="headerText"><span class="blue"></span> </p>
			<div id="mainFeatureTableHolder"></div>
		</div>

		<div id="specialNotesMainHolder" style="display : none;">
			<div id="specialNotes">
				<p class="specialNotesHeaderText">我們的</p>
				<p><span class="blue">+ </span></p>
				<p><span class="blue">+ </span></p>
				<p><span class="blue">+ </span></p>
				<p id="lastP"><span class="blue">+ </span><a href="mailto :contact@webdesign-flash.ro"></a>.</p>
			</div>
		</div>

		<!-- carousel data -->
		<ul id="playList1" >
			<!-- category  -->
			<ul id="home_designers" data-cat="Category one">
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/548ff841498e905d7d0188b9.img);" >
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730534/uid/55138fc7-030f-43d5-84c7-dc5334430b96/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999" ng-click="aHref();"></a>
							</p>
						</div>
						<div class="namemasdh">刘百慧</div>
					</li>
				</ul>
				
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/54f51e6b498e905d7d05e620.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730535/uid/e9a6bb11-e4f2-4f78-b1fc-40c4605520b8/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">崔博</div>
					</li>
				</ul>
				
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/5493bcb5498e905d7d01d4c2.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730393/uid/6d8b531f-8602-4bce-8594-54cf3b467fc5/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">郑海涛</div>
					</li>
				</ul>
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/54939e9c498e65e7091d6583.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730537/uid/55413627-3d4e-4ce9-a54e-ec43d9b71380/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">班敬伟</div>
					</li>
				</ul>
				
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/5493f4ee498e74f7718c5de6.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730394/uid/df55c2f6-d037-4d5b-84b0-e35ffb5400fb/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">李雁红</div>
					</li>
				</ul>
				
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/54913535498e74f7718c2af6.img);">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730395/uid/0901b27a-7786-4e3e-8fa3-58496ad6282c/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">陈美旭</div>
					</li>
				</ul>
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/549d3726498e905d7d049db4.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730396/uid/9c186a0c-f5b4-49d3-923a-b4f56a3b430f/' style="top :0px; left :0px; width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">张艳萍</div>
					</li>
				</ul>
				
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/54c4a801498e65e709214d16.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730558/uid/807fea6b-71b2-4f48-b4ea-dcece3295ff4/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">隋忆</div>
					</li>
				</ul>
				
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/54927f2a498e65e7091d4b2d.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730631/uid/1011c6d7-dd14-458b-9364-71567378d6ce/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">项聪聪</div>
					</li>
				</ul>
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/5541cb3c498ecb740a84d171.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730726/uid/deb9829f-0141-402e-977c-5006d2e3977c/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">高杰</div>
					</li>
				</ul>
				
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/5493a048498e905d7d01d2ab.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730634/uid/5c295570-ad9f-44d9-a5bc-860804e1807e/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">张立东</div>
					</li>
				</ul>
				<ul class="image_root"> 
					<li data-type="none" data-url="#" data-target="_blank"></li>
					<li data-thumbnail-text="" data-thumbnail-text-title-offset="35" data-thumbnail-text-offset-top="10" data-thumbnail-text-offset-bottom="5">
						<p class="largeLabel"></p>
						<p class="smallLabel"></p>
					</li>
					<li data-html-content="" >
						<div class="thumb2Div" style="background-image :url(http ://image.juranzx.com.cn :8082/img/553f5c51498ecb740a84d04c.img);background-size :cover;background-position :center center;background-repeat :no-repeat;">
							<p class="thumb7P" style="height :100px">
								<a target="_blank" href='${baseUrl}/mark/main/id/20730555/uid/85ab9747-60b1-4afd-93d4-d40ee925e136/' style="top :0px; left :0px;width :375px; height :280px; position :absolute; z-index :999999"></a>
							</p>
						</div>
						<div class="namemasdh">时强</div>
					</li>
				</ul>
			</ul>
			<!-- end  -->
		</ul>
	  </body>
	  <script>
	  </script>
</html>
		
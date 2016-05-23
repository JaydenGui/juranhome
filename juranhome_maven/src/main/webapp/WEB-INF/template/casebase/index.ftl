<#assign baseUrl=request.contextPath />
<!DOCTYPE html> 
<html  ng-app="app" id="ng-app" ng-cloak>
<#--include commonhead-->
    <head ng-controller="seoCtrl">
		<#include '/common/commonhead.html'/>
		      
		<script src="${baseUrl}/angularjs/casebase/case-app.js" charset="utf-8"></script>
		
		<link href="${baseUrl}/css/login/global-one.css" rel="stylesheet" type="text/css">
		
        <link href="${baseUrl}/css/case/case.css" rel="stylesheet" type="text/css">
        <link href="${baseUrl}/css/public/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
        
        <script src="${baseUrl}/js/markHall/back-the-top.js"></script>
        <script src="${baseUrl}/js/public/bootstrap-datetimepicker.min.js"></script>
        
        
    </head>
    <body ng-controller="ctrl" style="background:#eff3f5">
        <#--include common header-->
        <#include '/common/header.html'/>
        <#assign baseUrl=request.contextPath />
        <!-- loading start -->
        <div class="loading" id="loading" style="display:none; margin-top:3%;">
    		<img src="${baseUrl}/images/global/LoadingCursor2.gif" style="display:inline-block"/>
    	</div> 
    	<script>
    		$(document).ready(function(){
    			var h = $(window).height()-50;
    			$('.loading').css({
    				'line-height':h+'px',
    				'width':'100%',
    				'position':'fixed',
    				'top':0,
    				'left':0,
    				'z-index':'99',
    				'text-align':'center'
    			})
    			$(".designList .down .content a").bind("click",function(){ 
    					
    				$(this).parents(".content").find("a").removeClass("selected");
    				$(this).addClass("selected"); 
    				
    			});
    			
    		})
    	</script>
    	<!-- loading end -->
		<!-- designList  start -->
		<div class="designList" style="margin-top:65px;">
			<!--<div class="up">案例库>室内设计</div>-->
			<div class="down">
				<ol class="down-ol">
					<!--<li>颜色</li>-->
					<li>风格</li>
					<li>户型</li>
					<li class="down-last">面积</li>
				</ol>
				<ul>
			
					<li>
						<div class="content">
						
							<a href="javascript:;" class="first selected" ng-click="search.style('')">不限</a>						
							<a href="javascript:;" ng-click="search.style('Japan')">日式</a>
							<a href="javascript:;" ng-click="search.style('korea')">韩式</a>
							<a href="javascript:;" ng-click="search.style('Mashup')">混搭</a>
							<a href="javascript:;" ng-click="search.style('european')">欧式</a>
							<a href="javascript:;" ng-click="search.style('chinese')">中式</a>
							<a href="javascript:;" ng-click="search.style('neoclassical')">新古典</a>							
							<a href="javascript:;" ng-click="search.style('ASAN')">东南亚</a>
							<a href="javascript:;" ng-click="search.style('US')">美式</a>
							<a href="javascript:;" ng-click="search.style('country')">田园</a>
							<a href="javascript:;" ng-click="search.style('modern')">现代</a>
							<a href="javascript:;" ng-click="search.style('mediterranean')">地中海</a>
							<a href="javascript:;" ng-click="search.style('other')">其他</a>							
						</div>
					</li>
					<li>
						<div class="content">
							<a href="javascript:;" class="first selected" ng-click="search.layout('')">不限</a>
							<a href="javascript:;" ng-click="search.layout('one')">一室</a>
							<a href="javascript:;" ng-click="search.layout('two')">二室</a>
							<a href="javascript:;" ng-click="search.layout('three')">三室</a>
							<a href="javascript:;" ng-click="search.layout('four')">四室</a>
							<a href="javascript:;" ng-click="search.layout('five')">五室</a>
							<a href="javascript:;" ng-click="search.layout('loft')">LOFT</a>
							<a href="javascript:;" ng-click="search.layout('multiple')">复式</a>
							<a href="javascript:;" ng-click="search.layout('villa')">别墅</a>
							<a href="javascript:;" ng-click="search.layout('other')">其他</a>
							
						</div>
					</li>
					<li class="down-last">
						<div class="content area">
							<a href="javascript:;" class="first selected" ng-click="search.space('')">不限</a>
							<a href="javascript:;" style="width:97px !important" ng-click="search.space('one')">60m²以下</a>
							<a href="javascript:;" ng-click="search.space('two')">60m²-80m²</a>
							<a href="javascript:;" ng-click="search.space('three')">80m²-120m²</a>
							<a href="javascript:;" ng-click="search.space('five')">120m²以上</a>	
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- show-case-Box start -->
		<div class="show-case-Box">			
			<div class="show-box">
				<div class="show-list show-box-current">
					<ul class="show-ul" >
						<li class="show-li" ng-repeat="case in caseLsit" ng-init="index=$index" ng-cloak>
						        <a href="${baseUrl}/caseBase/casedetail/caseid/{{case.id}}/uid/{{case.hs_designer_uid}}/" target="_blank">
									<div class="image" >
									    <img  ng-if="img.is_primary" ng-src="{{img.file_url}}Large.jpg" height="214" width="282" alt="" ng-repeat="img in case.images" ng-init="indexs=$index"/>
										<img  ng-if="case.images.length==0" src="${baseUrl}/images/global/default_image.jpg" height="214" width="282" alt="" />
										<!-- <img  ng-if="!case.images|imagesIsPrimary&&case.images.length>0" ng-src="{{case.images[0].file_url}}Large.jpg" height="214" width="282" alt="" /> -->
									</div>
								</a>
								<div class="caseInfo">
									<div class="c-title">{{case.title}}</div>
									<div class="c-detail"><span>{{case.room_type|replaceRoomType}}{{case.bedroom|replaceBedRoom}}{{case.restroom|replaceRestRoom}}丨{{case.room_area|replaceArea}}<span style="font-size:1.3em;">m²</span>丨{{case.custom_string_style|replaceStyle}}</span></div>
									<div class="designer-info" >
										<a href="${baseUrl}/mark/main/id/{{case.designer_id}}/uid/{{case.hs_designer_uid}}/" target="_blank">
											<span>
												 <img ng-if="designer_info.designer.is_real_name==2" class="add_v" src="${baseUrl}/images/case/add_v.png" />
											     <img ng-if="!case.designer_info.avatar" src="${baseUrl}/images/global/avatar_def.jpg" width="35px" height="35px"/>
											     <img ng-if="case.designer_info.avatar!=''" ng-src="{{case.designer_info.avatar}}" width="35px" height="35px"/>{{case.designer_info.nick_name}}
										     </span>
									     </a>
									</div>
									
								</div>
						</li>
						
					</ul>
					<div id="noMatch" style="display:none;width:365px;margin:170px auto; 0" ng-cloak>
						<img src="${baseUrl}/images/userCenter/case-library-null_03.png" ></img>
					</div>
				</div>
			</div>
		</div>
		<div class="find-designer-container-arrow-top">
		    <img src="${baseUrl}/images/markHall/arrow-top-find-designer_11.png" alt="aa"/>
		</div>
		<pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" ></pagination>
		<script>
		   function imtishi(){
		      alert("IM 功能建置中… 敬请期待!!");
		   }
		   function tishi(){
		      alert("尚未开放游客浏览案例库详情… 敬请期待!!");
		   }
		   $(function(){
        	   $("#menu li a" ).eq(1).addClass("activeaa");  
           });  
		   $(document).on('click','#scrollTopG .scrollTopG',function(){
		       $('html,body').animate({scrollTop:0},'slow');
		   });
		</script>
        <#--include common footer-->
        <#include '/common/footer.html'/>
        <link href="${baseUrl}/css/public/paging.css" rel="stylesheet" type="text/css">
    </body>
</html>
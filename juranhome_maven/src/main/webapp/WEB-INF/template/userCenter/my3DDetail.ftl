<#assign baseUrl=request.contextPath/>
<!DOCTYPE html>
<html lang="en" ng-app="app" ng-cloak>
<head ng-controller="seoCtrl">
  
    <link rel="stylesheet" href="${baseUrl}/css/userCenter/certificate.css"/>
    <#include '/common/commonhead.html'/>	
    <script src="${baseUrl}/angularjs/user/my3DScheme-app.js" charset="utf-8" type="text/javascript"></script>
    <script src="${baseUrl}/js/userCenter/signal-picture-upload.js" charset="utf-8" type="text/javascript"></script>		
</head>
<body ng-controller="ctrl">
<#include '/common/header.html'/>
	<div class="certificate-main-content">
	    <div class="certificate-container">
	        <!-- start: PAGE HEADER -->
	        <div class="row certificate-header">
	            <div class="col-sm-12">
	                <!-- start: PAGE TITLE & BREADCRUMB -->
	                <ol class=" breadcrumb certificate-breadcrumb ">
	                    <li>
	                        <a href="${baseUrl}/user/index/#mybidlist" style="text-decoration:none;color:#666;">
	                            个人中心 
	                        </a>
	                    </li>
	                    <li class="active">
	                        <a href="${baseUrl}/user/index/#my3DScheme" style="text-decoration:none;color:#666;">
	                            我的3D设计
	                        </a>
	                    </li>
	                    <li>{{schemeList.community_name}}</li>
	
	                </ol>
	                <!-- end: PAGE TITLE & BREADCRUMB -->
	            </div>
	        </div>
	
	        <div class="row certificate-body">
	            <div class="col-md-12 certificate-title">
	                <h3>{{schemeList.community_name}}</h3>
	            </div>
	            <!--3d diy part-->
	            <div class="row " >
	                <ul class=" col-md-12 juran-building">
	                    <li  class="current">
	                        <p><span><img src="${baseUrl}/images/userCenter/3ddiy_03.png" alt=""/></span>3D设计方案</p>
	                    </li>
	                </ul>
	                <ul class=" col-md-12 jusan-buildings " style="margin:0 35px 42px;">
	                    <li  class="col-md-3 juran-building-img" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==10">
	                        <a  target="_blank" href="${baseUrl}/3Dscheme/open3Dscheme/hs_design_id/{{schemeList.hs_design_id}}/acs_asset_id/{{asset_id}}/acs_project_id/{{needs_id}}/"><img  ng-src="{{scheme.link}}"  width="272px" height="206px" alt="" /></a>
	                    </li>
	                </ul>
	            </div>
	            <!-- effect drawing -->
	            <div class="row " >
	                <ul class=" col-md-12 juran-building">
	                    <li  class="current">
	                        <p><span><img src="${baseUrl}/images/userCenter/effect-drawing.png" alt=""/></span>渲染图</p>
	                    </li>
	                </ul>
	                <ul class=" col-md-12 jusan-buildings " style="margin:0 35px 42px;">
	                    <li  class="col-md-3 juran-building-img" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==0">
	                      <img  ng-src="{{scheme.link}}"  width="272px" height="206px" alt="" />
	                    </li>
	                </ul>
	            </div>
	            <!-- screenshot -->
	            <div class="row " >
	                <ul class=" col-md-12 juran-building">
	                    <li  class="current">
	                        <p><span><img src="${baseUrl}/images/userCenter/screenshot.png" alt=""/></span>截图</p>
	                    </li>
	                </ul>
	                <ul class=" col-md-12 jusan-buildings " style="margin:0 35px 42px;">
	                    <li  class="col-md-3 juran-building-img" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==6">
	                       <img  ng-src="{{scheme.link}}"  width="272px" height="206px" alt="" />
	                    </li>
	                </ul>
	            </div>
	            
	                <!--design papper part-->
	           <form name="form" id="form" role="form" enctype="multipart/form-data"  method="post" action="${baseUrl}/3Dscheme/uploadFile3DAsset" >
	            <input name="needs_id" value="{{needs_id}}" type="hidden" />
	            <input name="asset_id" value="{{asset_id}}" type="hidden" id="asset_id"/>
	            <input type="hidden" id="bp_list" name="bp_list" />
	            <input type="hidden" id="bom_list" name="bom_list" />
	            <div class="row " >
	                <ul class=" col-md-12 juran-building">
	                    <li  class="current">
	                        <p><span><img src="${baseUrl}/images/userCenter/design-papper_06.png" alt=""/></span>设计图纸</p>
	                    </li>
	                </ul>
	                <ul id="drawingList" class=" col-md-12 jusan-buildings " style="margin:0 35px 42px;" ><!--  -->
	                    <li  class="col-md-3 juran-building-img" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==3">
	                        <img ng-src="{{scheme.link}}" alt=""/>
	                    </li>
	                    <li  class="col-md-3 juran-building-img" id="drawing" style="position:relative">
	                        <img style="width:100% height:200px;" src="${baseUrl}/images/userCenter/click-add_10.png" alt=""/>
	                        <!--
	                        <input type="file" name="designpage" id="designpage" multiple="true"  onchange="previewImage(this,1)" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0;cursor:pointer;"  value="" />
	                        -->
                            <span id="file_fields_bp">
                            	<!-- <input id="case-input-file" type="file"  name="file" onchange="previewImage(this,1)" multiple="true" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0" ng-model="file"/>-->
                            	<input id="designpage" type="file"  name="designpage" onChange="previewImage(this,1)" multiple="true" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0" />
                            </span>
	                    </li>
	                    <li ng-show="schemeList.design_file==0"  class="col-md-3 juran-building-img" style="background:url(${baseUrl}/images/userCenter/click-addto_03.png) no-repeat;border-color:#fff;">
	                        <!--<img src="${baseUrl}/images/userCenter/click-addto_03.png" alt=""/>-->
	                    </li> 
	                </ul>
	            </div>
	            <!--Materials List part-->
	            <div class="row" >
	                <ul class=" col-md-12 juran-building">
	                    <li  class="current">
	                        <p><span><img src="${baseUrl}/images/userCenter/list-materials_10.png" alt=""/></span>材料清单</p>
	                    </li>
	                </ul>
	                <ul id="materialList" class=" col-md-12 jusan-buildings " style="margin:0 35px 42px;" ><!-- " -->
	                    <li  class="col-md-3 juran-building-img" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==2">
	                        <img ng-src="{{scheme.link|deliveryFileUrl}}" alt=""/>
	                    </li>
	                    <li  class="col-md-3 juran-building-img"  id="material" style="position:relative">
	                        <img style="width:100% height:200px;" src="${baseUrl}/images/userCenter/click-add_10.png" alt=""/>
	                        <!--
	                        <input type="file" name="designstuff"  id="designstuff"  onchange="previewImage(this,2)" multiple="true" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0;cursor:pointer;"/>
	                        -->
                            <span id="file_fields_bom">
                            	<!-- <input id="case-input-file" type="file"  name="file" onchange="previewImage(this,1)" multiple="true" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0" ng-model="file"/>-->
                            	<input id="designstuff" type="file"  name="designstuff" onchange="previewImage(this,2)" multiple="true" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0" />
                            </span>
	                    </li>
	                    <li ng-show="schemeList.design_file==0" class="col-md-3 juran-building-img" style="/* background:url(${baseUrl}/images/userCenter/click-addto_03.png) no-repeat; */border-color:#fff; ">
	                        <!--<img src="${baseUrl}/images/userCenter/click-addto_03.png" alt=""/>-->
	                    </li>
	                </ul>
	            </div>
	            <div class="row" style="margin-bottom:20px"> 
	                <div class="col-md-12" >
	                    <div class="col-md-2"></div>
	                    <div class="col-md-3"></div>
	                    <div class="col-md-1" style="margin-right:30px;">
	                        <a class="NewBtn btn-defaultClose" href="${baseUrl}/user/index#/my3DScheme" id="back" >返回</a>
	                    </div>
	                    <div class="col-md-1">
	                        <button class="NewBtn btn-primarySubmit" type="submit"  id="submit" > 保存</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    </form>
	</div>
	</div>
	<#include '/common/footer.html'/>
	</body>
</html>
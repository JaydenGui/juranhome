<#assign baseUrl=request.contextPath/>
<#if users?exists & users.type=='designer'>
<link href="${baseUrl}/css/userCenter/myhomestyler.css" rel="stylesheet" type="text/css">

<div class="main-content" style="padding:0 15px;">
    <div class="container">
        <!-- start: PAGE HEADER -->
        <div>
            <div class="col-sm-12">
            <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li><a href="javascript:document.getElementById('mybidlist').click()" style="text-decoration:none;color:#666;">
                        个人中心
                    </a>  </li>
                    <li class="active">
                        我的3D设计
                    </li>
                </ol>
            
            
            
                <div class="homestyler-title">
                    <h3 >我的3D设计</h3>
                    <!-- <div class="row">
                        <div class="col-md-4">
                            <select name="dd"  class="form-control" style="background:url(${baseUrl}/images/markHall/markHall-sprites.png) 250px -226px no-repeat;appearance: none;-webkit-appearance: none;-moz-appearance: none;">
                                <option value="">全部时间</option>
								<option value="ONE_MONTH_INSIDE">1个月以内</option>
                                <option value="THREE_MONTHS_INSIDE">3个月以内</option>
                                <option value="SIX_MONTHS_INSIDE">6个月以内</option>
                                <option value="SIX_MONTHS_OUTSIDE">半年以上</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <input type="text" placeholder="输入名称、标签搜索"  name="yyyy" class="form-control">
                        </div>
                        <div class="col-md-2">
	                        <button type="button" class="btn btn-default" style="background-color:#fff;border:1px solid #d5d5d5;border-radius:0px;">
	                            搜索
	                        </button>
	                    </div>
					</div> -->
               		 </div>
                <!-- end: PAGE TITLE & BREADCRUMB -->
            	</div>
            	<div class="" >
               	 	<ul class=" col-md-12 money-record">
               	 		<li id="1" class="current"><a href="javascript:void(0);" ng-click="switchs(1);">项目设计</a></li>
               	 		<li style="border:0 none;border:0 none;color:#666;font-weight:100; background-color: #999;height: 18px !important;margin: 13px 5px;padding: 0; overflow: hidden;width:1px!important;pointer-events: none;"></li>
               	 		<li id="2"><a href="javascript:void(0);" ng-click="switchs(2);">普通设计</a></li>
               	 	</ul>
               	</div>
        </div>
        <!-- end: PAGE HEADER -->
        <div class="project-design" ng-cloak >
            <div class="col-sm-4" ng-repeat="scheme in schemeList" ng-init="index = $index" ng-if="schemeList.length>0">
            	<a href="${baseUrl}/3Dscheme/my3DschemeDetail/needsid/{{scheme.needs_id}}/assetid/{{scheme.design_asset_id|replaceNumber}}" style="display:block" >
	          		<div class="col-sm-12  homestyler-juran" >
		          		<img style="margin:50px auto;" src="${baseUrl}/images/userCenter/projectdesign.png" alt="" >
		          	</div>
		          	<div class="col-sm-12" ng-cloak>
		          		<p>{{scheme.community_name}}</p>
		          	</div>
	          	</a>
            </div>
             <!-- when schemeList is null -->
	       <div id="noMatch"  style="text-align:center;display:none;" ng-if="schemeList.length==0" ng-cloak>
	         <div><img src="${baseUrl}/images/userCenter/rreyeryer_03.png"></div>
			 <div style="margin-top:15px; margin-bottom:15px;color:#000;">您还没有设计方案</div>
	       </div>
        </div>
       <!-- normal-design -->
       <div class="row normal-design" ng-cloak >
          <div class="col-sm-4" ng-repeat="scheme in schemeList" ng-init="dex = $index" style="box-shadow: 0 0 3px 1px #ddd; min-height: 260px;width: 303px;margin: 10px;">
               	<a  style="display: block;height: 195px;margin-top: 10px;" target="_blank"  href="${baseUrl}/3Dscheme/open3Dscheme/hs_design_id/{{scheme.hs_design_id|replaceNumber}}/acs_asset_id/{{scheme.design_asset_id|replaceNumber}}/acs_project_id/0/">
               	<img style="width:100%;" ng-src="{{scheme.design_file[0].link}}" alt=""  width="293px;" height="195px"></a> 
          		<p style="text-align:center;height:44px;line-height:44px;background: #eee none repeat scroll 0 0;" ng-cloak>{{scheme.design_name}}</p>
          </div> 
           <!-- when schemeList is null -->
	       <div id="noMatch1" style="text-align:center;display:none;" ng-if="schemeList.length==0" ng-cloak>
	         <div><img src="${baseUrl}/images/userCenter/rreyeryer_03.png"></div>
			 <div style="margin-top:15px; margin-bottom:15px;color:#000;">您还没有设计方案</div>
	       </div>
       </div>
       
      
       <pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" ></pagination>
    </div>
</div>
<#else>
	<script >
	$(function(){
		location.href = baseUrl+"/";
	});
	</script>
</#if>
<script src="${baseUrl}/js/userCenter/my-designproject.js"></script>

<script>
$(document).ready(function() {
		pageActive("3D");
});

$(document).on('click','#scrollTopG .scrollTopG',function(){
    $('html,body').animate({scrollTop:0},'slow');
});
</script>

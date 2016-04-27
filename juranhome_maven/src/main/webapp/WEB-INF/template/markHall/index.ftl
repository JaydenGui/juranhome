<#assign baseUrl=request.contextPath/>
<!DOCTYPE html>
<html ng-app="app" id="ng-app" ng-cloak class="theme-color-33d685 theme-skin-light">

<head ng-controller="seoCtrl">
   
  
    <!-- Icon Fonts -->
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/font-style.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/map-icons.min.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/Information-mian.css">
    
    <!-- Styles -->
    <!-- <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/main.css"> -->
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/jquery.bxslider.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/mediaelementplayer.min.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/jquery.fancybox.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/owl.theme.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/style.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/green.css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/designer_home.css">
    <link rel="stylesheet" href="${baseUrl}/css/userCenter/theme_light.css" type="text/css">
    <link rel="stylesheet" href="${baseUrl}/css/userCenter/style.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/index/main.css">
    <link rel="stylesheet" href="${baseUrl}/css/markHall/markHall.css" />
    <link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css" />
    <style>
    .ps-item img {
        display: inline-block!important;
    }
    
    .panel-body.wrapper.description.ps-container {
        margin-left: 50px;
    }
    
    .pgwSlideshow .ps-list li .ps-item {
        display: inline-block;
    }
    
    .pgwSlideshow .ps-list li img {
        display: inline-block!important;
    }
    
    .pgwSlideshow .ps-list ul.pgwSlideshower {
        width: 5460px!important;
    }
    /* .description {width:560px;margin:0 auto;} */
    </style>
    <#include '/common/commonhead.html'/>
    
    <script type="text/javascript" src="${baseUrl}/angularjs/markHall/markHall-app.js"></script>
    <script src="${baseUrl}/js/public/perfect-scrollbar-v0.5.2.js"></script>
</head>

<body ng-controller="ctrl" class="home header-has-img">
    <div class="loading" id="loading"> <img src="${baseUrl}/images/markHall/022.gif" /> </div>
    <!-- loading end -->
    <div class="modal-dialog modal fade" id="confirm2" tabindex="-1" role="dialog" aria-hidden="true" style="position:fixed; top:20%;display:none;">
        <div class="modal-content" style="border:none;">
            <div class="modal-header" style="border:none;padding:25px;padding-left:45px;">
                <button class="close" aria-hidden="true" type="button" data-dismiss="modal" style="margin-top: -9px;opacity: 1;"> <img src="${baseUrl}/images/userCenter/m-close-icon.png"> </button>
                <h4 class="modal-title">{{detail.neighbourhoods}}</h4> </div>
            <div class="col-sm-12" style="background:#fff;padding:0px 25px">
                <table class="table table-condensed ">
                    <!--  <thead>
              <tr>
                  <th colspan="3">编号 : {{detail.needs_id}}</th>
              </tr>
             </thead> -->
                    <tbody>
                        <tr>
                            <th colspan="3">编号 : {{detail.needs_id}}</th>
                        </tr>
                        <tr>
                            <td>装修预算:</td>
                            <td> {{detail.decoration_budget}} </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>房屋面积:</td>
                            <td>{{detail.house_area|replaceArea}} m²</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>发布时间:</td>
                            <td>{{detail.publish_time}} </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>客户姓名:</td>
                            <td>{{detail.contacts_name}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>联系电话:</td>
                            <td>{{detail.contacts_mobile}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</td>
                            <td>{{detail.province_name}}{{detail.city_name}}{{detail.district_name|replaceNone}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</td>
                            <td>{{detail.room|replaceRoomType}}{{detail.living_room|replaceBedRoom}}{{detail.toilet|replaceRestRoom}}</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>风&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:</td>
                            <td>{{detail.decoration_style|replaceStyle}}</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
                <!--  <div class="col-md-12" style="background:#DAEDF8;padding-top:10px;margin-bottom:15px;border-radius:10px"">
            	<p style="color:#5185A4;margin-bottom:0">设计宣言：{{detail..declaration}}</p>
            </div>--></div>
            <div class="modal-footer" style="background:#fff;border-radius:5px!important;overflow:hidden;border-color:#fff;">
                <div id="poploading" class="poploading" style="position: absolute;bottom: 10px;left: 15px;"><img src="${baseUrl}/images/global/LoadingCursor2.gif" /></div>
                <button class="NewBtn btn-defaultClose" aria-hidden="true" data-dismiss="modal" type="button" > 关闭 </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!--detail end-->
    <div class="wrapper">
        <!--nav part-->
        <#include '/common/header.html'/>
        <!-- .header -->
        <div class="content">
            <div class="container" style="width:1220px!important"">
<!-- START: PAGE CONTENT -->
<!-- <section id="about" class="section section-about">
	<div class="animate-up">
		<div class="section-box sfrty_dsg">
			<div class="profile">
				<div class="row" style="margin-top:50px;">
					 <div class="col-xs-3">
						<div class="profile-photo">
							<div class="wrap-image" style="40%">
								<div class="designersface"style="width:160px;margin-top:70px;">
								   <a  onclick="window.open( '${baseUrl}/mark/main');"><img src="${baseUrl}/images/global/avatar_def.jpg" ng-if="designerInfo.avatar==''" style="border-radius:100%;width:160px;height:160px;"/>
								   <img ng-src="{{designerInfo.avatar}}" ng-if="designerInfo.avatar"style="border-radius:100%;width:160px;height:160px;"/></a>
								</div>
							</div>
						</div>
					</div> 
					<div class="col-xs-9" style="margin-top: 13%;">
					<div class="profile-info">
							<h1 class="profile-title">{{designerInfo.nick_name}}</h1>
							<a href="" ng-if="designerInfo.designer.is_real_name" class="profile-titsp"><img src="${baseUrl}/images/userCenter/awqewrt.png"></a>
					</div>
					<dl class="profile-list">
							<dd style="font-size:18px;">设计费:</dd>
							<dd class="asclolr">{{designerInfo.designer.design_price_min}}~{{designerInfo.designer.design_price_max}}元/平米</dd>
							<dd style="margin-left: 60px;">量房费:</dd>
							<dd class="asclolr">{{designerInfo.designer.measurement_price}}元</dd>
							<dt><img src="${baseUrl}/images/markHall/amend_03.png"><a target="_black" style="color:#1396f2; text-decoration: none;" href="${baseUrl}/user/personalinformation/">修改资料</a></dt>
					</dl>
					</div>
				</div>
			</div>
			
		</div>
	</div>	
</section>#about -->
			<section style="width:460px;height:340px;margin:0 auto;padding-top:60px;">
				<div class="profile-photo" style="width:132px; height:132px;margin:0 auto;">
					<div class="designersface">
					   <a  onclick="window.open( '${baseUrl}/mark/main');"><img src="${baseUrl}/images/global/avatar_def.jpg" ng-if="designer.avatar=='' ||designer.avatar==null" style="border-radius:100%;width:132px;height:132px;"/>
					   <img ng-src="{{designer.avatar}}" ng-if="designer.avatar"style="border-radius:100%;width:132px;height:132px;"/></a>
					</div>
				</div>
				<div class="profile-info" style="text-align:center;">	
					 <a href="" ng-if="designerInfo.designer.is_real_name==2" class="profile-titsp" style="display:inline-block;margin:10px 0 20px 0;"><img src="${baseUrl}/images/userCenter/awqewrt.png"></a>
					<h1 class="profile-title" style="color:#333;white-space:nowrap;font-family: 'Microsoft YaHei';">{{designer.nick_name}}</h1>
				</div>
			</section>
            <!-- START: PAGE CONTENT -->
            <h2  ng-if="designerInfo.designer.is_loho==1"  class="section-title" style="margin-top: 5%;">北舒套餐</h2>
            <div>
<section id="package" class="section section-contact" style="max-width:1200px; margin:0 auto;" ng-if="designerInfo.designer.is_loho==1">
            <div class="animate-up">
	<div class="animate-up neworder" style="display:none">
		<div class="row">
			<div class="col-sm-12">
				<div class="section-box contact-form">
					<form class="contactForm">
					<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">
										客户 : <span class="symbol required"></span>
									</label>
									<input type="text" placeholder="" class="form-control" id="firstname" name="firstname">
								</div>
							</div>
                                        	<div class="col-md-6">
								<div class="form-group">
									<label class="control-label">
										手机号码 : <span class="symbol required"></span>
									</label>
									<input type="text"  placeholder="" class="form-control"  >
								</div>
							</div>
                                     <div class="col-md-12">
							<div class="form-group">
									<label class="control-label">
										小区名称 : <span class="symbol required"></span>
									</label>
									<div>
										<input type="text" placeholder="小区名称" id="areaName" name="area" class="form-control">
									</div>
								</div></div>
						</div>
						<span class="btn-outer btn-primary-outer ripple">
							<input class="contact-submit btn btn-lg btn-primary" type="submit" value="完成"/>
						</span>
						<div class="contact-response"></div>
					</form>
				</div>
			</div>
		</div>
	</div>	
                <br>
		<div class="timeline">
			<div class="timeline-bar"></div>
			<div class="timeline-inner clearfix">
			   			<div  class="mybid in mybidlist" ng-repeat="beishu in beishuOrder" ng-init="index=$index" style="margin-bottom:30px;">
			   				<div class="timeline-box timeline-box-left" ng-if="index%2==0" >
                               <span class="dot"></span>
                               <div class="timeline-box-inner animate-left" style="border-radius:5px 5px 10px 10px;">
	                               	<div class="creationtime">
		                               	  <div style="height:110px;">
			                               		<div class="sun clearfix col-md-7"> 
			                               			<p>{{beishu.publish_time}}</p>
			                               			<p>编 <span style="width:30px;"></span>号 : {{beishu.needs_id}}</p>
			                               			<p>业主姓名 : {{beishu.contacts_name}}</p>
			                               			<p>地 <span style="width:30px;"></span>址 : {{beishu.province_name}}{{beishu.city_name}}{{beishu.district_name|replaceNone}}</p>
			                               		</div>
			 
			                               		<div class="daadasdy clearfix col-md-5 text-right"  style="position: relative; top: 10%;padding-right:0;">
			                               			<img src="${baseUrl}/images/markHall/beishu-sprite.png">{{beishu.contacts_mobile}}
			                               		</div>
		                               	  
		                               	  </div>
	                               	 
	                               	</div>

                                   <span class="arrow"></span>
                                   <h3></h3>
                                   <div class="creationtime-mian-design-data">
                                   	   <div class="creationtime-mian-design-data-header">
		                                   <div>设计资料</div>
		                                   <div>操作</div>
	                                   </div>
	                                   <div class="creationtime-mian-design-data-body">
	                                   		<div  ng-click="getAsset(beishu.needs_id);">
	                                   			<img src="${baseUrl}/images/global/designerIcon(3).png" />
	                                   			<p>3D方案</p>
	                                   		   
	                                   		</div>
		                                   <div>  
		                                     <a  ng-click="getAsset(beishu.needs_id);"  href="javascript:void(0);" >进入3D设计</a>
		                                   </div>
	                                   </div>
	                                   
                               	   </div>
                               </div>
                           </div>                                                    

                           <div class="timeline-box timeline-box-right" ng-if="index%2==1">
                               <span class="dot"></span>
                               <div class="timeline-box-inner animate-right"  style="border-radius:5px 5px 10px 10px;">
	                               	<div class="creationtime">
		                               	  <div style="height:110px;">
			                               		<div class="sun clearfix col-md-7"> 
			                               			<p>{{beishu.publish_time}}</p>
			                               			<p>编 <span style="width:30px;"></span>号 : {{beishu.needs_id}}</p>
			                               			<p>业主姓名 : {{beishu.contacts_name}}</p>
			                               			<p>地 <span style="width:30px;"></span>址 : {{beishu.province_name}}{{beishu.city_name}}{{beishu.district_name|replaceNone}}</p>
			                               		</div>
			 
			                               		<div class="daadasdy clearfix col-md-5 text-right"  style="position: relative; top: 10%;padding-right:0;">
			                               			<img src="${baseUrl}/images/markHall/beishu-sprite.png">{{beishu.contacts_mobile}}
			                               		</div>
		                               	  </div>
	                               	</div>    
                                  	
                                   <span class="arrow"></span>
                                   <!-- <h3>{{beishu.neighbourhoods}}</h3> -->
                                   <div class="creationtime-mian-design-data">
                                   	   <div class="creationtime-mian-design-data-header">
		                                   <div>设计资料</div>
		                                   <div>操作</div>
	                                   </div>
	                                   <div class="creationtime-mian-design-data-body">
	                                   		<div  ng-click="getAsset(beishu.needs_id);">
	                                   			<img src="${baseUrl}/images/global/designerIcon(3).png" />
	                                   			<p>3D方案</p>
	                                   		   
	                                   		</div>
		                                   <div> 
		                                     <a  ng-click="getAsset(beishu.needs_id);"  href="javascript:void();" >进入3D设计</a>
		                                   </div>
	                                   </div>
	                                   
                               	   </div>
                               </div>
                           </div>            
                          
			   		
			   		
			   		<!-- No message-->
                           <div ng-if="beishuOrder.length<=0">
		          				<div class="timeline-box timeline-box-left">
		          				<span class="dot"></span>
                                <div class="timeline-box-inner animate-left"  style="border-radius:5px 5px 10px 10px;">
                               	 <div>
                               	  <div class="">
                               		<div class="sun"></div>
                               		<ul class="sunbd">
                               			<li class="moon"></li>
                               			<li class="annum"></li>
                               		</ul>
                               		<div class="daadasdy"></div>
                               	  </div>
                               	 </div>
                                 <span class="arrow"></span> 
	                                 <div class="message">
	                                   	<img src="${baseUrl}/images/global/prompt_11.png">
	                                   	<p style="margin: 10px 0">您尚未创建北舒订单</p>
	                                 </div>
                                 </div>
                                 </div>
                             </div>
			   		
			   	</div>
			</div>
		</div>
		 <div class="grid-more"  ng-if="beishuOrder.length>0"> <span class="ajax-loader"></span>
                <form role="search" method="get" action="${baseUrl}/user/index#/beishuOreder/" target="_blank">
                    <div class="fulllist"></div>
                    <button class="btn btn-border ripple">查看全部</button>
                </form>
            </div>
        </div>
        </section>
        <!-- #about -->
        <h2 class="section-title animate" style="margin-top: 5%;">我的应标</h2>
        <section id="experience2" class="section section-experience" style="max-width:1200px; margin:0 auto;">
            <div class="animate-up">
                <div class="filter">
                    <!-- <div class="filter-inner">
				<div class="filter-btn-group groupC">
					<button data-filter="*" ng-click="searchbid(1);">全部</button>
					<button data-filter=".level1" ng-click="searchbid(2);">已中标</button>
					<button data-filter=".level2" ng-click="searchbid(3);">未中标</button>
				</div>
				<div class="filter-bar barC">
					<div>
						<span></span>
					</div>
				</div>
			</div> -->
                    <script>
                    $(function() {
                        $(".filter-btn-group button").click(function() {
                            var s = $(this).index();
                            if(s == 1) {
                                /* $('.filter-bar span').animate({"left":"33.3%"}); */
                                $(this).closest('.filter-inner').find('span').animate({
                                   "left":"33.3%"
                                });
                            } else if(s == 0) {
                                /* $('.filter-bar span').animate({"left":"0"}); */
                                $(this).closest('.filter-inner').find('span').animate({
                                   "left":"0"
                                });
                            } else {
                                /* $('.filter-bar span').animate({"left":"66.6%"}); */
                                $(this).closest('.filter-inner').find('span').animate({
                                   "left":"66.6%"
                                });
                            }
                        });
                    });
                    </script>
                </div>
                <div class="timeline">
                    <div class="timeline-bar"></div>
                    <div class="timeline-inner clearfix">
                        <div ng-repeat="mybid in mybidlist" ng-init="index=$index">
                            <div class="timeline-box timeline-box-left" ng-if="index%2==0"> <span class="dot"></span>
                                <div class="timeline-box-inner animate-left" style="padding:25px 0 0 0;  border-radius:5px 5px 10px 10px;">
                                    <div class="creationtime" style="margin:0 20px;height:30px;">
                                        <div class="creationtime" style="height:30px;">
                                            <div class="">
                                                <div class="sun" style="height:20px;">{{mybid.publish_time}}</div>
                                                <div class="daadasdy"> <span class="state" ng-if="mybid.bidder.status==0">应标中</span> <span class="state" ng-if="mybid.bidder.status==1">已中标</span> <span class="state" ng-if="mybid.bidder.status==2||mybid.bidder.status==3">未中标</span> </div>
                                            </div>
                                        </div>
                                    </div> <span class="arrow"></span>
                                    <div class="kapdsar" style="margin:0 20px;">
                                        <div class="namecolor sdsgsdh">{{mybid.needs_name}}</div>
                                        <div class="date" style="float:right;margin-bottom:0;">装修预算:{{mybid.renovation_budget}}</div>
                                    </div>
                                    <table style="border:1px solid #d7d7d7;border-radius:4px!important;margin:0 20px;width:92%;border-collapse: separate;">
                                        <thead>
                                            <tr style="border-bottom: 1px solid #d7d7d7;">
                                                <th>项目类型</th>
                                                <th>需求状态</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th class="zhstyle">{{mybid.house_type|replaceHouseType}}</th>
                                                <td> <span class="state" ng-if="mybid.bidder.status==1">已中标</span> <span class="state" ng-if="mybid.bidder.status==0">应标中</span> <span class="zhstyle" class="zhstyle" ng-if="mybid.bidder.status==2||mybid.bidder.status==3">未中标</span>
                                                    <br> 目前投标人数：{{mybid.bidder_count}}
                                                    <br> 距结束还有 {{mybid.end_day}}天 </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="kapdsar" style="height:35px;line-height:35px;width: 100%;border-top:1px solid #d7d7d7;background:#f6f6f6;text-align:center;margin-top:20px;border-radius:0 0 5px 5px;">
                                        <div class="namefont" style="width:100%;">
                                            <a href="javascript:void(0)" target="_blank" data-target="#confirm2" data-toggle="modal" ng-click="orderDetail(mybid.needs_id);"> <img src="${baseUrl}/images/markHall/wqoqiwj.png">查看详情 </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-box timeline-box-right" ng-if="index%2==1" style="top:30px"> <span class="dot"></span>
                                <div class="timeline-box-inner animate-right" style="padding:25px 0 0 0;border-radius:5px 5px 10px 10px;">
                                    <div class="creationtime" style="margin:0 20px;height:30px;">
                                        <div class="creationtime" style="height:30px;">
                                            <div class="">
                                                <div class="sun" style="height:20px;">{{mybid.publish_time}}</div>
                                                <div class="daadasdy"> <span class="state" ng-if="mybid.bidder.status==0">应标中</span> <span class="state" ng-if="mybid.bidder.status==1">已中标</span> <span class="state" ng-if="mybid.bidder.status==2||mybid.bidder.status==3">未中标</span> </div>
                                            </div>
                                        </div>
                                    </div> <span class="arrow"></span>
                                    <div class="kapdsar" style="margin:0 20px;">
                                        <div class="namecolor sdsgsdh">{{mybid.needs_name}}</div>
                                        <div class="date" style="float:right;margin-bottom:0;">装修预算:{{mybid.renovation_budget}}</div>
                                    </div>
                                    <table style="border:1px solid #d7d7d7;border-radius:4px!important;margin:0 20px;width: 92%;border-collapse: separate;">
                                        <thead>
                                            <tr style="border-bottom: 1px solid #d7d7d7;">
                                                <th>项目类型</th>
                                                <th>需求状态</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th class="zhstyle">{{mybid.house_type|replaceHouseType}}</th>
                                                <td> <span class="state" ng-if="mybid.bidder.status==0">应标中</span> <span class="state" ng-if="mybid.bidder.status==1">已中标</span> <span class="zhstyle" class="zhstyle" ng-if="mybid.bidder.status==2||mybid.bidder.status==3">未中标</span>
                                                    <br> 目前投标人数：{{mybid.bidder_count}}
                                                    <br> 距结束还有 {{mybid.end_day}}天 </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="kapdsar" style="height:35px;line-height:35px;width: 100%;border-top:1px solid #d7d7d7;background:#f6f6f6;text-align:center;margin-top:20px;border-radius:0 0 5px 5px;">
                                        <div class="namefont" style="width:100%;">
                                            <a href="javascript:void(0)" target="_blank" data-target="#confirm2" data-toggle="modal" ng-click="orderDetail(mybid.needs_id);"> <img src="${baseUrl}/images/markHall/wqoqiwj.png">查看详情 </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- No message -->
                        <div ng-if="mybidlist.length<=0">
                            <div class="timeline-box timeline-box-left"> <span class="dot"></span>
                                <div class="timeline-box-inner animate-left" style="border-radius:5px 5px 10px 10px;">
                                    <div>
                                        <div class="">
                                            <div class="sun"></div>
                                            <ul class="sunbd">
                                                <li class="moon"></li>
                                                <li class="annum"></li>
                                            </ul>
                                            <div class="daadasdy"></div>
                                        </div>
                                    </div> <span class="arrow"></span>
                                    <div class="message"> <img src="${baseUrl}/images/global/prompt_11.png">
                                        <p style="margin: 10px 0">您还没有家装订单,请到应标大厅接单</p> <a class="padlmop" href="${baseUrl}/mark/category" target="_blank">应标大厅接单</a> </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="grid-more" ng-if="mybidlist.length>0"> <span class="ajax-loader"></span>
                        <form role="search" method="get" action="${baseUrl}/user/index#/mybidlist/" target="_blank">
                            <div class="fulllist"></div>
                            <button class="btn btn-border ripple">查看全部</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- #experience -->
        <h2 class="section-title animate" style="margin-top: 5%;">我的订单</h2>
        <section id="experience" class="section section-experience" style="max-width:1200px; margin:0 auto;">
            <div class="animate-up">
                <div class="filter">
                    <div class="filter-inner">
                        <div class="filter-btn-group groupC">
                            <button data-filter="*">全部</button>
                            <button data-filter=".level2">设计阶段</button>
                            <button style="color:#999;" data-filter=".level3">施工阶段</button>
                        </div>
                        <div class="filter-bar barC">
                            <div> <span></span> </div>
                        </div>
                    </div>
                </div>
                <div class="timeline">
                    <div class="timeline-bar"></div>
                    <div class="timeline-inner clearfix">
                        <div ng-repeat="order in needsList" ng-init="index=$index">
                            <div class="timeline-box timeline-box-left" ng-if="index%2==0" style="height: 460px!important;"> <span class="dot"></span>
                                <div class="timeline-box-inner animate-left" style="padding:25px 0 0;border-radius: 5px 5px 10px 10px;">
                                    <div class="creationtime" style="padding:0 20px;height:30px;">
                                        <div class="creationtime">
                                            <div class="">
                                                <div class="sun" style="height:30px;">{{order.publish_time}}</div>
                                                <div class="daadasdy">应标阶段等待中</div>
                                            </div>
                                        </div>
                                    </div> <span class="arrow"></span>
                                    <div class="kapdsar" style="margin:0 20px;">
                                        <div class="namecolor sdsgsdh">{{order.community_name}}</div>
                                        <div class="date" style="float:right;margin-bottom:0;">装修预算:{{order.decoration_budget}}</div>
                                    </div>
                                    <div class="procedure" style="padding:0 0 0 20px;margin-top:50px;margin-bottom:-5px;">
                                        <ul class="procedureul" style="margin-left:-30px;width:120%;">
                                            <li>
                                                <a href="#step-1" class="selected selecting">
                                                    <div class="stepNumber"> 1 <i class="clip-checkmark-2" ng-show="order.bidders[0].wk_cur_sub_node_id>=13"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-2" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=13}">
                                                    <div class="stepNumber"> 2 <i class="clip-checkmark-2" ng-show="order.bidders[0].wk_cur_sub_node_id>=21"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-3" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=21}">
                                                    <div class="stepNumber"> 3 <i class="clip-checkmark-2" ng-show="order.bidders[0].wk_cur_sub_node_id>=31&&order.bidders[0].wk_cur_sub_node_id!=33"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-4" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=31&&order.bidders[0].wk_cur_sub_node_id!=33}">
                                                    <div class="stepNumber"> 4 <i class="clip-checkmark-2" ng-if="order.bidders[0].wk_cur_sub_node_id>=41"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-5" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=41}">
                                                    <div class="stepNumber"> 5 <i class="clip-checkmark-2" ng-if="order.bidders[0].wk_cur_sub_node_id>=51"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-6" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=51}">
                                                    <div class="stepNumber"> 6 <i class="clip-checkmark-2" ng-if="order.bidders[0].wk_cur_sub_node_id>=61"></i> </div>
                                                </a>
                                            </li>
                                        </ul>
                                        <ol style="margin-left:-23px;width:120%;">
                                            <dd style="width:80px;position:relative;top:-20px;">确认量房
                                                <br>
                                            </dd>
                                            <dd style="width:107px;">接收
                                                <br>量房费</dd>
                                            <dd style="width:79px;">创建
                                                <br>设计合同</dd>
                                            <dd style="width:107px;">接收
                                                <br>设计首款</dd>
                                            <dd style="width:83px;">接收
                                                <br>设计尾款</dd>
                                            <dd style="width:99px;">上传
                                                <br>设计交付物</dd>
                                        </ol>
                                    </div>
                                    <div class="creationtime-mian-design-data" style="margin:0 20px;width:92%;">
                                        <div class="creationtime-mian-design-data-header">
                                            <div style="width:72%">设计资料</div>
                                            <div style="width:28%">操作</div>
                                        </div>
                                        <div class="creationtime-mian-design-data-body">
                                            <div style="width:72%" class="creationtime-mian-design-data-body-left">
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=11" ng-click="orderDetail(order.needs_id)" href="javascript:void(0);" data-target="#measureconfirm" data-toggle="modal"> <img src="${baseUrl}/images/global/designerIcon(5).png" />
                                                    <p>量房表单</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id==33&&order.bidders[0].delivery[0].files.length>0" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#viewConfirm5"> <img src="${baseUrl}/images/global/designerIcon(6).png" />
                                                    <p>量房交付</p>
                                                </div>
                                                <div data-target="#contract2" data-toggle="modal" ng-if="order.bidders[0].wk_cur_sub_node_id>=41" ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,1,order.bidders[0].design_contract);"> <img src="${baseUrl}/images/global/designerIcon(7).png" />
                                                    <p>设计合同</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=61" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm6"> <img src="${baseUrl}/images/global/designerIcon(1).png" />
                                                    <p>渲染图</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=61" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm5"> <img src="${baseUrl}/images/global/designerIcon(2).png" />
                                                    <p>设计图纸</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=61" ng-click="viewDeliveryService(order.needs_id,order.bidders[0].wk_cur_sub_node_id);"> <img src="${baseUrl}/images/global/designerIcon(3).png" />
                                                    <p>3D方案</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=61" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm4"> <img src="${baseUrl}/images/global/designerIcon(4).png" />
                                                    <p>材料清单</p>
                                                </div>
                                            </div>
                                            <div style="width:28%"> <a ng-if="order.bidders[0].wk_cur_sub_node_id==11" style="margin-bottom:6px;" ng-click="orderDetail(order.needs_id)" href="javascript:void(0);" data-target="#measureconfirm" data-toggle="modal">确认量房</a> <a ng-if="order.bidders[0].wk_cur_sub_node_id>=21&&order.bidders[0].wk_cur_sub_node_id<61" style="margin-bottom:6px;" ng-click="getAsset(order.needs_id);" href="javascript:void(0);">进入3D设计</a> <a ng-if="order.bidders[0].wk_cur_sub_node_id==21" style="margin-bottom:6px;" ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,1,order.bidders[0].design_contract);" href="javascript:void(0);" data-target="#contract2" data-toggle="modal">创建设计合同</a> <a ng-if="order.bidders[0].wk_cur_sub_node_id==31" style="margin-bottom:6px;" ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,2,order.bidders[0].design_contract);" href="javascript:void(0);" data-target="#contract2" data-toggle="modal">修改设计合同</a> <a ng-if="order.bidders[0].wk_cur_sub_node_id==33&&order.bidders[0].delivery.length==0" style="margin-bottom:6px;" ng-click="designDelivery(order.needs_id,order.community_name,order.bidders[0].designer_id,0,order.bidders[0].wk_cur_sub_node_id);" href="javascript:void(0);" data-target="#confirm8" data-toggle="modal">量房交付</a> <a ng-if="order.bidders[0].wk_cur_sub_node_id==51" style="margin-bottom:6px;" ng-click="designDelivery(order.needs_id,order.community_name,order.bidders[0].designer_id,1,order.bidders[0].wk_cur_sub_node_id);" href="javascript:void(0);" data-target="#confirm8" data-toggle="modal">设计方案交付</a> </div>
                                        </div>
                                    </div>
                                    <div class="kapdsar" style="height:35px;line-height:35px;width: 100%;border-top:1px solid #d7d7d7;background:#f6f6f6;text-align:center;margin-top:20px;border-radius:0 0 5px 5px;">
                                        <div class="namefont" style="width:100%;">
                                            <a href="javascript:void(0)" target="_blank" data-target="#confirm2" data-toggle="modal" ng-click="orderDetail(order.needs_id);"> <img src="${baseUrl}/images/markHall/wqoqiwj.png">查看详情 </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="timeline-box timeline-box-right" ng-if="index%2==1" style="height: 460px!important; top:30px"> <span class="dot"></span>
                                <div class="timeline-box-inner animate-right" style="padding:25px 0 0; border-radius: 5px 5px 10px 10px;">
                                    <div class="creationtime" style="padding:0 20px;height:30px;">
                                        <div class="creationtime">
                                            <div class="">
                                                <div class="sun" style="height:30px;">{{order.publish_time}}</div>
                                                <div class="daadasdy">应标阶段等待中</div>
                                            </div>
                                        </div>
                                    </div> <span class="arrow"></span>
                                    <div class="kapdsar" style="margin:0 20px;">
                                        <div class="namecolor sdsgsdh">{{order.community_name}}</div>
                                        <div class="date" style="float:right;margin-bottom:0;">装修预算:{{order.decoration_budget}}</div>
                                    </div>
                                    <div class="procedure" style="padding:0 0 0 20px;margin-top:50px;margin-bottom:-5px;">
                                        <ul class="procedureul" style="margin-left:-30px;width:120%;">
                                            <li>
                                                <a href="#step-1" class="selected selecting">
                                                    <div class="stepNumber"> 1 <i class="clip-checkmark-2" ng-show="order.bidders[0].wk_cur_sub_node_id>=13"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-2" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=13}">
                                                    <div class="stepNumber"> 2 <i class="clip-checkmark-2" ng-show="order.bidders[0].wk_cur_sub_node_id>=21"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-3" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=21}">
                                                    <div class="stepNumber"> 3 <i class="clip-checkmark-2" ng-show="order.bidders[0].wk_cur_sub_node_id>=31&&order.bidders[0].wk_cur_sub_node_id!=33"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-4" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=31&&order.bidders[0].wk_cur_sub_node_id!=33}">
                                                    <div class="stepNumber"> 4 <i class="clip-checkmark-2" ng-if="order.bidders[0].wk_cur_sub_node_id>=41"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-5" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=41}">
                                                    <div class="stepNumber"> 5 <i class="clip-checkmark-2" ng-if="order.bidders[0].wk_cur_sub_node_id>=51"></i> </div>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#step-6" ng-class="{'selected selecting':order.bidders[0].wk_cur_sub_node_id>=51}">
                                                    <div class="stepNumber"> 6 <i class="clip-checkmark-2" ng-if="order.bidders[0].wk_cur_sub_node_id>=61"></i> </div>
                                                </a>
                                            </li>
                                        </ul>
                                        <ol style="margin-left:-23px;width:120%;">
                                            <dd style="width:80px;position:relative;top:-20px;">确认量房
                                                <br>
                                            </dd>
                                            <dd style="width:107px;">接收
                                                <br>量房费</dd>
                                            <dd style="width:79px;">创建
                                                <br>设计合同</dd>
                                            <dd style="width:107px;">接收
                                                <br>设计首款</dd>
                                            <dd style="width:83px;">接收
                                                <br>设计尾款</dd>
                                            <dd style="width:99px;">上传
                                                <br>设计交付物</dd>
                                        </ol>
                                    </div>
                                    <div class="creationtime-mian-design-data" style="margin:0 20px;width:92%;">
                                        <div class="creationtime-mian-design-data-header">
                                            <div style="width:72%">设计资料</div>
                                            <div style="width:28%">操作</div>
                                        </div>
                                        <div class="creationtime-mian-design-data-body">
                                            <div style="width:72%" class="creationtime-mian-design-data-body-left">
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=11" ng-click="orderDetail(order.needs_id)" href="javascript:void(0);" data-target="#measureconfirm" data-toggle="modal"> <img src="${baseUrl}/images/global/designerIcon(5).png" />
                                                    <p>量房表单</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id==33&&order.bidders[0].delivery[0].files.length>0" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#viewConfirm5"> <img src="${baseUrl}/images/global/designerIcon(6).png" />
                                                    <p>量房交付</p>
                                                </div>
                                                <div data-target="#contract2" data-toggle="modal" ng-if="order.bidders[0].wk_cur_sub_node_id>=41" ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,1,order.bidders[0].design_contract);"> <img src="${baseUrl}/images/global/designerIcon(7).png" />
                                                    <p>设计合同</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=61" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm6"> <img src="${baseUrl}/images/global/designerIcon(1).png" />
                                                    <p>渲染图</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=61" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm5"> <img src="${baseUrl}/images/global/designerIcon(2).png" />
                                                    <p>设计图纸</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=61" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm7"> <img src="${baseUrl}/images/global/designerIcon(3).png" />
                                                    <p>3D方案</p>
                                                </div>
                                                <div ng-if="order.bidders[0].wk_cur_sub_node_id>=61" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm4"> <img src="${baseUrl}/images/global/designerIcon(4).png" />
                                                    <p>材料清单</p>
                                                </div>
                                            </div>
                                            <div style="width:28%"> 
                                               <a ng-if="order.bidders[0].wk_cur_sub_node_id==11" style="margin-bottom:6px;" ng-click="orderDetail(order.needs_id)" href="javascript:void(0);" data-target="#measureconfirm" data-toggle="modal">确认量房</a> 
                                               <a ng-if="order.bidders[0].wk_cur_sub_node_id>=21 && order.bidders[0].wk_cur_sub_node_id<=51" style="margin-bottom:6px;" ng-click="getAsset(order.needs_id);" href="javascript:void(0);">进入3D设计</a> 
                                               <a ng-if="order.bidders[0].wk_cur_sub_node_id==21" style="margin-bottom:6px;" ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,1,order.bidders[0].design_contract);" href="javascript:void(0);" data-target="#contract2" data-toggle="modal">创建设计合同</a>
                                               <a ng-if="order.bidders[0].wk_cur_sub_node_id==31" style="margin-bottom:6px;" ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,2,order.bidders[0].design_contract);" href="javascript:void(0);" data-target="#contract2" data-toggle="modal">修改设计合同</a> 
                                               <a ng-if="order.bidders[0].wk_cur_sub_node_id==33&&order.bidders[0].delivery.length==0" style="margin-bottom:6px;" ng-click="designDelivery(order.needs_id,order.community_name,order.bidders[0].designer_id,0,order.bidders[0].wk_cur_sub_node_id);" href="javascript:void(0);" data-target="#confirm8" data-toggle="modal">量房交付</a> 
                                               <a ng-if="order.bidders[0].wk_cur_sub_node_id==51" style="margin-bottom:6px;" ng-click="designDelivery(order.needs_id,order.community_name,order.bidders[0].designer_id,1,order.bidders[0].wk_cur_sub_node_id);" href="javascript:void(0);" data-target="#confirm8" data-toggle="modal">设计方案交付</a> </div>
                                        </div>
                                    </div>
                                    <div class="kapdsar" style="height:35px;line-height:35px;width: 100%;border-top:1px solid #d7d7d7;background:#f6f6f6;text-align:center;margin-top:20px;border-radius:0 0 5px 5px;">
                                        <div class="namefont" style="width:100%;">
                                            <a href="javascript:void(0)" target="_blank" data-target="#confirm2" data-toggle="modal" ng-click="orderDetail(order.needs_id);"> <img src="${baseUrl}/images/markHall/wqoqiwj.png">查看详情 </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- No message-->
                    <div ng-if="needsList.length<=0">
                        <div class="timeline-box timeline-box-left"> <span class="dot"></span>
                            <div class="timeline-box-inner animate-left" style="border-radius:5px 5px 10px 10px;">
                                <div>
                                    <div class="">
                                        <div class="sun"></div>
                                        <ul class="sunbd">
                                            <li class="moon"></li>
                                            <li class="annum"></li>
                                        </ul>
                                        <div class="daadasdy"></div>
                                    </div>
                                </div> <span class="arrow"></span>
                                <div class="message"> <img src="${baseUrl}/images/global/prompt_11.png">
                                    <p style="margin: 10px 0">您还没有家装订单,请到应标大厅接单</p> <a class="padlmop" href="${baseUrl}/mark/category" target="_blank">应标大厅接单</a> </div>
                            </div>
                        </div>
                    </div>
                    <div style="clear: both; display: block; height: 50px;"></div>
                </div>
                <div class="grid-more" ng-if="needsList.length>0"> <span class="ajax-loader"></span>
                    <form role="search" method="get" action="${baseUrl}/user/index#/designerOrder/" target="_blank">
                        <div class="fulllist"></div>
                        <button class="btn btn-border ripple">查看全部</button>
                    </form>
                </div>
            </div>
    </div>
    </section>
    <!-- #experience -->
    <!-- #clients -->
    </div>
    </div>
    <!-- .container -->
    </div>
    <!-- .content -->
    <!-- .footer -->
    </div>
    <!-- .wrapper -->
    <!-- Design confirmation volume -->
    <div class="modal-dialog modal fade confirmMain" id="measureconfirm" tabindex="-1" role="dialog" aria-hidden="true" style="position:fixed; top:10%;display:none;">
        <div class="modal-content">
            <div class="modal-header" style="border:none;padding:25px;padding-left:45px;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> <img src="${baseUrl}/images/userCenter/m-close-icon.png"> </button>
                <h4 class="modal-title ng-binding">{{detail.community_name}}</h4>
                <div class="needs_num ng-binding" style="margin-top:20px">项目编号 : {{detail.needs_id}}</div>
            </div>
            <div class="modal-body" style="overflow:hidden;padding:0;">
                <div class="col-md-12" style=background:#fff;line-height:30px;">
		        	<div class="col-md-12 confirmform">
		            	<div class="col-md-6">发布时间:</div>
		            	<div class="col-md-6">{{detail.publish_time}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">客户姓名:</div>
		            	<div class="col-md-6">{{detail.contacts_name}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">联系电话:</div>
		            	<div class="col-md-6">{{detail.contacts_mobile}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">装修预算:</div>
		            	<div class="col-md-6">{{detail.decoration_budget}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">设计预算:</div>
		            	<div class="col-md-6">{{detail.design_budget}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">房屋类型:</div>
		            	<div class="col-md-6">{{detail.house_type|replaceHouseType}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">房屋面积:</div>
		            	<div class="col-md-6">{{detail.house_area|replaceArea}} m²</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">户型:</div>
		            	<div class="col-md-6">{{detail.room|replaceRoomType}}{{detail.living_room|replaceBedRoom}}{{detail.toilet|replaceRestRoom}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">风格:</div>
		            	<div class="col-md-6">{{detail.decoration_style|replaceStyle}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">地址:</div>
		            	<div class="col-md-6">{{detail.province_name}}{{detail.city_name}}{{detail.district_name|replaceNone}}</div>
		            </div>
		            <div class="col-md-12 confirmform" style="color:#0084ff;">
		            	<div class="col-md-6">量房时间:</div>
		            	<div class="col-md-6">{{detail.bidders[0].measure_time}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-6">量房费:</div>
		            	<div class="col-md-6">{{detail.bidders[0].measurement_fee}}元</div>
		            </div>
	            	<!-- <div class="col-md-12" style="background:#DAEDF8;padding-top:10px;margin-bottom:15px;border-radius:10px">
	                	<p style="color:#5185A4">设计宣言：我超级棒的请选我为您服务，这是我的作品链接</p>
	                	<p style="color:#5185A4">http://www.sj.com</p>
	                </div> -->
		        </div>
	        </div>
            <div class="modal-footer" style="background: #fff; border-radius: 5px!important;border:none;margin-top:10px;">
            	<div id="poploading" class="poploading"><img src="${baseUrl}/images/global/LoadingCursor2.gif" /></div>
            	 <button type="button" class="NewBtn btn-defaultClose" data-dismiss="modal">
				关闭
				</button> 
            	<button type="button"  ng-if="detail.bidders[0].wk_cur_sub_node_id==11" class="NewBtn btn-refuse" data-target="#remind" data-toggle="modal" data-dismiss="modal">
				拒绝
				</button>
				<button type="button"  ng-if="detail.bidders[0].wk_cur_sub_node_id==11" class="NewBtn btn-primarySubmit" ng-click="confirm(detail.needs_id,detail.member_id)" data-dismiss="modal">
				确认量房
				</button>
            </div>
        </div> 
    </div>
<!-- /Design confirmation volume -->
<!-- contract2 -->
	<div class="modal fade confirmMain" id="contract2" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" style="width:900px !important">
		<div class="modal-content" style="height:810px;">
			<div class="modal-header" style="border:none;padding:25px;padding-left:45px;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<img src="${baseUrl}/images/userCenter/m-close-icon.png" />
				</button>
				<h4 class="modal-title">设计合同</h4>
			</div>
			<div class="modal-body" style="height:690px;overflow:hidden;"> 
				<!-- start: PAGE HEADER -->
				<div id="sample-table-1">
					<div id="description" class="description" style="height:685px;overflow:hidden;">
					<div class="col-sm-12"><div class="row"><div class="contract-title">住宅室内装饰设计合同</div></div></div>	
					<!-- start: PAGE CONTENT -->
					<div class="contract-logo col-sm-12"><img alt="设计家logo" src="${baseUrl}/images/userCenter/contracts_logo.png"></div>
					<input type="hidden" ng-model="contractNumber"> 
					<div class="contract-info col-sm-12"><div class="l">合同编号：<span>{{contractNumber}}</span></div><div class="r">签订时间：<span>{{time|date:'yyyy-MM-dd'}}</span></div></div>
					<div class="row owner-designer-info" id="owner_designer_info">
						<div class="col-sm-6 contract-owner">
							<div class="name col-sm-12 tdnowrap" ng-class="{ 'conVal':name_error==true}">
								<span style="float:left;">甲方(消费者): </span>
								<span ng-if="status>=41">{{name}}</span>
                    <input ng-show="status<41" class="form-control conValInput" name="pro-name2" id="pro-name" type="text" value="" ng-model="name" placeholder="{{detail.contacts_name}}" ng-focus="clearError.name();" /> <span ng-if="name_error==true" class="conValidation">姓名必填项！</span> </div>
                <div class="address col-sm-12 tdnowrap"> <span style="float:left;">装修地址 ： </span> <span ng-show="status>=41">{{addr}}</span>
                    <input ng-show="status<41" class="" id="" name="page-cost" type="text" value="" ng-model="addr" placeholder="{{detail.province_name}}{{detail.city_name}}{{detail.district_name|replaceNone}}" /> </div>
                <div class="address col-sm-12 tdnowrap" ng-class="{'conVal':addrDe_error==true}"> <span style="float:left;">详细地址 ： </span> <span ng-show="status>=41">{{addrDe}}</span>
                    <input ng-show="status<41" class="conValInput" id="" name="pagecost" type="text" value="" ng-model="addrDe" placeholder="{{detail.province_name}}{{detail.city_name}}{{detail.district_name|replaceNone}}{{detail.community_name}}" /> <span ng-if="addrDe_error==true" class="conValidation">详细地址必填项！</span> </div>
                <div class="postcode col-sm-12 tdnowrap"> <span style="float:left;">邮政编码 : </span> <span ng-show="status>=41">{{zip}}</span>
                    <input ng-show="status<41" class="" name="postcode" type="text" value="" ng-model="zip" placeholder="100007" maxlength="6" /> </div>
                <div class="phone col-sm-12 tdnowrap" ng-class="{'conVal':mobile_error==true||error==true}"> <span style="float:left;">手机号码 : </span> <span ng-show="status>=41">{{mobile}}</span>
                    <input ng-show="status<41" class="conValInput" name="phone" type="text" value="" ng-model="mobile" placeholder="{{detail.contacts_mobile}}" maxlength="11" /> <span ng-if="mobile_error==true" class="conValidation">手机号码必填项！</span> <span ng-if="error==true" class="conValidation">手机格式有误！</span> </div>
                <div class="mail col-sm-12 tdnowrap"> <span style="float:left;">电子邮箱 : </span> <span ng-show="status>=41">{{email}}</span>
                    <input ng-show="status<41" class="" name="mail" type="text" value="" ng-model="email" placeholder="user@customer.cn" /> </div>
            </div>
            <div class="col-sm-6 pull-right contract-designer">
                <div class="name col-sm-12 tdnowrap"> <span class="">乙方(设计师):</span> <span class="">{{designerInfo.real_name.real_name}}</span> </div>
                <div class="address col-sm-12 tdnowrap"> <span class="">服务地址 : </span><span class="">{{addr}}</span> </div>
                <div class="address col-sm-12 tdnowrap"> <span class="">详细地址 : </span><span class="">{{addrDe}}</span> </div>
                <div class="postcode col-sm-12 tdnowrap"> <span class="">邮政编码 : </span> <span class="">{{designerInfo.zip_code}}</span> </div>
                <div class="phone col-sm-12 tdnowrap"> <span class="">手机号码 : </span> <span class="">{{designerInfo.real_name.mobile_number}}</span> </div>
                <div class="mail col-sm-12 tdnowrap"> <span class="">电子邮箱 : </span> <span class="">{{designerInfo.email}}</span> </div>
            </div>
        </div>
        <div class="row contract-rules">
            <div class="col-md-12">
                <div class="tit">1.设计工作内容</div>
                <div class="text-cont" style="padding-left:6px;">
                    <p class="txt"><span class="serial">1.1</span>&nbsp;&nbsp;平面规划设计: 量房后乙方设计师根据甲方提供的需求信息开始平面规划设计，包括设计理念阐述、平面布置图、概念参考图等。甲方书面确认后，平面规划设计完成。</p> <span class="serial">1.2</span>&nbsp;&nbsp;甲乙双方协商，乙方应提供给甲方
                    <form role="form" class="form-horizontal Act-1-form" style="margin-left:45px;">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="form-field-1">效果图 :</label>
                            <div class="col-sm-4 helpInline"><span ng-if="status>=41">{{contract_Data.design_sketch}}</span>
                                <input type="text" placeholder="" class="form-control" ng-show="status<41" ng-model="impression" ng-focus="clearError.impressionDrawing();" value="" /> <span class="help-inline">张 </span></div> <span ng-if="impressionDrawing_error==true" class="formGspan">请填写</span> <span ng-if="impressionDrawing_is_number_error==true" class="formGspan">请填写数字</span> </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="form-field-1">渲染图 :</label>
                            <div class="col-sm-4 helpInline"><span ng-if="status>=41">{{contract_Data.render_map}}</span>
                            <input type="text" placeholder="" class="form-control" ng-show="status<41" ng-model="diy" ng-focus="clearError.diy();" /><span class="help-inline">张 </span></div> 
                            <span ng-if="diy_error==true" class="formGspan">请填写</span> 
                            <span ng-if="diy_is_number_error==true" class="formGspan">请填写数字</span> 
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="form-field-1">每增加一张效果图费用 :</label>
                            <div class="col-sm-4 helpInline"><span ng-if="status>=41">{{contract_Data.design_sketch_plus|currency : ''}}</span>
                                <input type="text" placeholder="" class="form-control" ng-show="status<41" ng-model="price" ng-focus="clearError.price();" /><span class="help-inline">元</span></div> 
                                <span ng-if="price_error==true" class="formGspan">请填写</span> 
                                <span ng-if="price_is_number_error==true" class="formGspan">请填写数字</span> 
                             </div>
                    </form>
                </div>
                <div class="tit">2.本项目设计费</div>
                <div>
                    <form role="form" class="form-horizontal Act-2-form" style="margin-left:45px;">
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="form-field-1">
                                </span>本项目设计费总额：</label>
                            <div class="col-sm-4 helpInline"><span ng-if="status>=41">{{totalDesign|currency : ''}}</span>
                                <input type="text" ng-show="status<41" value="" placeholder="" class="inp-input sign-money form-control" ng-model="totalDesign" ng-focus="clearError.totalDesign();" /><span class="help-inline">元 </span></div>
                                <span ng-if="totalDesign_error==true" class="formGspan">请填写</span> 
                                <span ng-if="totalDesign_is_number_error==true" class="formGspan">请填写数字</span> 
                             </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="form-field-1">设计首款 :</label>
                            <div class="col-sm-4 helpInline">
                                <input type="text" ng-show="status<41" placeholder="" value="" class="form-control" ng-model="designFirst" ng-focus="clearError.designFirst();" /><span ng-if="status>=41">{{designFirst|currency : ''}}</span><span class="help-inline">元 </span></div> 
                                <span ng-if="designFirst_error==true" class="formGspan">请填写</span> 
                                <span ng-if="designFirst_is_number_error==true" class="formGspan">请填写数字</span> 
                                <span ng-if="designFirst_is_error==true" style="color:#666;"> <img src="${baseUrl}/images/userCenter/warning-mark.png"></img>设计首款不得低于80%</span> 
                                <span ng-if="designFirst_gte_error==true" class="formGspan">首款金额不能大于总金额</span>
                            </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label" for="form-field-1">设计尾款 :</label>
                            <div class="col-sm-4 helpInline">
                            <input ng-if="status<41" type="text" class="form-control" value="{{totalDesign-designFirst|currency : ''}}" /><span ng-if="status>=41">{{totalDesign-designFirst|currency : ''}}</span> <span class="help-inline">元</span></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="row contract-detail" style="margin-top:16px;">
            <div class="col-md-12" style="padding:0;">
                <!-- start: DYNAMIC TABLE PANEL -->
                <div class="panel panel-default">
                    <div class="panelAccordionHeading" style="background-color:#0084ff">合同详情
                        <div class="contractAccordion"> <span class="contract-accordion-icon">收起</span><span class="word">展开</span> </div>
                    </div>
                    <div class="panel-body" id="contract-body">
                        <div class="row">
                            <div class="col-md-12 space20">
                                <div class="btn-group pull-right">
                                    <ul class="dropdown-menu dropdown-light pull-right">
                                        <li><a href="#" class="export-png" data-table="#sample-table-1">下载图档</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table ">
                                <tbody>
                                    <tr>
                                        <td>
                                            <p class="sign-txt-head">根据《中华人民共和国合同法》，以及其他有关法律、法规规定的原则，结合室内装饰装修的特点，经甲、乙双方友好协商，现就甲方委托乙方承担室内装饰设计（不含结构设计、空调消防系统设计、智能系统设计）事宜达成如下协议。</p>
                                            <div class="sign-txt">
                                                <p class="txt"><span class="serial">1.2</span>效果设计：平面规划设计确定后，乙方开始效果设计，包括最终平面布置图、空间效果图或使用平台提供的DIY软件生成的渲染图。 </p>
                                                <!--<p class="txt-small"></p>-->
                                                <p class="txt"><span class="serial">1.3</span>施工图设计：甲方书面确定方案设计后，乙方开始施工图设计，包括但不限于：（图纸目录、主材明 细表、设计说明、主材告知书、原始测量图、拆除图、新建图、平面布置图、强弱电插座图、开关控制灯具图、综合天花图、水路平面示意图图、地面布置周长面积图、排砖图、墙体饰面图、客厅背景墙详图、节点大样）。</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <!-- <div class="sign-txt">
														<h4 class="tit">2.设计周期</h4>
														<div class="text-cont">
															<p class="txt"><span class="serial">2.2</span>甲方分两个阶段支付设计费，设计周期从甲方付款之日开始计算： </p>
															<table class="table ">
																<thead><tr><th> 设计阶段</th><th> 设计费比例</th><th> 金额（元）</th><th> 付款说明</th></tr></thead>
																<tr><td>平面规划设计</td><td>不低于<span class="red"> 20 %</span></td><td></td><td>线上签订设计合同订单，三日内</td></tr>
																<tr><td>效果及施工图设计</td><td>设计尾款</td><td></td><td>完成效果图及施工图设计后，甲方进行支付尾款，乙方将所有图纸交给甲方</td></tr>
															</table>
															<p></p>
															<p class="txt"><span class="serial">2.3</span>甲方在签合同前已支付的定金或量房费从首期款中扣除。</p>
															<p class="txt"><span class="serial">2.4</span>甲方延期付款,设计周期自动顺延。</p>
															<p class="txt"><span class="serial">2.5</span>如工程地址为乙方服务区域范围以外地区，则乙方人员发生的差旅费用如：长途往返交通（飞机、高铁等）、当地交通、住宿（不低于经济型连锁酒店标准）等由甲方直接承担。</p>
														</div>
													</div> -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="sign-txt">
                                                <h4 class="tit">3.甲方责任</h4>
                                                <div class="text-cont">
                                                    <p class="txt"><span class="serial">3.1</span>甲方应按乙方要求及时、准确且完整的提供设计所需原始户型图等项目建筑基本图纸等资料；</p>
                                                    <p class="txt"><span class="serial">3.2</span>甲方应按约定的日期及金额向乙方支付设计费用； </p>
                                                    <p class="txt"><span class="serial">3.3</span>甲方不得要求乙方设计师违反国家有关标准或规定进行设计；</p>
                                                    <p class="txt"><span class="serial">3.4</span>本工程建筑材料、设备的加工订货如需乙方设计人员配合时，所需费用由甲方承担；</p>
                                                    <p class="txt"><span class="serial">3.5</span>甲方有权对乙方发送的设计方案提出修改调整意见，并享有最终确认权。甲方应于乙方发送设计方案（含修改后方案）后三日内以书面形式或邮件形式提出修改意见或签署确认，但修改调整限定于已选定主调装饰风格范畴内。逾期既未确认又未提出书面修改意见的，视为同意确认该设计图纸或方案；</p>
                                                    <p class="txt"><span class="serial">3.6</span>甲方如需改动承重结构图，由甲方向乙方提供原始结构及原始建筑图，结构改造图纸由专业设计院统一设计和盖章收费，如需乙方进行建筑设计的，则另行协商收费；</p>
                                                    <p class="txt"><span class="serial">3.7</span>如甲方提供原始测量图（乙方未进行现场实地测量），乙方根据甲方提供的原始测量图数据，为甲方出具装饰施工图和约定效果图，相关设计图纸应标明尺寸、材质、用料、颜色 、图标以及设计说明等内容。</p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="sign-txt">
                                                <h4>4.乙方责任</h4>
                                                <div class="text-cont">
                                                    <p class="txt"><span class="serial">4.1</span>如乙方进行现场实地测量，在收取设计费后，根据实际测量与设计方案需要，向甲方提供装饰施工图和约定效果图，相关设计图纸应标明尺寸、材质、用料、颜色 、图标以及设计说明等内容；</p>
                                                    <p class="txt"><span class="serial">4.2</span>乙方应尽职尽责完成设计方案，及时与甲方沟通征求意见并予以修改完善，按照约定向甲方交付和确认设计工程；</p>
                                                    <p class="txt"><span class="serial">4.3</span>在施工过程中，乙方设计师根据具体施工情况与进度，有责任提供不少于3次的现场施工指导或协助解决与设计有关的技术问题，以实现原设计效果；</p>
                                                    <p class="txt"><span class="serial">4.4</span>在装修过程中，如甲方需要，乙方有责任提供在居然在线进行线上推荐选购或陪同甲方在居然之家挑选装饰材料、家具配饰的服务；</p>
                                                    <p class="txt"><span class="serial">4.5</span>对于现场施工服务指导服务和材料挑选服务，如发生在异地的情况，请甲乙双方自行协商。</p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="sign-txt">
                                                <h4 class="tit">5.合同顺延</h4>
                                                <div class="text-cont">
                                                    <p class="txt"><span class="serial">5.1</span>甲方发生下列情形之一的，乙方有权顺延设计期限：</p>
                                                    <p class="txt-small">（1）未按照约定支付设计费用的；</p>
                                                    <p class="txt-small">（2）延期发送设计工作所依据的图纸资料的；</p>
                                                    <p class="txt-small">（3）逾期提出修改意见或签署确认书的；</p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="sign-txt">
                                                <h4 class="tit">6.违约责任</h4>
                                                <div class="text-cont">
                                                    <p class="txt"><span class="serial">6.1</span>因乙方设计未按国家有关设计规定、规范要求而发生错误造成甲方工程质量事故的，乙方除负责采取补救措施外，还应根据损失程度按照国家相关规定向甲方支付赔偿金。</p>
                                                    <p class="txt"><span class="serial">6.2</span>乙方未能按照合同约定的期限完成设计工作内容，甲方可在平台申请退款或向平台客服发起投诉。</p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="sign-txt">
                                                <h4 class="tit">7.其他事项</h4>
                                                <div class="text-cont">
                                                    <p class="txt"><span class="serial">7.1</span>本合同未包含的园林设计和配饰设计另行约定补充协议。</p>
                                                    <p class="txt"><span class="serial">7.2</span>乙方对其为甲方设计的成果依法享有版权，甲方支付全部费用后，设计成果的版权除署名权外均 转让给甲方；但是未经乙方书面允许，甲方不得将本项目设计成果用于其它项目；乙方享有仅在本项目推广及乙方汇编作品集、参展、参赛、出席研讨、行业内报刊投稿、乙方自身宣传中使用的权利，不得用于其它项目。</p>
                                                    <p class="txt"><span class="serial">7.3</span>本合同在履行过程中发生纠纷，甲乙方应及时协商解决。协商不成时，向仲裁委员会申请仲裁； </p>
                                                    <p class="txt"><span class="serial">7.4</span>本合同未尽事宜，双方可签订补充协议作为附件，补充协议与本合同同具有相等效力；</p>
                                                    <p class="txt"><span class="serial">7.5</span>本合同于双方履行完毕各自义务后自动终止； </p>
                                                    <p class="txt"><span class="serial">7.6</span>本合同正本经甲乙双方签章后生效。本合同一式两份，甲方执一份，乙方执一份。</p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- end: DYNAMIC TABLE PANEL -->
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 invoice-block" style="text-align:center;">
                <label class="checkbox-inline">
                    <input type="checkbox" class="red" value="" disabled="true" checked="checked">同意"合同编号：{{contractNumber}}"所有内容</label>
            </div>
            <!-- <div class="col-sm-5">
						<label class="checkbox-inline"><input type="checkbox" class="red" value="" checked="checked">选择居然施工</label>
					</div> -->
            <div class="col-sm-12 invoice-block contract-opeartion">
                <a href="javascript:void();" class="contract-download" style="margin-right:30px;"><img src="${baseUrl}/images/userCenter/download.png" alt="下载"><span style="vertical-align:middle">下载</span></a>
                <a onclick="javascript:window.print();" class="contract-print"><img src="${baseUrl}/images/userCenter/print.png" alt="打印">&nbsp<span style="vertical-align:middle">打印 </span></a>
            </div>
        </div>
    </div>
    </div>
    <!-- end: PAGE CONTENT-->
    </div>
    <!-- <iframe src="contract.html" width="100%" height="500" style="border:none" ></iframe> -->
    <div class="modal-footer">
        <button class="NewBtn btn-defaultClose" aria-hidden="true" data-dismiss="modal" class="close" type="button">关闭</button>
        <!-- data-dismiss="modal" data-toggle="modal" data-target="" -->
        <button class="NewBtn btn-primarySubmit" aria-hidden="true" ng-if="status==21" ng-disabled="ableFlag" ng-click="saveContract(needs_id);" class="close" type="button" >创建发送</button>
        <!-- #contractprompt -->
        <button class="NewBtn btn-primarySubmit" aria-hidden="true" ng-if="status==31" ng-disabled="ableFlag" ng-click="saveContract(needs_id);" class="close" type="button">修改发送</button>
    </div>
    </div>
    <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
    </div>
    <!-- / -->
    <!-- start  Design delivery  -->
    <div class="modal fade confirmMain" id="confirm8" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%">
        <div class="modal-dialog" style="width:800px">
            <div class="modal-content">
                <div class="modal-header" style="padding:25px;padding-left:35px" ng-if="schemeList.design_file.length>0&&is_designdrawing">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal"> <img src="${baseUrl}/images/userCenter/m-close-icon.png" /> </button>
                    <h4 class="modal-title">{{community_name}}</h4> </div>
                <div class="modal-header" style="padding:25px;background:#0084ff;color:#fff;border-radius:4px 4px 0 0" ng-if="schemeList.design_file.length<=0||!is_designdrawing">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal" style="font-size:32px;color:#fff;margin-top:-7px;"> <img src="${baseUrl}/images/userCenter/m-close-icon1.png" /> </button>
                    <h5 class="modal-title">您还没有完善交付档案，请到“个人中心>>我的设计方案”上传后再试</h5> </div>
                <div class="modal-body" style="overflow:hidden">
                    <div class="col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="border:none;background:#eaeaea!important;color:#333!important;"> 交付档案列表
                                <div class="panel-tools"> </div>
                            </div>
                            <div class="panel-body col-md-12">
                                <table id="sample-table-2" class="table table-striped" style="vertical-align:middle; text-align:center;background:#fff;margin-bottom:0;">
                                    <thead>
                                        <tr>
                                            <th class="col-md-4">档案类别</th>
                                            <th class="col-md-4">档案名称</th>
                                            <th class="col-md-4">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-if="type==1">
                                            <td class="center"> <img alt="image" src="${baseUrl}/images/global/designerIcon(3).png" height="48" width="40"> </td>
                                            <td class="center">3D 设计方案</td>
                                            <td class="center" style="color:#1fbad6">
                                                <a href="javascript:void(0);" ng-if="schemeList.design_file.length>0&&is_diy" data-toggle="modal" data-target="#confirm7" data-dismiss="modal" href="javascript:void(0)"> <img src="${baseUrl}/images/global/upload_01.png" height="28" width="28" alt=""> </a>
                                                <a href="javascript:void(0);" ng-if="schemeList.design_file.length==0||!is_diy" data-toggle="tooltip" title="未上传" data-placement="bottom"> <img src="${baseUrl}/images/global/upload_02.png" height="28" width="28" alt=""> </a>
                                            </td>
                                        </tr>
                                        <tr ng-if="type==1">
                                            <td class="center"> <img alt="image" src="${baseUrl}/images/global/designerIcon(1).png" height="48" width="40"> </td>
                                            <td class="center">渲染图交付</td>
                                            <td class="center">
                                                <a class="tooltips" data-toggle="modal" ng-if="schemeList.design_file.length>0&&is_bom" data-dismiss="modal" data-target="#confirm6" title="已上传" href="javascript:void(0)"> <img src="${baseUrl}/images/global/upload_01.png" height="28" width="28" alt=""> </a>
                                                <a class="tooltips" href="javascript:void(0)" ng-if="schemeList.design_file.length==0||!is_bom"> <img src="${baseUrl}/images/global/upload_02.png" height="28" width="28" alt=""> </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="center"> <img alt="image" src="${baseUrl}/images/global/designerIcon(2).png" height="48" width="40"> </td>
                                            <td class="center">设计图纸</td>
                                            <td class="center">
                                                <a class="tooltips" ng-if="schemeList.design_file.length>0&&is_designdrawing" data-toggle="modal" data-target="#confirm5" data-dismiss="modal" title="已上传" href="javascript:void(0)"> <img src="${baseUrl}/images/global/upload_01.png" height="28" width="28" alt=""> </a>
                                                <a class="tooltips" title="未上传" href="javascript:void(0)" ng-if="schemeList.design_file.length==0||!is_designdrawing"> <img src="${baseUrl}/images/global/upload_02.png" height="28" width="28" alt=""> </a>
                                            </td>
                                        </tr>
                                        <tr ng-if="type==1">
                                            <td class="center"> <img alt="image" src="${baseUrl}/images/global/designerIcon(4).png" height="48" width="40"> </td>
                                            <td class="center">材料清单</td>
                                            <td class="center">
                                                <a id="finialbn03" ng-if="schemeList.design_file.length>0&&is_forageList" class="tooltips" data-toggle="modal" data-target="#confirm4" data-dismiss="modal" title="已上传" href="javascript:void(0)"> <img src="${baseUrl}/images/global/upload_01.png" height="28" width="28" alt=""> </a>
                                                <a class="tooltips" ng-if="schemeList.design_file.length==0||!is_forageList" title="未上传" href="javascript:void(0)"> <img src="${baseUrl}/images/global/upload_02.png" height="28" width="28" alt=""> </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer"> 
                	<button href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭">关闭</button>
                	<button href="javascript:void(0);" ng-if="type==1" class="NewBtn btn-primarySubmit tooltips" data-placement="bottom" data-original-title="发送" ng-disabled="goAbleFlag" ng-click="saveDesignDelivery();" >发送</button> 
                	<button href="javascript:void(0);" ng-if="type==0" class="NewBtn btn-primarySubmit tooltips" data-placement="bottom" data-original-title="发送" ng-disabled="goAbleFlag" ng-click="saveDesignDelivery();" >发送</button> 
                </div>
            </div>
        </div>
    </div>
    <!--  end  Design delivery -->
    <!--  -->
    <div class="modal fade confirmMain" id="confirm7" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="padding:25px;min-height:60px">
                    <button class="close" ng-if="type<2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;"> <img src="${baseUrl}/images/userCenter/m-close-icon.png" /> </button>
                    <button class="close" ng-if="type==2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;"> <img src="${baseUrl}/images/userCenter/m-close-icon.png" /> </button>
                    <h4 class="modal-title">{{schemeList.community_name}}</h4> </div>
                <div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
                    <div class="col-sm-12" style="padding:0;">
                        <div class="panel panel-default" style="height:400px;">
                            <div class="panel-heading" style="border:none;"> 3D 设计方案
                                <div class="panel-tools"> </div>
                            </div>
                            <!--  Submit deliverables  -->
                            <div class="panel-body wrapper description" ng-if="schemeList.design_file.length>0&&status==51" style="height:200px;">
                                <input type="hidden" name="bom" id="diy" />
                                <div href="javascript:void(0)" class="planfloat planfloater" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==10">
                                    <div class="plan"> <span class="planSpanSelected" id="{{scheme.id}}"></span>
                                        <a href="JavaScript:void(0);"> <img ng-src="{{scheme.link}}" style="height:110px;width:146px;" alt=""> </a>
                                    </div>
                                    <div class="center">{{schemeList.community_name}}{{index+1}}</div>
                                </div>
                            </div>
                            <!-- View delivery -->
                            <div class="panel-body wrapper description" ng-if="status==61">
                                <input type="hidden" name="bom" id="diy" />
                                <div href="javascript:void(0)" class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==10">
                                    <div class="plan">
                                        <a href="${baseUrl}/3Dscheme/open3Dscheme/hs_design_id/{{schemeList.hs_design_id}}/acs_asset_id/{{asset_id}}/acs_project_id/{{needs_id}}/"> <img ng-src="{{scheme.url}}" style="height:110px;width:146px;" alt=""> </a>
                                    </div>
                                    <div class="center">{{schemeList.community_name}}{{index+1}}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer"> 
                	<a href="javascript:void(0);" ng-if="type<2" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-toggle="modal" data-target="#confirm8" data-original-title="关闭" >关闭</a> 
                	<a href="javascript:void(0);" ng-if="type==2" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-toggle="modal" data-original-title="关闭" >关闭</a> 
                	<a href="javascript:void(0);" ng-if="status==51" class="NewBtn btn-primarySubmit tooltips" data-placement="bottom" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" data-original-title="发送" ng-click="submit(1);" >确定</a> 
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade confirmMain" id="confirm6" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="padding:25px;">
                    <button class="close" aria-hidden="true" ng-if="type<2" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;"> <img src="${baseUrl}/images/userCenter/m-close-icon.png" /> </button>
                    <button class="close" aria-hidden="true" ng-if="type==2" type="button" data-toggle="modal" data-dismiss="modal" style="font-size:34px;color:#000;"> <img src="${baseUrl}/images/userCenter/m-close-icon.png" /> </button>
                    <h4 ng-if="status<51" class="modal-title">{{schemeList.community_name}}</h4>
                    <h4 ng-if="status==61" class="modal-title">{{community_name}}</h4> </div>
                <div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
                    <div class="col-sm-12" style="padding:0;">
                        <div class="panel panel-default" style="height:400px;">
                            <div class="panel-heading" style="border:none;"> {{schemeList.community_name}}方案一 &gt; 渲染图
                                <div class="panel-tools"> </div>
                            </div>
                            <!--  Submit deliverables  -->
                            <div class="panel-body wrapper description" ng-if="status==51">
                                <input type="hidden" name="bom" id="bom" />
                                <div href="javascript:void(0)" class="planfloat planfloater" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==0">
                                    <div class="plan"> <span class="planSpanSelected" id="{{scheme.id}}"></span> <img ng-src="{{scheme.link}}" style="height:110px;width:146px;" alt=""> </div>
                                    <div class="center">渲染{{index+1}}</div>
                                </div>
                            </div>
                            <!-- View delivery -->
                            <div class="panel-body wrapper description" ng-if="status==61">
                                <div href="javascript:void(0)" class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==0">
                                    <div class="plan"> <img ng-src="{{scheme.url}}" style="height:110px;width:146px;" alt="" data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-click="enlargePicture(scheme.usage_type);"> </div>
                                    <div class="center">渲染{{index+1}}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer"> 
                	<a href="javascript:void(0);" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
                	<a href="javascript:void(0);" ng-if="type==2" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭">关闭</a> 
                	<a href="javascript:void(0);" ng-if="status==51" class="NewBtn btn-primarySubmit tooltips" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" data-placement="bottom" data-original-title="发送" ng-click="submit(2);">确定</a> 
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade confirmMain" id="confirm5" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="padding:25px;border:0px">
                    <button class="close" ng-if="type<2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;"> <img src="${baseUrl}/images/userCenter/m-close-icon.png" /> </button>
                    <button class="close" ng-if="type==2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" style="font-size:34px;color:#000;"> <img src="${baseUrl}/images/userCenter/m-close-icon.png" /> </button>
                    <h4 ng-if="status<51" class="modal-title">{{schemeList.community_name}}</h4>
                    <h4 ng-if="status==61" class="modal-title">{{community_name}}</h4> </div>
                <div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
                    <div class="col-sm-12" style="padding:0;">
                        <div class="panel panel-default" style="height:400px;">
                            <div class="panel-heading" style="border:none;"> 设计图纸
                                <div class="panel-tools"> </div>
                            </div>
                            <!--  Submit deliverables  -->
                            <div class="panel-body wrapper description" ng-if="status==51||status==33">
                                <input type="hidden" ng-model="designdrawing" id="designdrawing" />
                                <div class="planfloat planfloater" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==3">
                                    <div class="plan"> <span class="planSpanSelected" id="{{scheme.id}}"></span> <img ng-src="{{scheme.link}}" style="height:110px;width:146px;" alt=""> </div>
                                    <div class="center">设计图纸</div>
                                </div>
                            </div>
                            <!-- View delivery -->
                            <div class="panel-body wrapper description" ng-if="status==61">
                                <div class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==3">
                                    <div class="plan"> <img ng-src="{{scheme.url}}" style="height:110px;width:146px;" alt="" data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-click="enlargePicture(scheme.usage_type);"> </div>
                                    <div class="center">设计图纸</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer"> 
                	<a href="javascript:void(0);" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
                  	<a href="javascript:void(0);" ng-if="type==2" data-toggle="modal" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
                  	<a href="javascript:void(0);" ng-if="status==51||status==33" class="NewBtn btn-primarySubmit tooltips" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" data-placement="bottom" data-original-title="发送" ng-click="submit(3);" >确定</a> 
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade confirmMain" id="viewConfirm5" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="padding:25px;">
                    <button class="close" ng-if="type<2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;"> &times; </button>
                    <button class="close" ng-if="type==2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" style="font-size:34px;color:#000;"> &times; </button>
                    <h4 ng-if="status<51" class="modal-title">{{schemeList.community_name}}</h4>
                    <h4 ng-if="status==61" class="modal-title">{{community_name}}</h4> </div>
                <div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
                    <div class="col-sm-12" style="padding:0;">
                        <div class="panel panel-default" style="height:400px;">
                            <div class="panel-heading" style="border:none;"> 设计图纸
                                <div class="panel-tools"> </div>
                            </div>
                            <!-- View delivery -->
                            <div class="panel-body wrapper description">
                                <div class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==3">
                                    <div class="plan"> <img ng-src="{{scheme.url}}" style="height:110px;width:146px;" alt="" data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-click="enlargePicture(scheme.usage_type);"> </div>
                                    <div class="center">设计图纸</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer"> 
                	<a href="javascript:void(0);" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a> 
                	<a href="javascript:void(0);" ng-if="type==2" data-toggle="modal" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a> 
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade confirmMain" id="confirm4" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="padding:25px;">
                    <button class="close" aria-hidden="true" type="button" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;"> <img src="${baseUrl}/images/userCenter/m-close-icon.png" /> </button>
                    <button class="close" aria-hidden="true" ng-if="type==2" type="button" data-toggle="modal" data-dismiss="modal" style="font-size:34px;color:#000;"> <img src="${baseUrl}/images/userCenter/m-close-icon.png" /> </button>
                    <h4 ng-if="status<51" class="modal-title">{{schemeList.community_name}}</h4>
                    <h4 ng-if="status==61" class="modal-title">{{community_name}}</h4> </div>
                <div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
                    <div class="col-sm-12" style="padding:0;">
                        <div class="panel panel-default" style="height:400px;">
                            <div class="panel-heading" style="border:none;"> 材料清单
                                <div class="panel-tools"> </div>
                            </div>
                            <!-- Submit deliverables -->
                            <div class="panel-body wrapper description" ng-if="status==51">
                                <input type="hidden" name="forageList" id="forageList" />
                                <div class="planfloat planfloater" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==2">
                                    <div class="plan"> <span class="planSpanSelected" id="{{scheme.id}}"></span>
                                        <a href="javascript:void(0);" ng-if="scheme.link|deliveryFileType" class="imgStyle"><img ng-src="{{scheme.link|deliveryFileUrl}}" alt=""></a> <img ng-src="{{scheme.link|deliveryFileUrl}}" ng-if="scheme.link|deliveryFileBom" height="110" width="146" alt=""> </div>
                                    <div class="center">材料清单</div>
                                </div>
                            </div>
                            <!-- View delivery -->
                            <div class="panel-body wrapper description" ng-if="status==61">
                                <div class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==2">
                                    <div class="plan" ng-if="scheme.name|deliveryFileType">
                                        <a href="{{scheme.url}}" class="imgStyle"><img ng-src="{{scheme.url|deliveryFileUrl}}" alt=""></a>
                                    </div>
                                    <div class="plan" ng-if="scheme.name|deliveryFileBom"> <img ng-src="{{scheme.url|deliveryFileUrl}}" height="110" width="146" alt="" data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-click="enlargePicture(scheme.usage_type);"> </div>
                                    <div class="center">材料清单</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer"> 
                	<a href="javascript:void(0);" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a> 
                	<a href="javascript:void(0);" ng-if="status==2||status>=61" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a> 
                	<a href="javascript:void(0);" ng-if="status==51" class="NewBtn btn-primarySubmit tooltips" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" data-placement="bottom" data-original-title="发送" ng-click="submit(4);" >确定</a> 
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <link rel="stylesheet" href="${baseUrl}/css/public/pgwslideshow.min.css">
    <div class="modal fade confirmMain" id="confirm10" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="padding:25px;">
                    <button class="close" aria-hidden="true" type="button" data-dismiss="modal" style="font-size:34px;color:#000;"> &times; </button>
                    <div class="close clase1" aria-hidden="true" style="color:#000;font-size:60px;display:none;">&times;退出全屏</div>
                    <h4 ng-if="status<51" class="modal-title">{{schemeList.community_name}}</h4>
                    <h4 ng-if="status==61" class="modal-title">{{community_name}}</h4> </div>
                <div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
                    <div class="col-sm-12" style="padding:0;">
                        <div class="panel panel-default col-md-12" style="padding:20px;">
                            <ul class="pgwSlideshow pgwSlideshower">
                                <li ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==type"> <img ng-src="{{scheme.url}}" alt="" data-description="" ng-if="scheme.name|deliveryFileBom" /> </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="modal-footer"> 
                	<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a> 
                </div>
            </div>
        </div>
    </div>
    <div id="windowImg" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="z-index:999999999999;background:#09091A;">
        <div style="position:absolute;right:50px;top:50px;">
            <button class="close" aria-hidden="true" type="button" data-dismiss="modal" data-toggle="modal" data-target="#confirm10" style="font-size:34px;color:#fff;" onclick="setTimeout('$(window).resize()', 10)"> &times; </button>
        </div>
        <div class="windowImages" style="width:90%;margin:50px auto 0;overflow:hidden;">
            <ul class="pgwSlideshow pgwSlideshower">
                <li ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==type"> <img ng-src="{{scheme.url}}" alt="" data-description="" ng-if="scheme.name|deliveryFileBom" /> </li>
            </ul>
        </div>
    </div>
    <!--  -->
    <!-- Scripts -->
    <script type="text/javascript" src="${baseUrl}/js/markHall/jquery.mousewheel-3.0.6.pack.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/imagesloaded.pkgd.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/jquery.appear.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/userCenter/perfect-scrollbar.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/mediaelement-and-player.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/jquery.fancybox-media.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/owl.carousel.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/markHall/site.min.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/userCenter/main.js"></script>
    <script src="${baseUrl}/js/public/bootstrap-hover-dropdown.min.js"></script>
    <script src="${baseUrl}/js/public/scrollBar.js" type="text/javascript"></script>
    <script src="${baseUrl}/js/userCenter/perfect-scrollbar-v0.5.2.js" type="text/javascript"></script>
    <script src="${baseUrl}/js/public/pgwslideshow.min.js"></script>
    <script>
    $(function() {
        $('.panelAccordionHeading').click(function() {
            if($(this).parent('.panel-default').hasClass('default')) {
                $(this).parent('.panel-default').removeClass('default');
            } else {
                $(this).parent('.panel-default').addClass('default');
            }
        });
        $(document).on('click', '.planfloater', function() {
            $(this).find('.planSpanSelected').toggleClass('planSpanActive');
            if($(this).find('.planSpanSelected').hasClass('planSpanActive')) {
                var inputVal = $(this).siblings('input').val();
                var id = $(this).find('.planSpanSelected').attr("id");
                if(inputVal.indexOf(id) == -1) {
                    var newVal = inputVal += id +",";
                    $(this).siblings('input').val(newVal);
                }
            } else {
                var inputVal = $(this).siblings('input').val();
                var id = $(this).find('.planSpanSelected').attr("id");
                if(inputVal.indexOf(id) > -1) {
                    var newInput = inputVal.replace(id +",", '');
                    $(this).siblings('input').val(newInput);
                }
            }
        });
    })
    $('.description').perfectScrollbar();
    </script>
    <#if !users?exists>
        <script type="text/javascript">
        location.href = baseUrl +"/";
        </script>
    </#if>
    <#include '/common/footer.html'/> </body>

</html>
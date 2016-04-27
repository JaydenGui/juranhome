<#assign baseUrl=request.contextPath/>
<!DOCTYPE html>
<html  ng-app="app" id="ng-app" ng-cloak>
	<head ng-controller="seoCtrl">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css">
		<link rel="stylesheet" href="${baseUrl}/css/public/iCheck.css">
		<link rel="stylesheet" href="${baseUrl}/css/markHall/designerMain.css">
		<link rel="stylesheet" href="${baseUrl}/css/markHall/markHall.css"> 
		<link rel="stylesheet" href="${baseUrl}/css/markHall/theme_blue.css">
		<link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/font-style.css"> 
		<link rel="stylesheet" href="${baseUrl}/css/public/date-time/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/Information-mian.css">
		<!-- Styles -->
		 <style type="text/css">	
				#msg-datetimepicker .form-control{
				    position: absolute;
				    z-index: 999999999;
				    width: 339px;
				    height: 29px;
				    display: block;
				    background-color: transparent;
				}
		</style>  
		<link  rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/font-awesome.min.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/detail.css">
		<!-- <link rel="stylesheet" href="${baseUrl}/css/markHall/style-index.css"> -->
		<#include '/common/commonhead.html'/>
		
		<script type="text/javascript" src="${baseUrl}/angularjs/markHall/designerMain-app.js"></script>
		<script type="text/javascript" src="${baseUrl}/js/markHall/choose-amount-room.js"></script>
		<script src="${baseUrl}/js/public/Area.js"></script>
		<script src="${baseUrl}/js/public/AreaData_min.js"></script>
		<script type="text/javascript" src="${baseUrl}/js/markHall/markHall-profile-edit.js"></script>
		<script type="text/javascript">
			$(function(){
			     initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');			     
		    });
		</script>
		<script>
		
			$(document).ready(function(){
			//skinpeeler(".change-theme-main li img");	
			
				//Tabs
					var tabFinish = 0;
					$('.nav-tab-item').on('click',  function(){
					    var $t = $(this);
					    if(tabFinish || $t.hasClass('active')) return false;
					    tabFinish = 1;
					    $t.closest('.nav-tab').find('.nav-tab-item').removeClass('active');
					    $t.addClass('active');
					    var index = $t.parent().parent().find('.nav-tab-item').index(this);
					    $t.closest('.tab-wrapper').find('.tab-info:visible').fadeOut(500, function(){
					        $t.closest('.tab-wrapper').find('.tab-info').eq(index).fadeIn(500, function() {
					            tabFinish = 0;
					        });
					    });
					});
					$(".head-barers .clearfix li").eq(4).addClass("active");
					$(".head-barers .clearfix li").mouseover(function(){
						$(this).find("span").css({"width":"100%"});
					})
					$(".head-barers .clearfix li").mouseleave(function(){
						$(this).find("span").css({"width":"0"});
					})
			})    
		</script>
	</head>
	<body ng-controller="ctrl" style="background-color:#f0f0f0;">
	
		<#include '/common/header.html'/>
		
		<div id="content-block" ng-cloak>
			 <div class="markhall-container">
		        <div class="markhall-container-bg">
		        	 <div class="markhall-container-bg-skin-all">
		            	<div class="markHall-avatarInfo">
			               <#if users?exists & users.type!='member'> 
			               <div ng-if="designe_id==${users.id}||designe_id==''" class="markhall-container-bg-skin" data-toggle="modal" data-target="#needDetail">
			                    <p ><span></span>头图设置</p>
			                </div></#if>
			                <div class="markhall-container-bg-icon" ng-cloak>
			                    <div class="avatar">
				                    <img ng-src="{{designerInfo.avatar}}" alt="" ng-if="designerInfo.avatar" />
				                    <img ng-src="${baseUrl}/images/global/avatar_def.jpg" alt="" ng-if="designerInfo.avatar==''||designerInfo.avatar==undefined" />
				                    <img ng-show="designerInfo.designer.is_real_name==2" src="${baseUrl}/images/userCenter/awqewrt.png" style="display: block;margin: 5px auto 0;" />
			                	 </div>
			                	 <div class="info" ng-cloak>
			                	 	<p class="d-nickName" style="line-height:1.4">{{designerInfo.nick_name}}</p>
			                	 	<p class="d-workLife"  style="margin-bottom:8px" ng-if="designerInfo.designer.experience==null">从业年限:未填写</p>
									<p class="d-workLife"  style="margin-bottom:8px" ng-if="designerInfo.designer.experience!=null">从业年限&nbsp:&nbsp{{designerInfo.designer.experience}}年</p>
									<p class="d-roomFee" ng-if="designerInfo.designer.measurement_price==null"><span style="letter-spacing: 10px;">量房费</span>:&nbsp未填写</p>
									<p class="d-roomFee" ng-if="designerInfo.designer.measurement_price!=null"><span style="letter-spacing: 10px;">量房费</span>:&nbsp{{designerInfo.designer.measurement_price}}&nbsp元</p>
									<p ng-if="designerInfo.designer.design_price_min==null||designerInfo.designer.design_price_max==null">设计费：未填写</p>
									<p ng-if="designerInfo.designer.design_price_min!=null&&designerInfo.designer.design_price_max!=null">设计费&nbsp:&nbsp{{designerInfo.designer.design_price_min}} ~ {{designerInfo.designer.design_price_max}}元/m²</p>
									<p class="d-goodStyle" ng-if="designerInfo.designer.style_long_names==null"><span style="letter-spacing: 4px;">擅长风格</span>:&nbsp未填写</p>
									<p class="d-goodStyle" ng-if="designerInfo.designer.style_long_names!=null"><span style="letter-spacing: 4px;">擅长风格</span>:&nbsp{{designerInfo.designer.style_long_names}}</p>
			                	 	
			                	 	<!-- 
			                	 	<p class="d-nickName" style="line-height:1.4">{{designerInfo.nick_name}}</p>
			                	 	<p class="d-workLife" style="margin-bottom:8px">从业年限&nbsp:&nbsp{{designerInfo.designer.experience}}年</p>
			                	 	<p class="d-roomFee"><span style="letter-spacing: 10px;">量房费</span>:&nbsp{{designerInfo.designer.measurement_price}}&nbsp元</p><p>&nbsp&nbsp&nbsp&nbsp&nbsp设计费&nbsp:&nbsp{{designerInfo.designer.design_price_min}} ~ {{designerInfo.designer.design_price_max}}元/m²</p>
			                	 	<p class="d-goodStyle"><span style="letter-spacing: 4px;">擅长风格</span>:&nbsp{{designerInfo.designer.style_long_names}}</p> -->
			                	 </div>
			                	 
			                </div>
		                </div>
		            </div>
		        
		        
		            <input type="hidden" name="pic_index" id="pic_index" ng-model="pic_index">
		            <input id="theme_pic_val" type="hidden" value="{{designerInfo.designer.theme_pic}}"/>
		            <img style="width:100%;height:290px;" ng-if="designerInfo.designer.theme_pic==null" src="${baseUrl}/images/theme_pic/design_banner_1.jpg" id="markHall-skin" alt=""/>
		            <img style="width:100%;height:290px;" ng-if="designerInfo.designer.theme_pic" ng-src="${baseUrl}/images/theme_pic/design_banner_{{designerInfo.designer.theme_pic}}.jpg" id="markHall-skin" alt=""/>
		          </div>
			</div>
			</div>
			 <!--change-theme-->
			        <div class="change-theme modal fade in" style="height: 410px;overflow: hidden;" id="needDetail" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="false" ng-cloak>
			            <div class="change-theme-content">
			                <div class="row change-theme-title">
			                    <div class="col-md-11 "><p style="margin:0px !important">选择你喜欢的图片作为头图</p></div>
			                    <!--<div class="col-md-1 text-right" ><p data-dismiss="modal">收起↑</p></div>-->
			                </div>
			                <div class="change-theme-main">
			                    <div class="col-md-12" style="overflow: hidden; padding: 0px; height: 270px;">
			                        <ul class="change-theme-ul">
			                            <li>
			                                <img src="${baseUrl}/images/theme_pic/design_banner_1.jpg" alt="1"/>
			                                <div></div>
			                            </li>
			                            <li>
			                                <img src="${baseUrl}/images/theme_pic/design_banner_2.jpg" alt="2"/>
			                                <div></div>
			                            </li>
			                            <li>
			                                <img src="${baseUrl}/images/theme_pic/design_banner_3.jpg" alt="3"/>
			                                <div></div>
			                            </li>
			                            <li>
			                                <img src="${baseUrl}/images/theme_pic/design_banner_4.jpg" alt="4"/>
			                                <div></div>
			                            </li>			                         
			                        </ul>
			                    </div>
			                    <div class="col-md-2 change-theme-arrow">
			                        <!--<img style="width:30px;height:120px;" src="${baseUrl}/images/markHall/change-theme-arrow_03.png" alt=""/> -->
			                    </div>
			                </div>
			               
			                <div class="change-theme-save">	
			                	<button class="NewBtn btn-primarySubmit" data-dismiss="modal" style="margin-top:15px;font-family: 'microsoft yahei';float: right;" ng-click="skinPeeler();">保&nbsp存</button>
			                </div>
			                <button class="NewBtn btn-defaultClose" data-dismiss="modal" style="margin-top:15px;margin-right:15px;font-family: 'microsoft yahei';float: right;">取&nbsp消</button>
			            </div>
			        </div>
			        <!--change-theme-->
			<div style="max-width:1200px;margin:0 auto;padding-top:22px;">
				<!-- <div class="row">
					<div class="col-md-12">
						<div style="max-width:128px;margin-top:-64px;margin-bottom:20px;">
							<img alt="设计师头像" src="${baseUrl}/images/markHall/Portrait.png" style="margin:2px auto;width:100%;border:2px solid #fff;">
							<div class="center" style="line-height:22px;font-size:1.3em;color:#000">兆石设计</div>
						</div>
					</div>
				</div> -->
				<ul ng-if="designe_id!=''" class="Personalxu" style="width: 1200px;height:50px;margin: 0 auto;list-style: none;line-height: 50px;font-family: "Microsoft YaHei";" ng-cloak>
				   	<li style="display: inline-block;">
				   		<a style="color: #666;text-decoration: none;" href="${baseUrl}/designer/index/">找设计师></a>
				   	</li>
				   	<li style="display: inline-block;">{{designerInfo.nick_name}}</li>
				</ul>
				<div class="row" ng-cloak>
					<div class="col-md-4 col-xs-12" style="border-radius:5px;max-width:400px;padding-left:0;">
						<div class="contentHeader" style="position:relative;">
							<div class=col-md-8>个人资料</div>
							<#if users?exists & users.type=='designer'><div class="edit-personal-data-btn" ng-if="designe_id==${users.id}||designe_id==''"><a href="${baseUrl}/mark/designeredit" target="_blank" ng-if="designe_id==${users.id}||designe_id==''">修改资料</a></div></#if>
						</div>
						<div class="contentdata" style="margin-bottom:20px;">
						<#if users?exists & users.type=='designer'>
								<div style="text-align:center;margin-top: 16.5%;" ng-if="!designerInfo.designer.introduction&&!designerInfo.designer.personal_honour&&!designerInfo.designer.experience&&!designerInfo.designer.measurement_price&&!designerInfo.designer.design_price_min&&!designerInfo.designer.design_price_max&&!designerInfo.designer.style_long_names" ng-cloak>
	                            	<div>
		                            <img src="${baseUrl}/images/userCenter/rreyeryer_03.png" ng-cloak>
		                            </div>
								   	<div style="margin-top:15px; margin-bottom:15px;color:#000;" ng-cloak>您还尚未编辑资料，点击资料修改立即完善</div>
	                        	</div>
	                        	<div ng-if="!designerInfo.designer.introduction||!designerInfo.designer.personal_honour">
									<ul>
										<li>关于我</li>
										<li ng-if="!designerInfo.designer.introduction" class="datatext">未填写</li>
										<li ng-if="designerInfo.designer.introduction!=null" class="datatext">{{designerInfo.designer.introduction}}</li>
									</ul>
									<ul>
										<li>获得证书</li>
										<li ng-if="!designerInfo.designer.personal_honour">未填写</li>
										<li ng-if="designerInfo.designer.personal_honour!=null">{{designerInfo.designer.personal_honour}}</li>
									</ul>
								</div>
	                      <#else>
	                        	<div>
									<ul>
										<li>关于我</li>
										<li ng-if="!designerInfo.designer.introductionnull" class="datatext">未填写</li>
										<li ng-if="designerInfo.designer.introduction!=null" class="datatext">{{designerInfo.designer.introduction}}</li>
									</ul>
									<ul>
										<li>获得证书</li>
										<li ng-if="!designerInfo.designer.personal_honour">未填写</li>
										<li ng-if="designerInfo.designer.personal_honour!=null">{{designerInfo.designer.personal_honour}}</li>
									</ul>
								</div>
							</#if>
							<div class="centercase">
								<#if !users?exists>
									<button style="max-width:238px;height:40px;" class="btn btn-primary full color-1 size-1 hover-1 designerwork dropdown-toggle" onclick="userLogin();">
										<i></i>选TA量房
									</button>
                        	    <#elseif users?exists & users.type!='designer'>
                        	    	<button style="max-width:238px;height:40px;" class="btn btn-primary full color-1 size-1 hover-1 designerwork dropdown-toggle" data-toggle="modal" data-target="#panel-config-two" ng-click="Ta()">
										<i></i>选TA量房
									</button>
								</#if>
							</div>
						</div>
					</div>
					<div class="col-md-8 col-xs-12" style="border-radius:5px;padding-bottom:2%;max-width:800px;padding-right:0;">
						<div style="border:1px solid #eaeaea;background:#fff;">
							<div class="contentHeader" style="line-height:38px;">
								<div class="main-nav current mainNav"  ng-click="myCase(1);">
									案例库
								</div>
								<div class="main-nav" style="cursor:default">
									|
								</div>
								<div class="main-nav mainNav"  ng-click="myCase(2);">3D设计方案</div>
								<#if users?exists && users.type!='member'><div class="edit-manage-btn" ng-if="designe_id==${users.id}||designe_id==''"><a  target="_blank" href="${baseUrl}/mark/designerCaselist">编辑管理</a></div></#if>	
							</div>
							<script>
								$(".mainNav").click(function(){
									$(this).addClass('current').siblings().removeClass('current');
									var index =$(this).index();
									if(index==0){
										$('.marCaseData').show();
										$('.marMyDIY').hide();
									}else{
										$('.marCaseData').hide();
										$('.marMyDIY').show();
									}
								})
							</script>
							<div class="contentdata">
							<div class="clearfix">
								<div class="marCaseData col-md-12 clearfix" ng-cloak>
									<div class="coearfix" style="overflow:hidden;">
										<div class="mar-case col-md-4" ng-repeat="case in myCaseList" ng-init="index=$index" ng-if="myCaseList.length>0">
											<a href="${baseUrl}/caseBase/casedetail/caseid/{{case.id}}/" class="be-img-block" target="_blank">	      
										       <img  ng-if="img.is_primary" ng-src="{{img.file_url}}Large.jpg" alt="" style="width:100%;height:190px" ng-repeat="img in case.images" ng-init="indexs=$index"/>
											   <img src="${baseUrl}/images/global/default_image.jpg" alt="" style="width:100%;height:190px" ng-if="case.images.length==0"></a>					
											<div class="casename left" style="min-height:21px;">{{case.title}}</div>
											<div class="decorateData left" style="min-height:21px;">{{case.room_type|replaceRoomType}}{{case.bedroom|replaceBedRoom}}{{case.restroom|replaceRestRoom}}| {{case.room_area|replaceArea}}m²| {{case.project_style|replaceStyle}} </div>
											<input type="hidden" value="{{case.id}}" id="caseId" />
										    <input type="hidden" value="{{case.designer_info.member_id}}" id="memberId" />
											<hr class="hrStyle"/>
										</div>
									</div>
									<div class="mainpage"style="margin:0 auto;">
									   <pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" ></pagination>
								    </div>
								</div>
									<div style="text-align:center;margin-top: 60px;" ng-if="myCaseList.length==0" ng-cloak>
			                            <div><img src="${baseUrl}/images/userCenter/rreyeryer_03.png"></div>
										<#if users?exists & users.type =='designer'>
									   		<div style="margin-top:15px; margin-bottom:15px;color:#000;" ng-if="myCaseList.length==0" ng-cloak>您还尚未上传案例，点击编辑管理完善您的作品吧！</div>
										<#else>
									    	<div style="margin-top:15px; margin-bottom:15px;color:#000;" ng-cloak>此设计师还没有完善个人信息，您可以看看其他设计师</div>
										</#if>
			                        </div>
								<div class="marMyDIY clearfix col-md-12">
									<!-- <div class="mar-case col-md-4" ng-repeat="case in myCaseList" ng-init="index=$index" ng-if="myCaseList.length>0">
										<a href="${baseUrl}/caseBase/casedetail/caseid/{{case.id}}/" class="be-img-block" target="_blank">	      
									       <img  ng-if="img.is_primary" ng-src="{{img.file_url}}Large.jpg" alt="" style="width:100%;height:190px" ng-repeat="img in case.images" ng-init="indexs=$index"/>
										   <img src="${baseUrl}/images/global/default_image.jpg" alt="" style="width:100%;height:190px" ng-if="case.images.length==0"></a>					
										<div class="casename">{{case.title}}</div>
										<div class="decorateData">{{case.room_type|replaceRoomType}}{{case.bedroom|replaceBedRoom}}{{case.restroom|replaceRestRoom}}| {{case.room_area|replaceArea}} | {{case.project_style|replaceStyle}} </div>
										<input type="hidden" value="{{case.id}}" id="caseId" />
									    <input type="hidden" value="{{case.designer_info.member_id}}" id="memberId" />
										<hr class="hrStyle"/>
									</div> -->
								</div>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		<!--弹框-->
		<!-- ==========选他量房========= -->
<div  class="modal fade chooseRe requirements" id="panel-config-two" role="dialog" tabindex="-1" aria-hidden="true" style="display: none;top:4%;">
    <div class="modal-dialog" style="width:800px;margin-top: 8%;">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">
                    &times;
                </button>
                <h4 class="modal-title">量房资料</h4>
            </div>
            <div class="modal-body">
                <div class="panel-group accordion-custom accordion-teal" id="accordion">
                    <div class="panel panel-default switchCtrlheighter" style="margin-bottom:10px;">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle ctrlheighter ctrlheighterStyle" href="javascript:;">
                                                                                                          选择已发布的装修需求<i class="switchZS"><span>展开</span><span class="switchCO">收起</span></i>
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapseOne collapseZC" id="collapseOne" style="height:240px;max-height:240px;overflow:hidden;">
                            <div id="description" class="panel-body" style="width:770px;height:240px;max-height:240px;overflow:hidden;">
                            	<div class="radioCho" ng-repeat="needs in needsList" ng-init="index=$index" style="margin:8px 0;">
								    <label class="radio-inline switchRadio" style="height:20px;line-height:20px;width:100%;cursor:pointer;" >
								    	<input type="radio" name="needsid"  value="{{needs.needs_id}}" ng-click="needsDetail(needs.needs_id);">
								     	<span><i class="radioChoose"></i></span>
								     	{{needs.community_name}}
								    </label><br/>
								</div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default selected selectnew switchCtrlheighter">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="accordion-toggle collapsed ctrlheighter ctrlheighterStyle" href="javascript:;">
                                   	 选择发布新的量房需求给TA<i class="switchZS"><span>展开</span><span class="switchCO">收起</span></i>
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapseTwo" id="collapseTwo" >
                            <div class="panel-body">
				               	<ul>
				                    <li>
				                        <div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                            <div class="form-group">
				                                <label class="control-label"><span class="symbol required"></span> 姓名 :</label>
				                                <#if users?exists>
				                                <div class="defaultValue"></div><input class="form-control" readonly="readonly" name="pro-name" id="pro-name" type="text" value="${users.userName}" style="background:none;" />
				                               	</#if>
				                            </div>
				                        </div>
				                        <div class="col-lg-6  col-mg-6 col-sm-6 col-xs-6">
				                            <div class="form-group">
				                                <label class="control-label">  <span class="symbol required"> </span>手机号码 :</label>
				                                <input type="text" class="form-control" id="phone" name="phone" ng-model="contacts_mobile" maxlength=11 style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)"/>
				                                <span class="tips_false_style" > </span>
				                            </div>
				                        </div> 
				                    </li>
				                    <li>
				                        <div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                            <div class="form-group selectF">
				                                <label class="control-label">  <span class="symbol required"> </span>房屋类型 : </label>
				                                <select name="dd" id="dd" class="form-control" ng-model="house_type" ng-selected="detail.house_type"> 
				                                	 <option value="" selected="selected"> 请选择 </option>
													 <option value="house" >住宅空间</option>
							                         <option value="catering">餐饮空间</option>
							                         <option value="office">办公空间</option>
							                         <option value="hotel">酒店空间</option>
							                         <option value="business">商业展示</option>
							                         <option value="entertainment">娱乐空间</option>
							                         <option value="leisure">休闲场所</option>
							                         <option value="culture">文化空间</option>
							                         <option value="healthcare">医疗机构</option>
							                         <option value="sale">售楼中心</option>
							                         <option value="finace">金融场所</option>
							                         <option value="sport">运动场所</option>                             
							                         <option value="education">教育机构</option>
							                         <option value="other">其他</option>
												</select>
												<span class="tips_false_style" > </span>
				                            </div>
				                        </div>
				                        <div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                            <div class="form-group">
				                                <label class="control-label"> <span class="symbol required"> </span> 房屋面积 : </label>
				                                <div style="position:relative">
				                                	<input type="text" placeholder="" class="form-control" maxlength="7" id="h_mesure" name="h_mesure" ng-model="house_area" style="ime-mode:disabled" onkeyup="return ValidateFloat(this,value)" />
				                                	<span class="tips_false_style" style="margin-right:-13px;"> </span>
				                                	<div style="position:absolute;right:8px;top:8px;color:#999;"> m²</div>
				                                </div>
				                        	</div>
				                    	</div> 
				                    </li>
				                  	<li>
				                       <div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                           <div class="form-group selectF">
				                               <label class="control-label"> <span class="symbol required"> </span>设计预算 :  </label>
				                               <select class="form-control" id="design_budget" name="design_budget" ng-model="design_budget" ng-selected="detail.design_budget">
				                               	 <option value="" selected="selected"> 请选择 </option> 
				                               	 <option value="3000元以下"> 3000元以下 </option> 
				                               	 <option value="3000元-6000元"> 3000元-6000元 </option> 
				                               	 <option value="6001元-10000元"> 6001元-10000元 </option> 
				                               	 <option value="10001元-50000元"> 10001元-50000元 </option> 
				                               	 <option value="50000元以上"> 50000元以上 </option>
				                              	</select>
				                               <span class="tips_false_style" > </span>
				                           </div>
				                       </div>
				                       <div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                           <div class="form-group selectF" style="position:relative;">
				                               <label class="control-label"> <span class="symbol required"> </span> 装修预算（元） : </label>
				                               <select class="form-control" id="Decoratebudget" name="Decoratebudget" ng-model="decoration_budget" ng-selected="detail.decoration_budget"> 
					                               	<option value="" selected="selected"> 请选择 </option> 
					                               	<option value="5万以下"> 5万以下 </option> 
					                               	<option value="5万-10万"> 5万-10万 </option> 
					                               	<option value="10万-15万"> 10万-15万 </option> 
					                               	<option value="15万-20万"> 15万-20万 </option> 
					                               	<option value="20万以上"> 20万以上 </option>
				                               </select>
				                               <span class="tips_false_style" style="margin-right:-13px;"> </span>
				                               </div>
				                           </div>
				                       </li>
				                          	<li>
				                            	<div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                                	<div class="form-group  selectF">
				                                    	<label class="control-label"><span class="symbol required"> </span>  风格 : </label>
				                                    	<select class="form-control" id="renovationStylereq" name="renovationStylereq" ng-model="decoration_style" ng-selected="detail.decoration_style"> 
				                                    		 <option value="" selected="selected"> 选择风格 </option> 
							                      			 <option value="Japan">日式</option>
							                      			 <option value="korea">韩式</option>
							                      			 <option value="Mashup">混搭</option>
									                         <option value="european">欧式</option>
									                         <option value="chinese">中式</option>
									                         <option value="neoclassical">新古典</option>
									                         <option value="ASAN">东南亚</option>
									                         <option value="US">美式</option>
									                         <option value="country">田园</option>
									                         <option value="modern">现代</option>
									                         <option value="other">其他</option>
														</select>
														<span class="tips_false_style" > </span>
				                                	</div>
				                            	</div> 
				                            	<div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                            		<div class="form-group  selectF">
				                        				<label class="control-label"><span class="symbol required"> </span>户型 : </label>
				                        				<div class="row">
				                                			<div class="col-md-4 selectF">
				                                    			<select name="type_lv_room" id="room" class="form-control" ng-model="room" ng-selected="detail.room">
				                                      				<option value="" selected="selected"> 室 </option>
				                                      				<option value="one">一室</option>
											                        <option value="two" >二室</option>
											                        <option value="three">三室</option>
											                        <option value="four">四室</option>
											                        <option value="five">五室</option>
											                        <option value="loft">LOFT</option>
											                        <option value="multiple">复式</option>
											                        <option value="villa">别墅</option>
											                        <option value="other">其他</option>
				                                      			</select>
				                                      			<span class="tips_false_style tipsFalse"> </span>
				                                			</div>
				                                  			<div class="col-md-4 selectF">
				                                      			<select name="type_room" id="livingroomCountreq" class="form-control" ng-model="living_room" ng-selected="detail.living_room"> 
						                                     		 <option value="" selected="selected"> 厅 </option>
						                                     		 <option value="one" >一厅</option>
											                         <option value="two">二厅</option>
											                         <option value="three">三厅</option>
											                         <option value="four">四厅</option>
											                         <option value="five">五厅</option>
				                                      			</select>
				                                      			<span class="tips_false_style tipsFalse" > </span>
				                                  			</div>
				                                  			<div class="col-md-4 selectF">
				                                      			<select name="type_rst_room" id="bathroomCountreq" class="form-control" ng-model="toilet" ng-selected="detail.toilet">  
							                                       	<option value="" selected="selected"> 卫 </option>
							                                       	<option value="one" >一卫</option>
											                        <option value="two">二卫</option>
											                        <option value="three">三卫</option>
											                        <option value="four">四卫</option>
											                        <option value="five">五卫</option>
				                       							</select>
				                       							<span class="tips_false_style tipsFalse" > </span>
				                                  			</div>
				                            			</div>
				                            		</div>
				                           	 	</div>
				                       		</li>
				                    		<li>
				                        	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				                            	<label class="control-label"> <span class="symbol required"> </span> 项目地址 : </label>
				                            		<div class="row">
						                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 margin-bottom10 selectF" >
						                                    <select id="seachprov" class="form-control" name="s_province" placeholder="省" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"> </select> &nbsp;&nbsp;
						                               		<span class="tips_false_style tipsFalse_style"> </span>
						                                </div>
						                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 margin-bottom10 selectF " >
						                                    <select id="seachcity" name="s_city" class="form-control" placeholder="市" onChange="changeCity(this.value,'seachdistrict','seachdistrict');" > </select>
						                                	<span class="tips_false_style tipsFalse_style" > </span>
						                                </div>
						                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 margin-bottom10 selectF" >
						                                    <select id="seachdistrict" name="s_county" class="form-control" placeholder="县/区" > </select>
						                                	<span class="tips_false_style tipsFalse_style" > </span>
						                                </div>
						                                <div class="form-group col-lg-3 col-md-3 col-sm-6 col-xs-6">
				                             				<!--  <label class="control-label"> 小区名称 : <span class="symbol required"> </span> </label> -->
				                              				<input type="text" id="house-name" name="house-name" class="form-control" ng-model="community_name" maxlength="32"  placeholder="小区名称 " />
				                              				<span class="tips_false_style tipsFalse_style" > </span>
								                        </div>
								                    </div>
				                        		</div> 
				                    		</li>
				    					</ul>         
				                    </div>
				                </div>   
				                </div>   
						        <div class="col-md-12 datatime" style="padding-left:30px;">
						            <div class="col-md-6">
						                <div class="form-group">
						                    <label class="control-label">
						                         	 <span class="symbol required"></span>预约量房时间 :
						                    </label>
						                    <div>
						                        <div id="msg-datetimepicker" class="input-group date form_datetime" style="width:98%" data-date="" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
													<input readonly="" class="form-control" size="20" type="text" value=""  id="time" name="time" ng-model="time" placeholder="请点击右侧小图示选取预约量房时间">
													<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
												</div>
												<span class="tips_false_style" style="right:8%;"> </span>
						                    </div>
						                </div>
						            </div>
						            <div class="col-md-12">
						                <div class="form-group">
						                    <label class="checkbox-inline">
						                       	 设计师量房费用为 <span style="color: rgb(81, 20, 5); font-weight: bold;">{{designerInfo.designer.measurement_price}}</span> 元
						                    </label>
						                 </div>
						        	</div>     
				            </div>
				         </div>
				     </div>
			         <div class="modal-footer">
			              <div id="poploading" class="poploading"  style="position: absolute;bottom: 10px;left: 15px;"><img src="${baseUrl}/images/global/LoadingCursor2.gif" /></div>
			              <button data-dismiss="modal" class="buttonsure NewBtn btn-defaultClose" onclick="CloseDetail()"> 
			                                                           关闭
			              </button>
			              <button id="commit" class="NewBtn btn-primarySubmit"  type="button" ng-click="selectTa();" >
			                                                           发送
			              </button>
					</div>
		        </div>
		    </div>
		</div>
		<!-- =========选他量房========== -->
		<!--弹框结束-->
		
		<script src="${baseUrl}/js/public/jquery.icheck.js"></script>
		<script src="${baseUrl}/js/public/bootstrap-hover-dropdown.min.js"></script>
		<script src="${baseUrl}/js/userCenter/perfect-scrollbar.js"></script>
		<script src="${baseUrl}/js/public/bootstrap-fileupload.min.js"></script>
		<!--<![endif]-->
		<!--<script src="${baseUrl}/js/userCenter/upload.js" type="text/javascript"></script>-->
		<script src="${baseUrl}/js/userCenter/fileinput.min.js" type="text/javascript"></script>
		<script src="${baseUrl}/js/userCenter/fileinput_locale_zh.js" type="text/javascript"></script>
		
		<!--Initialize the provinces and cities-->
		<script type="text/javascript" src="${baseUrl}/js/markHall/isotope.pkgd.min.js"></script>
		<script type="text/javascript" src="${baseUrl}/js/markHall/jquery.appear.min.js"></script>
		<script type="text/javascript" src="${baseUrl}/js/markHall/owl.carousel.min.js"></script>
		<script type="text/javascript" src="${baseUrl}/js/markHall/site.min.js"></script>
		<!--data verification end-->
		<!-- end: MAIN JAVASCRIPTS -->
			
			<script>
			    $(function(){
			    	/* $(".buttonsure").click(function(){
			        	if($("#collapseTwo").hasClass("in")){ 
				          $("#collapseOne").addClass("in");
				          $(".selected").find("a").removeClass("collapsed");
				          $(".selected").css("height","138px");
				          $("#collapseTwo").removeClass("in");
				          $(".selectnew").find("a").addClass("collapsed");
			            }
			        });
			        $(".ctrlheight").click(function(){
			        	$(".selected").css("height","34px");
			        });
			        $(".ctrlheighter").click(function(){
			        	$(".selected").css("height","138px");
			        });*/
			    })
			</script>
			
		<script type="text/javascript">
		function OpenDetail()
		{
	     	$("#collapseTwo").addClass("in");
	     	$("#collapseOne").removeClass("in");
	     	$(".selected").find("a").addClass("collapsed");
	     	$(".selectnew").find("a").removeClass("collapsed");
	     
	     	return false;
		}
		function CloseDetail()
		{
		 	$(".selected").find("a").removeClass("collapsed");
	     	$(".selectnew").find("a").addClass("collapsed");
	     	return false;
		}
		$("#menu li" ).eq(2).addClass("activeaa");
	    $(".mainpage ul li:last").css({"margin-left":"15px"});
	 
	    //----------------------------------------------------
	    function designerDetailPage(){
	    	var caseId = document.getElementById("caseId").value;
	    	var memberId = document.getElementById("memberId").value;
	    	window.open("${baseUrl}/caseBase/casedetail/caseid/"+caseId+"/designeid/"+memberId+"?veiwType=1");
	    }
	    $(document).on('click','.ctrlheighter',function(){
	    	$('.radioCho').removeClass('radioCh');
    		$('.switchRadio input').removeAttr('checked');
    	    if($(this).parents('.switchCtrlheighter').hasClass("switchZC")){
    	    	$(this).parents('.switchCtrlheighter').removeClass('switchZC').siblings('.switchCtrlheighter').addClass('switchZC');
    	    }else{
    	    	$(this).parents('.switchCtrlheighter').addClass('switchZC').siblings('.switchCtrlheighter').removeClass('switchZC');
    	    }
    	})
    	$(document).on('click','.radioCho',function(){
    		$(this).addClass('radioCh').siblings().removeClass('radioCh');
    	})
	</script>
	<#if !users?exists>
     <script type="text/javascript">
 		//location.href =baseUrl+"/login/index";
 	 </script>
    </#if>
      <#include '/common/footer.html'/>
       <link href="${baseUrl}/css/public/paging.css" rel="stylesheet" type="text/css">
		<script src="${baseUrl}/js/public/date-time/bootstrap-datetimepickeruser.min.js"></script>
		<script src="${baseUrl}/js/public/date-time/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="${baseUrl}/js/public/perfect-scrollbar-v0.5.2.js"></script>
		<script type="text/javascript">
			var datejsop=new Date();
	  	    $("#msg-datetimepicker").attr('data-date',datejsop);
			$(document).on('click', '#msg-datetimepicker', function(){
				$(this).datetimepicker({
				   		language:  'zh-CN',
				   		autoclose: true,
		   			startDate: datejsop,
	      			minuteStep: 10,
	      			pickerPosition: "bottom-right"
				    });
				$(this).datetimepicker('show');
				
			    var height= $('#msg-datetimepicker').offset().top;
			    var hh="-260px";
				$('.datetimepicker').css({
					 top:height,
					 marginTop:hh,
					});
			});

      		$(document).on('click','#scrollTopG .scrollTopG',function(){
		       $('html,body').animate({scrollTop:0},'slow');
		   });
		</script>
	</body>
</html>
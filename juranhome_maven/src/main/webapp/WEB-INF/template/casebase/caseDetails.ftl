<#assign baseUrl=request.contextPath />
<!DOCTYPE html> 
<html  ng-app="app" id="ng-app" ng-cloak>
    <head ng-controller="seoCtrl">
	   
        <#include '/common/commonhead.html'/>
        
        
        <link href="${baseUrl}/css/case/case.css" rel="stylesheet" type="text/css"> 
        <link href="${baseUrl}/css/userCenter/main.css">
        <link href="${baseUrl}/css/index/main.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/detail.css">
		<link rel="stylesheet" href="${baseUrl}/css/public/date-time/bootstrap-datetimepicker.min.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/Information-mian.css">
		<link rel="stylesheet" media="screen" type="text/css" href="${baseUrl}/css/public/datouwang.css">
		
        <script src="${baseUrl}/angularjs/casebase/caseDetail-app.js" charset="utf-8"></script>
        <script src="${baseUrl}/js/userCenter/area.js" type="text/javascript"></script>
        
        <link rel="stylesheet" href="${baseUrl}/css/public/pgwslideshow.min.css">
		<script src="${baseUrl}/js/public/pgwslideshow.min.js"></script>
		
		<script type="text/javascript" src="${baseUrl}/js/public/datouwang.js"></script>
		<script type="text/javascript" src="${baseUrl}/js/markHall/choose-amount-room.js"></script>
		
		
        <script src="${baseUrl}/js/public/Area.js"></script>
		<script src="${baseUrl}/js/public/AreaData_min.js"></script>
		<script type="text/javascript">
			$(function(){
			     initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');
		    });
		</script>
		<style>
		    .datetimepicker{min-height: 252px;}
			#msg-datetimepicker input{
			    position: absolute;
			    z-index: 9999;
			    width: 100%;
			    background-color: transparent;
			    height: 30px;
			}
		</style>
    </head>
    <body ng-controller="ctrl" style="background: #f3f3f3">
        <#--include common header-->
        <#include '/common/header.html'/>
        <!-- loading start -->
        <div class="loading" id="loading">
    		<img src="${baseUrl}/images/global/LoadingCursor2.gif" style="display:inline-block"/>
    	</div> 
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
                                                                                                          选择已有的量房资料给TA<i class="switchZS"><span>展开</span><span class="switchCO">收起</span></i>
                                </a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapseOne collapseZC" id="collapseOne" style="height:240px;max-height:240px;overflow:hidden;">
                            <div id="description" class="panel-body" style="width:770px;height:240px;max-height:240px;overflow:hidden;">
                            	<div class="radioCho" ng-repeat="needs in needsList" ng-init="index=$index" style="margin:8px 0;">
								    <label class="radio-inline switchRadio" style="height:38px;line-height:38px;width:100%;cursor:pointer;" >
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
                                <a class="accordion-toggle collapsed ctrlheighter ctrlheighterStyle" href="javascript:;" style="font-size:14px;line-height:36px;display:block;padding:0 15px;">
                                   	 选择新的量房资料给TA<i class="switchZS"><span>展开</span><span class="switchCO">收起</span></i>
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
				                                <input type="text" class="form-control" id="phone" name="phone" ng-model="contacts_mobile" maxlength="11" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)"  />
				                                <span class="tips_false_style"> </span>
				                            </div>
				                        </div> 
				                    </li>
				                    <li>
				                        <div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                            <div class="form-group selectF">
				                                <label class="control-label">  <span class="symbol required"> </span>房屋类型 : </label>
				                                <select name="dd" id="dd" class="form-control" ng-model="house_type" ng-selected="house_type"> 
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
				                                <div style="position:relative"><input type="text" placeholder="" class="form-control" maxlength="7" id="h_mesure" name="h_mesure" ng-model="house_area" style="ime-mode:disabled" onkeyup="return ValidateFloat(this,value)" />
				                                <span class="tips_false_style"  style="margin-right:-13px;"> </span>
				                                <span style="position:absolute;right:8px;top:8px;color:#999"> m²</span></div>
				                            	<span class="tips_false_style" > </span>
				                        	</div>
				                    	</div> 
				                    </li>
				                  	<li>
				                       <div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                           <div class="form-group selectF">
				                               <label class="control-label"> <span class="symbol required"> </span>设计预算 :  </label>
				                               <!-- <div style="position:relative"><input type="text" placeholder="" class="form-control" id="money" name="project-price" ng-model="decoration_budget" style="ime-mode:disabled" onkeyup="return ValidateFloat(this,value)" required="" /><span style="position:absolute;right:-30px;top:8px;color:#666">万元</span></div> -->
				                               <select class="form-control" id="design_budget" name="design_budget" ng-model="design_budget" ng-selected="detail.design_budget" required="">
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
				                               <select class="form-control" id="Decoratebudget" name="Decoratebudget" ng-model="decoration_budget" ng-selected="detail.decoration_budget" required=""> 
					                               	<option value="" selected="selected"> 请选择 </option> 
					                               	<option value="5万以下"> 5万以下 </option> 
					                               	<option value="5万-10万"> 5万-10万 </option> 
					                               	<option value="10万-15万"> 10万-15万 </option> 
					                               	<option value="15万-20万"> 15万-20万 </option> 
					                               	<option value="20万以上"> 20万以上 </option>
				                               </select>
				                               <span class="tips_false_style"  style="margin-right:-13px;"> </span>
				                               <!-- <div style="position:absolute;bottom:-24px;right:0;color:#0084ff;font-size:14px;">包含装修费用和家具费用</div> -->
				                               </div>
				                           </div>
				                       </li>
				                          	<li>
				                            	<div class="col-lg-6 col-mg-6 col-sm-6 col-xs-6">
				                                	<div class="form-group  selectF">
				                                    	<label class="control-label"><span class="symbol required"> </span>  风格 : </label>
				                                    	<select class="form-control" id="renovationStylereq" name="renovationStylereq" ng-model="decoration_style" ng-selected="decoration_style" required=""> 
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
				                                    			<select name="type_lv_room" id="room" class="form-control" ng-model="room" ng-selected="detail.room" required="">
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
				                                      			<span class="tips_false_style tipsFalse" > </span>
				                                			</div>
				                                  			<div class="col-md-4 selectF">
				                                      			<select name="type_room" id="livingroomCountreq" class="form-control" ng-model="living_room" ng-selected="detail.living_room" required=""> 
						                                     		 <option value="" selected="selected"> 厅 </option>
						                                     		 <option value="one" >一厅</option>
											                         <option value="two">二厅</option>
											                         <option value="three">三厅</option>
											                         <option value="four">四厅</option>
											                         <option value="five">五厅</option>
				                                      			</select>
				                                      			<span class="tips_false_style tipsFalse"  > </span>
				                                  			</div>
				                                  			<div class="col-md-4 selectF">
				                                      			<select name="type_rst_room" id="bathroomCountreq" class="form-control" ng-model="toilet" ng-selected="detail.toilet" required="">  
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
						                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 margin-bottom10 selectF ">
						                                    <select id="seachcity" name="s_city" class="form-control" placeholder="市" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"> </select>
						                               		<span class="tips_false_style tipsFalse_style" > </span>
						                                </div>
						                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 margin-bottom10 selectF" >
						                                    <select id="seachdistrict" name="s_county" class="form-control" placeholder="县/区" > </select>
						                                	<span class="tips_false_style tipsFalse_style"> </span>
						                                </div>
						                                <div class="form-group col-lg-3 col-md-3 col-sm-6 col-xs-6">
				                             				<!--  <label class="control-label"> 小区名称 : <span class="symbol required"> </span> </label> -->
				                              				<input type="text" id="house-name" name="house-name" class="form-control" ng-model="community_name" maxlength="32"  placeholder="小区名称 " required=""/>
								                       		 <span class="tips_false_style tipsFalse_style"> </span>
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
						                        <div  id="msg-datetimepicker" class="input-group date form_datetime" style="width:98%" data-date="" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
													<input readonly="" class="form-control" id="time" name="time" size="20" type="text" value="" ng-model="time" placeholder="请点击右侧小图示选取预约量房时间">
													<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
													<!--<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>-->
												</div>
												<span class="tips_false_style" style="right:8%;"> </span>
						                    </div>
						                </div>
						            </div>
						            <div class="col-md-12">
						                <div class="form-group">
						                    <label class="checkbox-inline">
						                       	 设计师量房费用为 <span style="color: rgb(81, 20, 5); font-weight: bold;">{{caseDetail.designer_info.designer.measurement_price}}</span> 元
						                    </label>
						                 </div>
						        	</div>     
				            </div>
				         </div>
				     </div>
			         <div class="modal-footer">
			              <div id="poploading" class="poploading"  style="position: absolute;bottom: 10px;left: 15px;"><img src="${baseUrl}/images/global/LoadingCursor2.gif" /></div>
			              <button data-dismiss="modal" class="buttonsure NewBtn btn-defaultClose" >            
			                       关闭
			              </button>
			              <button  class="NewBtn btn-primarySubmit"  type="button"   ng-click="selectTa();" >
			                                                           发送
			              </button>
					</div>
		        </div>
		    </div>
		</div>
		
		<div style="max-width:1200px;margin:60px auto 0;background:#f3f3f3;">
			<div class="caseNav"><a style="color:#000;text-decoration:none" href="${baseUrl}/caseBase/index">海量例库 </a>&gt; {{caseDetail.title}}</div>
			<div class="row">
				<div class="col-md-4 col-xs-12" style="border-radius:5px;min-height: 689px;width:350px">
					<div class="center Designersface">
						<div class="Designersfaceman">
							<a href="${baseUrl}/mark/main/id/{{caseDetail.designer_id}}/uid/{{caseDetail.hs_designer_uid}}/"><img ng-if="!caseDetail.designer_info.avatar" alt="设计师头像" src="${baseUrl}/images/global/avatar_def.jpg" height="128px" width="128px"></a>
							<a href="${baseUrl}/mark/main/id/{{caseDetail.designer_id}}/uid/{{caseDetail.hs_designer_uid}}/"><img ng-if="caseDetail.designer_info.avatar" alt="设计师头像" ng-src="{{caseDetail.designer_info.avatar}}" height="128px" width="128px"></a>
							
							<div class="center" style="line-height:22px;font-size:1.3em;color:#000">{{caseDetail.designer_info.nick_name}}</div>
							<a href="" ng-if="caseDetail.designer_info.designer.is_real_name==2"><img src="${baseUrl}/images/userCenter/awqewrt.png" style="cursor:default;"></a>
						</div>
					</div>
					<div class="contentdata">
						<ul>
							<li ng-if="caseDetail.designer_info.designer.experience==null">从业年限:未填写</li>
							<li ng-if="caseDetail.designer_info.designer.experience!=null">从业年限:{{caseDetail.designer_info.designer.experience}}年</li>
							<li ng-if="caseDetail.designer_info.designer.measurement_price==null">量房费：未填写</li>
							<li ng-if="caseDetail.designer_info.designer.measurement_price!=null">量房费： {{caseDetail.designer_info.designer.measurement_price}}元</li>
							<li ng-if="caseDetail.designer_info.designer.design_price_min==null||caseDetail.designer_info.designer.design_price_max==null">设计费：未填写</li>
							<li ng-if="caseDetail.designer_info.designer.design_price_min!=null||caseDetail.designer_info.designer.design_price_max!=null">设计费：{{caseDetail.designer_info.designer.design_price_min}}-{{caseDetail.designer_info.designer.design_price_max}}元/㎡</li>
							<li ng-if="caseDetail.designer_info.designer.style_long_names==null">擅长风格：未填写</li>
							<li ng-if="caseDetail.designer_info.designer.style_long_names!=null">擅长风格：{{caseDetail.designer_info.designer.style_long_names}}</li>
						</ul>
						<div class="center">
							 <#if !users?exists>
                       	        <button class="btn btn-primary full color-1 size-1 hover-1 designerwork dropdown-toggle" style="padding:8px 90px" onclick="userLogin();">
								<i></i>选TA量房
							</button>
                       	    <#elseif users?exists && users.type=='member'>
                       	        <button style="padding:8px 90px" class="btn btn-primary full color-1 size-1 hover-1 designerwork dropdown-toggle" data-toggle="modal" data-target="#panel-config-two" ng-click="Ta();" >
								<i></i>选TA量房
							</button></#if>
						</div>
					</div>
				</div>
				<div class="col-md-8 col-xs-12" style="background:#fff;padding-top:30px; margin-bottom:30px; min-height: 663px;">
					<div class="contentHeader">
						<h4 style="margin:0;">
							{{caseDetail.title}}<!-- 案例库 >{{caseDetail.}} —— ——{{caseDetail.title}} -->
						</h4>

						<div class="pasaden">{{caseDetail.room_type|replaceRoomType}}{{caseDetail.bedroom|replaceBedRoom}}{{caseDetail.restroom|replaceRestRoom}}| {{caseDetail.room_area|replaceArea}} m²| {{caseDetail.custom_string_style|replaceStyle}}</div>
						<p class="synopsis">{{caseDetail.description}}</p>
					</div>
					<div class="contentdata">
							<div class="detailsImg" ng-repeat="imgs in caseDetail.images" ng-init="index=$index" ng-if="caseDetail.images.length>0" ng-click="images();">
								<a href="javascript:void(0);" ng-click="enlargeImage();" data-toggle="modal" data-target="#tFocuspp"><img alt="详情一" ng-src="{{imgs.file_url}}Large.jpg" style="width:600px;cursor: pointer;"/></a>
							</div>
					</div>
				</div>
				</div>
			</div> 
	<!------------------------l---------------- -->
	<div class="modal" id="tFocuspp" tabindex="-1" role="dialog" aria-hidden="true" style="z-index:99999999999;">
		<div id="tFocus" class="mb10">
			<div id="asdhsoal" data-dismiss="modal"><img src="${baseUrl}/images/designer/m-close-iconf.png"/></div>
			<div class="prev" id="prev"></div>
			<div class="next" id="next"></div>
			<a href="javascript:void(0);" id="tFocus-leftbtnb"><img class="leftbtnimg" src="${baseUrl}/images/index/left_arrow.png"/></a>
				<ul id="tFocus-pic" class="zoom" id="box">
					<li class="antzone" ng-repeat="imgs in caseDetail.images" ng-init="index=$index" ng-if="caseDetail.images.length>0">
						<a href="javascript:void(0);" >
							<div class="imgtopxp">
								<img ng-src="{{imgs.file_url}}Large.jpg" />
							</div>
						</a>
					</li>
				</ul>
			<a href="javascript:void(0);" id="tFocus-rightbtnb"><img class="leftbtnimg" src="${baseUrl}/images/index/right_arrow.png"/></a> 
			<div id="" style="color:#fff; margin-left:80%;cursor: pointer;" data-dismiss="modal">点击查看详情</div>
			<div id="asdhsop"><span><img src="${baseUrl}/images/designer/pgarrow01.png"/></span></div>
			<div id="tFocuop"></div>
			<div id="tFocusBtn" class="zoom">
			  <a href="javascript:void(0);" id="tFocus-leftbtn"><img src="${baseUrl}/images/designer/icon-before.png"/></a>
				<div id="tFocus-btn">
					<ul>
						<li ng-repeat="imgs in caseDetail.images" ng-init="index=$index" ng-if="caseDetail.images.length>0">
							<img ng-src="{{imgs.file_url}}Large.jpg" />
						</li>
					</ul>
				</div>
			  <a href="javascript:void(0);" id="tFocus-rightbtn"><img src="${baseUrl}/images/designer/icon-next.png"/></a> 
		</div>
		</div>
		</div>
        <#include '/common/footer.html'/> 
		<script>
		    $(function() {
		    	$("#menu a").eq(1).addClass("activeaa");
		    	$(".selectF select").focus(function(){
		    	 	$(this).addClass('selected');
		    	});
		    	$(".selectF select").on('blur change', function(){
		    	 	$(this).removeClass('selected');
		    	});
		    	/* $(document).on('click','.ctrlheighter',function(){
            		$(this).parents('.switchCtrlheighter').addClass('switchZC').siblings('.switchCtrlheighter').removeClass('switchZC');
            	}) */
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
            	
		    });
		</script>
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
			   	$(document).on('click','#scrollTopG .scrollTopG',function(){
			 	    $('html,body').animate({scrollTop:0},'slow');
			 	});
	    	});   
		</script>
    </body>
</html>
<#assign baseUrl=request.contextPath />
<!DOCTYPE html> 
<html  ng-app="app" id="ng-app" ng-cloak>
    <head ng-controller="seoCtrl">
        <style type="text/css">

		.loadingMaskSP {
			width: 100%;
			height: 86%;
			margin-left: -15px;
			background:rgba(0,0,0,0.1);
			position: absolute;
			z-index: 1000;
			vertical-align: bottom;
			/*display: none;*/
		}
		
		.loadingFontSP {
			font-size: 40px;
			color: #fff;
			margin-top: 25%;
			text-align: center;
			}
			
		.loadingMaskSP img {
			margin-left: 15px;
			position:absolute;
			left:15px;
			bottom:15px;
			}
		}
        </style>
         
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/font-awesome.min.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/style.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/main-responsive.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/all.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/bootstrap-colorpalette.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/perfect-scrollbar.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/theme_light.css" type="text/css" >
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/tietolomake.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/detail.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/fileinput.css">
		<!--<link rel="stylesheet" href="${baseUrl}/css/userCenter/print.css" type="text/css" media="print"/>-->
		
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/centerindex.css" type="text/css">
		<!--[if IE 7]>
		<!--<link rel="stylesheet" href="${baseUrl}/plugins/font-awesome/css/font-awesome-ie7.min.css">-->
		<![endif]-->
		<!-- end: MAIN CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/bootstrap-fileupload.min.css">
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/social-buttons-3.css">
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
    	<!--<link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css">-->
		<!--<link rel="stylesheet" href="${baseUrl}/css/userCenter/main-responsive.css">-->
		<!--<link rel="stylesheet" href="${baseUrl}/css/userCenter/theme_blue.css" type="text/css" id="skin_color">-->
    	<link rel="stylesheet" href="${baseUrl}/css/userCenter/jquery.fileupload-ui.css">
		<!-- CSS adjustments for browsers with JavaScript disabled -->
		<!--<noscript>-->
			<!--<link rel="stylesheet" href="${baseUrl}/plugins/jQuery-File-Upload/css/jquery.fileupload-ui-noscript.css">-->
		<!--</noscript>-->
		
		<!---designer-->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/attentionDesigner.css">
		<link  rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/id-card.css">
		
		<!--map-->
		<link rel="stylesheet" href="${baseUrl}/css/markHall/designerMain.css">
		
		<!--order detail-->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/Designer-list.css">
		
		<!--message css-->
		<link rel="stylesheet" href="${baseUrl}/css/userCenter/message.css">
        <#include '/common/commonhead.html'/>
        
        <script src="${baseUrl}/angularjs/user/addNeeds-app.js" charset="utf-8"></script>
    </head>
    <body ng-controller="ctrl" style="background:#000">
    <#if !users?exists>
         <script type="text/javascript">
         alert("请重新登入");
			  location.href =baseUrl+"/";
	     </script>
        </#if>
        <!--include common header-->
        <#include '/common/header.html'/>
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-ofset-1 col-sm-12 col-xs-12" style="margin-bottom:65px;">
            	<div id="fade" class="black_overlay"></div>
                <div id="MyDiv" class="white_content">
                    <div id="loadingMask" class="loadingMaskSP" style="display:none"><img src="${baseUrl}/images/markHall/022.gif" style="display:inline-block"/></div>
                    <div class="requirements" style="margin-top:107px;">
                        <form name="form" role="form" ng-submit="submit($event)">
                            <div class="modal-content row">
                        	<div class="modal-header">
                        		<div aria-hidden="true" type="button" onclick="goBack()" style="float:right;cursor: pointer;">
									<img src="${baseUrl}/images/userCenter/m-close-icon.png">
								</div>
                            	<h4 class="modal-title">发布设计需求</h4>
                       		 </div>
                                <ul style="margin-top:30px; margin-left:6%;">
                                    <li class="clearfix">
                                        <div class="leftru col-lg-5 col-mg-5 col-sm-6 col-xs-6">
                                            <div class="form-group">
                                                <label class="control-label"> 姓名 : <span class="symbol required"></span> </label>
                                                <div class="defaultValue"></div><input class="form-control" name="pro-name2" id="pro-name" type="text" value="" ng-model="contactsname" readonly=true required="" style="background:none" />
                                                <span class="tips_false"></span>
                                            </div>
                                        </div>
                                        <div class="righttu col-lg-5 col-lg-offset-1 col-mg-5 col-mg-offset-1 col-sm-6 col-xs-6">
                                            <div class="form-group">
                                                <label class="control-label"> 手机号码: <span class="symbol required"> </span> </label>
                                                <input type="text" class="form-control" id="phone" name="phone" ng-model="contactsmobile" maxlength=11 style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" required="" />
                                                <span class="tips_false"> </span>
                                            </div>
                                        </div> </li>
                                    <li class="clearfix">
                                        <div class="leftru col-lg-5 col-mg-5 col-sm-6 col-xs-6">
                                            <div class="form-group selectF">
                                                <label class="control-label"> 房屋类型 : <span class="symbol required"> </span> </label>
                                                <select name="dd" id="dd" class="form-control" ng-model="housetype"> 
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
												<span class="tips_false" > </span>
                                            </div>
                                        </div>
                                        <div class="righttu col-lg-5 col-lg-offset-1 col-mg-5 col-mg-offset-1 col-sm-6 col-xs-6">
                                            <div class="form-group">
                                                <label class="control-label"> 房屋面积 : <span class="symbol required"> </span> </label>
                                                <div style="position:relative"><input type="text" placeholder="" class="form-control" maxlength="9" id="h_mesure" name="project-price" ng-model="housearea" style="ime-mode:disabled" onkeyup="return ValidateFloat(this,value)" /><span class="tips_false TipsFalse" style="margin-right:-24px;"> </span><span style="position:absolute;right:8px;top:8px;color:#999"> m²</span></div>
                                                
                                            </div>
                                        </div> </li>
                                    <li class="clearfix">
                                        <div class="leftru col-lg-5 col-mg-5 col-sm-6 col-xs-6">
                                            <div class="form-group selectF">
                                                <label class="control-label"> 设计预算: <span class="symbol required"> </span> </label>                                         
                                                <select class="form-control" id="design_budget" name="design_budget" ng-model="design_budget">
                                                	 <option value="" selected="selected"> 请选择 </option> 
                                                	 <option value="3000元以下"> 3000元以下 </option> 
                                                	 <option value="3000元-6000元"> 3000元-6000元 </option> 
                                                	 <option value="6001元-10000元"> 6001元-10000元 </option> 
                                                	 <option value="10001元-50000元"> 10001元-50000元</option> 
                                                	 <option value="50000元以上"> 50000元以上 </option>
                                               	</select>
                                                <span class="tips_false"> </span>
                                            </div>
                                        </div>
                                        
                                        <div class="righttu col-lg-5 col-lg-offset-1 col-mg-5 col-mg-offset-1 col-sm-6 col-xs-6">
                                            <div class="form-group selectF" style="position:relative;">
                                                <label class="control-label"> 装修预算（元） : <span class="symbol required"> </span> </label>
                                               <!-- <div style="position:relative"><input type="text" placeholder="" class="form-control" id="money" name="project-price" ng-model="renovationbudget" style="ime-mode:disabled" onkeyup="return ValidateFloat(this,value)" required="" /><span style="position:absolute;right:-30px;top:8px;color:#666">万元</span></div> -->
                                                <select class="form-control" id="decoration_budget" name="Decoratebudget" ng-model="decoration_budget"> 
                                                	<option value="" selected="selected"> 请选择 </option> 
                                                	<option value="5万以下"> 5万以下 </option> 
                                                	<option value="5万-10万"> 5万-10万 </option> 
                                                	<option value="10万-15万"> 10万-15万 </option> 
                                                	<option value="15万-20万"> 15万-20万 </option> 
                                                	<option value="20万以上"> 20万以上 </option>
                                                </select>
                                                <span class="tips_false" style="margin-right:-12px;"> </span>
                                                <div style="position:absolute;bottom:-38px;right:0;color:#0084ff;font-size:14px;">包含装修费用和家具费用</div>
                                            </div>
                                        </div>
                                     </li>
                                      <li class="clearfix">
                                        <div class="leftru col-lg-5 col-mg-5 col-sm-6 col-xs-6">
                                            <div class="form-group  selectF">
                                                <label class="control-label"> 风格 : <span class="symbol required"> </span> </label>
                                                <select class="form-control" id="renovationStylereq" name="renovationStylereq" ng-model="decoration_style">
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
					                                <option value="mediterranean">地中海</option>
					                                <option value="other">其他</option>
												</select>
												<span class="tips_false"> </span>
                                            </div>
                                        </div> 
                                       </li>
                                    <li class="clearfix">
                                        <div class="form-group connected-group col-lg-11 col-md-11 col-sm-11 col-xs-11">
                                            <label class="control-label"> 项目地址 : <span class="symbol required"> </span> </label>
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 margin-bottom10 selectF" style=" height: 34px;">
                                                    <select id="seachprov" class="form-control" name="s_province" placeholder="省" ng-model="province" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"> </select> &nbsp;&nbsp;
                                                    <span class="tips_false TipsFalse"> </span>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 margin-bottom10 selectF " style=" height: 34px;">
                                                    <select id="seachcity" name="s_city" class="form-control" placeholder="市" ng-model="city" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"> </select>
                                                    <span class="tips_false TipsFalse"> </span>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 margin-bottom10 selectF" style=" height: 34px;">
                                                    <select id="seachdistrict" name="s_county" class="form-control" placeholder="县/区" ng-model="district"> </select>
                                                    <span class="tips_false TipsFalse"> </span>
                                                </div>
                                                <div class="form-group col-lg-3 col-md-3 col-sm-6 col-xs-6">
		                                           <!--  <label class="control-label"> 小区名称 : <span class="symbol required"> </span> </label> -->
		                                            <input type="text" id="house-name" name="house-name" class="form-control" ng-model="community_name" maxlength=32 onkeyup="return ValidateString(this,value)" placeholder="小区名称 " />
		                                            <span class="tips_false TipsFalse"> </span>
		                                        </div>
                                            </div>
                                        </div> 
                                      
                                    	</li>
                                    <li>
                                        <div class="form-group connected-group col-lg-11 col-md-11 col-sm-12 col-xs-12">
                                            <label class="control-label"> 户型 : <span class="symbol required"> </span> </label>
                                            <div class="row">
                                                <div class="col-md-3 selectF">
                                                    <select name="type_lv_room" id="room" class="form-control" ng-model="room">
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
                                                    <span class="tips_false TipsFalse"> </span>
                                                </div>
                                                <div class="col-md-3 selectF">
                                                    <select name="type_room" id="livingroomCountreq" class="form-control" ng-model="livingroom"> 
                                                   		 <option value="" selected="selected"> 厅 </option>
                                                   		 <option value="one" >一厅</option>
						                                 <option value="two">二厅</option>
						                                 <option value="three">三厅</option>
						                                 <option value="four">四厅</option>
						                                 <option value="five">五厅</option>
                                                    </select>
                                                    <span class="tips_false TipsFalse"> </span>
                                                </div>
                                                <div class="col-md-3 selectF">
                                                    <select name="type_rst_room" id="bathroomCountreq" class="form-control" ng-model="toilet"> 
	                                                    <option value="" selected="selected"> 卫 </option>
	                                                    <option value="one" >一卫</option>
						                                <option value="two">二卫</option>
						                                <option value="three">三卫</option>
						                                <option value="four">四卫</option>
						                                <option value="five">五卫</option>
					                                </select>
					                                <span class="tips_false TipsFalse"> </span>
                                                </div>
                                            </div>
                                        </div> 
                                    </li>
                                </ul>
                                <div class="modal-footer moft col-lg-12 col-md-12 col-sm-12 col-xs-12" style="background:#fff;border-top:none;margin-top:10px;">
                                	<button type="button" class="NewBtn btn-defaultClose" onclick="goBack()" > 关闭 </button>
                                    <button id="SubmitButton" type="submit"  class="NewBtn btn-primarySubmit button" > 立即发布 </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
			</div>
			 <div style="float:left;width:100%;min-width:1170px">
			 <#include '/common/footer.html'/>
			
			</div>
        <#--include common footer-->
       
        <#--include index-app.js file -->
<script src="${baseUrl}/js/index/homeupload.js" type="text/javascript"></script>
<script>

    $(function() {
    	$(".selectF select").focus(function(){
    	 	$(this).addClass('selected');
    	});
    	$(".selectF select").on('blur change', function(){
    	 	$(this).removeClass('selected');
    	});
    });
	function goBack(){
		window.history.back();
	}
	$(document).ready(function(){
		window.onload=function(){
			window.scrollTo(0,0);
		}
	})
	
</script>

<!--Release requirements form validation-->
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
		<script src="${baseUrl}/js/userCenter/addNeeds.js" type="text/javascript"></script>
        
        
        <script src="${baseUrl}/js/public/Area.js"></script>
		<script src="${baseUrl}/js/public/AreaData_min.js"></script>
		<script type="text/javascript">
			$(function(){
			     initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');
		    });
		</script>
    </body>
</html>
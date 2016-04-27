<#assign baseUrl=request.contextPath/>
<!DOCTYPE html>
<html ng-app="app" id="ng-app" ng-cloak>
<head lang="en" ng-controller="seoCtrl">
	<link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/markHall.css"/>
	<link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css">
	<link  rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/font-awesome.min.css">
	<link rel="stylesheet" href="${baseUrl}/css/userCenter/detail.css">
 	<#include '/common/commonhead.html'/>
 	
	<script type="text/javascript" src="${baseUrl}/angularjs/markHall/designeredit-app.js"></script>
	<script type="text/javascript" src="${baseUrl}/js/markHall/markHall-profile-edit.js"></script>
</head>

<script type="text/javascript">
	function checkRelateFee(){
		var rthis_elemt = $("#relatedFee");
		var rf_reg= /^\d{0,6}$|^\d{0,6}\.\d{1,2}$/;
			if(!rf_reg.test(rthis_elemt.val())||rthis_elemt.val().length<=0){
				rthis_elemt.addClass("error");	
				rthis_elemt.parent("div").find(".de-check-tip").css("display","block");
			}else{
				rthis_elemt.removeClass("error");
				rthis_elemt.parent("div").find(".de-check-tip").css("display","none");
			}		
	}
	function checkWorkyears(){
		var this_elemt = $("#workyears");		
		var wy_reg= /^\d{0,2}$/;
			if(!wy_reg.test(this_elemt.val())){
				this_elemt.addClass("error");		
				this_elemt.parent("div").find(".de-check-tip").css("display","block");
			}else{
				this_elemt.removeClass("error");
				this_elemt.parent("div").find(".de-check-tip").css("display","none");
			}		
	}
	
	function checkedDesignPrice(){
		if(document.getElementById("fee").selectedIndex == 0){
			$("#fee").addClass("error");		
			$("#fee").parent("div").find(".de-check-tip").css("display","block");
		}else{
			$("#fee").removeClass("error");
			$("#fee").parent("div").find(".de-check-tip").css("display","none");
		}	
	}
	$(document).ready(function(){
		skinpeeler(".change-theme-main li img");
	});
</script>
<body ng-controller="ctrl" >
<#include '/common/header.html'/>
<div class="markhall-main-content" style="background: #f3f3f3;">
    <div class="markhall-container">
        <div class="markhall-container-bg" style="margin-bottom:20px">             
            <div class="markhall-container-bg-skin-all">
	            <div class="markHall-avatarInfo">
	                <div class="markhall-container-bg-skin" data-toggle="modal" data-target="#needDetail">
	                    <p ><span></span>头图设置</p>
	                </div>
	                <div class="markhall-container-bg-icon">
	                	<div class="avatar">
		                	<img ng-src="{{designerInfo.avatar}}" alt="" ng-if="designerInfo.avatar" />
				            <img ng-src="${baseUrl}/images/global/avatar_def.jpg" alt="" ng-if="designerInfo.avatar==''||designerInfo.avatar==undefined" />
	                		<img ng-show="designerInfo.designer.is_real_name==2" src="${baseUrl}/images/userCenter/awqewrt.png" style="display: block;margin: 5px auto 0;" />
	                	</div>
	                	<div class="info">
			                <p class="d-nickName" style="line-height:1.4">{{designerInfo.nick_name}}</p>
			                <p class="d-workLife" style="margin-bottom:8px">从业年限&nbsp:&nbsp{{designerInfo.designer.experience}}年</p>
			                <p class="d-roomFee"><span style="letter-spacing: 10px;">量房费</span>:&nbsp{{designerInfo.designer.measurement_price}}元&nbsp&nbsp&nbsp&nbsp&nbsp设计费&nbsp:&nbsp{{designerInfo.designer.design_price_min}} ~ {{designerInfo.designer.design_price_max}}元/平米</p>
			                <p class="d-goodStyle"><span style="letter-spacing: 4px;">擅长风格</span>:&nbsp{{designerInfo.designer.style_long_names}}</p>    	 	
			            </div>  
	                </div>
	             </div> 
            </div>
             <input type="hidden" name="pic_index" id="pic_index" ng-model="pic_index">
		      <img style="width:100%; height:290px" ng-if="designerInfo.designer.theme_pic==null" src="${baseUrl}/images/theme_pic/design_banner_def.jpg" id="markHall-skin" alt=""/>
		      <img style="width:100%; height:290px" ng-if="designerInfo.designer.theme_pic" ng-src="${baseUrl}/images/theme_pic/design_banner_{{designerInfo.designer.theme_pic}}.jpg" id="markHall-skin" alt=""/>
        </div>
		<form name="form2" role="form" ng-submit="submit($event)">
        <div class="edit-personal-container-body">
            <div class="edit-personal-container-body-content">
                <h3 class="edit-profile">资料修改</h3>
                <div class="edit-personal-container-body-container">
                    <div class="edit-personal-about-me ">
                        <!--<span class="dot"></span>--><h3>关于我</h3>
                        <!--<p>自我介绍</p>-->
                        <div style="position: relative;">
                            <textarea name="" placeholder="请输入自我介绍的内容" maxlength="200" cols="30" rows="10" ng-model="introduction"></textarea>
                            <span class="limit-text">字数限制200</span>
                        </div>
                        <h3 style="margin-top:20px">证书与奖项</h3>
                        <textarea name="" placeholder="请输入证书名称" maxlength="200" cols="30" rows="10" ng-model="personal_honour"></textarea>
                        <!--
                        <input class="personal_honour" placeholder="请输入证书名称" ng-model="personal_honour"  type="text"/>
                        <div class="continue-adding" ><img src="${baseUrl}/images/markHall/continue-adding_03.png" alt=""/></div>
                        <input type="text" style="display:none" id="test" ng-model="test"/>
                        -->
                    </div>
                    <div class="edit-personal-transaction-related ">
                        <div  style="position: relative;height:50px" class="edit-personal-transaction-related-top">
                            <span class="related-fee" >&nbsp&nbsp&nbsp从业年限 :</span>
                            <input id="workyears" type="text" ng-model="experience" maxlength="2" onblur="checkWorkyears()"/>
                            <span class="measure-unit">年</span>
                            <div class="de-check-tip">*&nbsp请输入数字且不要超过2位数</div>
                        </div>
                        <div style="position: relative;height:50px" class="edit-personal-transaction-related-top">
                            <span class="related-fee" ><em style="color:red;font-style:normal;padding-right:5px;">*</em>量&nbsp&nbsp房&nbsp&nbsp费 :</span>
                            <input type="text" id="relatedFee" maxlength="9" ng-model="measurement_price" onblur="checkRelateFee()"/>
                            <span class="measure-unit">元</span>
                            <div class="de-check-tip">*&nbsp请输入正确的金额（整数不大于6位，小数不大于2位）</div>
                        </div>
                        <div style="position: relative;" class="edit-personal-transaction-related-top">
                            <span class="related-fee" ><em style="color:red;font-style:normal;padding-right:5px;">*</em>设&nbsp;&nbsp;计&nbsp;&nbsp;费&nbsp:&nbsp</span>
                            <select style="display:inline-block; line-height:20px" name="fee" id="fee" class="form-control" ng-model="design_price" ng-selected="design_price" onblur="checkedDesignPrice()">
                            	<option value="请选译"  selected = "selected" >请选译</option>
                            	<option value="30-60">30-60&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元/m²</option>
                            	<option value="61-120">61-120&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元/m²</option>
                            	<option value="121-200">121-200&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元/m²</option>
                            	<option value="201-600">201-600&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元/m²</option>
                            	<option value="601-1000">601-1000&nbsp;&nbsp;&nbsp;&nbsp;元/m²</option>
                            </select>
                            <div class="de-check-tip">*&nbsp请选择设计费</div>
                        </div>
                        <h3>擅长风格&nbsp;&nbsp;</h3>
                        <p>你的设计专长就是你成功交易的资本<span>（最多选5项）</span></p>
                        <div id="designer_style" class="row" style="padding-left:30px;">
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show"> 
                                <input type="checkbox"  class="green" ng-model="Japan" value="" name="日式风格">
                                    日式风格
                                 </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                    <input type="checkbox" class="green" ng-model="korea" value="" name="韩式风格">
                                韩式风格
                                </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                    <input type="checkbox"  class="green" ng-model="Mashup" value="" name="混搭风格">
                                混搭风格
                                </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                    <input type="checkbox" class="green" ng-model="european" value="" name="欧式风格">
                                欧式风格
                                </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                     <input type="checkbox" class="green" ng-model="chinese" value="" name="中式风格">
                                中式风格
                               </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                    <input type="checkbox" class="green" ng-model="neoclassical" value="" name="新古典风格">
                                新古典风格
                                </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                    <input type="checkbox" class="green" ng-model="ASAN" value="" name="东南亚风格">
                                东南亚风格
                                </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                    <input type="checkbox" class="green" ng-model="US" value="" name="美式风格">
                                美式风格
                                </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                    <input type="checkbox"  class="green" ng-model="country" value="" name="田园风格">
                                田园风格
                                </div>
                            </label>
                            <br/>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                     <input type="checkbox"  class="green" ng-model="MediterraneanSea" value="" name="地中海风格">
                                地中海风格
                                </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                    <input type="checkbox" class="green" ng-model="modern" value="" name="现代风格">
                                现代风格
                                </div>
                            </label>
                            <label class="checkbox-inline edit-personal-checkbox-inline">
                                <div class="assist-show">
                                     <input type="checkbox"  class="green" ng-model="other" value="" name="其他">
                                其他
                                </div>
                            </label>
                        </div>
                        <div class="row" style="margin-top:20px">
                            <div class="col-md-12" >
                                <div class="col-md-2"></div>
                                <div class="col-md-2"></div>
                                <div class="col-md-2 center">
                                    <a href="${baseUrl}/mark/main" type="submit" class="NewBtn btn-defaultClose" >返回</a>
                                </div>
                                <div class="col-md-2">
                                    <button id="save" class="NewBtn btn-primarySubmit" type="submit" > 保存</button>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
   </form>
        <!--change-theme-->
        <div class="change-theme modal fade in" style="height: 410px;overflow: hidden;" id="needDetail" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="false">
            <div class="change-theme-content">
                <div class="row change-theme-title">
                    <div class="col-md-11 "><p style="margin:0px !important">选择你喜欢的图片作为头图</p></div>
                      <!--<div class="col-md-1 text-right" ><p data-dismiss="modal">收起↑</p></div>-->
                </div>
                <div class="change-theme-main">
                    <div class="col-md-12" style="overflow: hidden; padding: 0px; height: 270px;">
                        <ul class="change-theme-ul" >
                            <li>
                                <img src="${baseUrl}/images/theme_pic/design_banner_1.jpg" alt="1"/>
                                <div ></div>
                            </li>
                            <li>
                                <img src="${baseUrl}/images/theme_pic/design_banner_2.jpg" alt="2"/>
                                <div ></div>
                            </li>
                            <li>
                                <img src="${baseUrl}/images/theme_pic/design_banner_3.jpg" alt="3"/>
                                <div ></div>
                            </li>
                            <li>
                                <img src="${baseUrl}/images/theme_pic/design_banner_4.jpg" alt="4"/>
                                <div ></div>
                            </li>
                            <!--<li>
                                <img src="${baseUrl}/images/theme_pic/design_banner_def.jpg" alt="def"/>
                                <div ></div>
                            </li>-->
                        </ul>
                    </div>
                    <div class="col-md-2 change-theme-arrow">
                        <!-- <img style="width:30px;height:120px;" src="${baseUrl}/images/markHall/change-theme-arrow_03.png" alt=""/> -->
                    </div>
                </div>
                <div class="change-theme-save">
                    <button class="NewBtn btn-primarySubmit" data-dismiss="modal" style="margin-top:15px;font-family: 'microsoft yahei';float: right;" ng-click="skinPeeler();" >保存</button>
                </div>
                <button class="NewBtn btn-defaultClose" data-dismiss="modal" style="margin-top:15px;color:#666;margin-right:15px;font-family: 'microsoft yahei';float: right;">取&nbsp消</button>
            </div>
        </div>
        <!--change-theme-->
    </div>
</div>

<#include '/common/footer.html'/>

</body>
</html>
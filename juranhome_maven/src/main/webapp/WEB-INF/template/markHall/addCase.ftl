<#assign baseUrl=request.contextPath/>
<!DOCTYPE html>
<html lang="en" class=" theme-color-33d685 theme-skin-light" ng-app="app" ng-cloak>
	<head ng-controller="seoCtrl">
	    
	        <link rel="stylesheet" href="${baseUrl}/css/markHall/markHall.css"/>
		    <link rel="stylesheet" href="${baseUrl}/css/public/paging.css"/>
		    <link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css">
		    <link rel="stylesheet" href="${baseUrl}/css/userCenter/Information-mian.css">
		 	<#include '/common/commonhead.html'/>
		 	
			<script type="text/javascript" src="${baseUrl}/angularjs/markHall/addCase-app.js"></script>
			
			<script src="${baseUrl}/js/public/perfect-scrollbar-v0.5.2.js"></script>
		    <script src="${baseUrl}/js/markHall/markHall-profile-edit.js"></script>
		    
		    <script src="${baseUrl}/js/public/Area.js"></script>
		    <script src="${baseUrl}/js/public/AreaData_min.js"></script>
		    <script type="text/javascript">
				$(function(){
				     initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');
			    });
			</script>
			<script>
		
			$(document).ready(function(){
				skinpeeler(".change-theme-main li img");
			});
			</script>
		   <style>
		   		#logopadding .logopa{padding-top:13px !important;}
		   </style> 
	</head>
	<body class="page-single header-has-img loading" ng-controller="ctrl">
		<#include '/common/header.html'/>
		<div id="loadingMask" class="loadingMask" style="display:none"><div class="loadingFont"><img src="${baseUrl}/images/global/LoadingCursor2.gif" /></div></div>
		<div class="markhall-main-content">
		    <div class="markhall-container">
		        <div class="markhall-container-bg">
		           
		            <div class="markhall-container-bg-skin-all">
		            	<div class="markHall-avatarInfo">
			            	<div class="markhall-container-bg-skin" data-toggle="modal" data-target="#needDetail">
			                    <p ><span></span>头图设置</p>
			                </div>
			                <div class="markhall-container-bg-icon">
			                	<div class="avatar">
				                    <img  ng-show="designerInfo.avatar" ng-src="{{designerInfo.avatar}}" alt=""/>
				                    <img  ng-show="!designerInfo.avatar" src="${baseUrl}/images/global/avatar_def.jpg" alt=""/>
			                	</div>
			                	<div class="info">
			                		<p class="d-nickName" style="line-height:1.4">{{designerInfo.nick_name}}</p>
			                	 	<p class="d-workLife" style="margin-bottom:8px">从业年限&nbsp:&nbsp{{designerInfo.designer.experience}}年</p>
			                	 	<p class="d-roomFee"><span style="letter-spacing: 10px;">量房费</span>:&nbsp{{designerInfo.designer.measurement_price}}&nbsp元&nbsp&nbsp&nbsp&nbsp&nbsp设计费&nbsp:&nbsp{{designerInfo.designer.design_price_min}} ~ {{designerInfo.designer.design_price_max}}元/m²</p>
			                	 	<p class="d-goodStyle"><span style="letter-spacing: 4px;">擅长风格</span>:&nbsp{{designerInfo.designer.style_long_names}}</p>
			                	</div>
			                
			                </div>
		            	</div>
		                
		            </div>
		            <input type="hidden" name="pic_index" id="pic_index" ng-model="pic_index">
		            <input id="theme_pic_val" type="hidden" value="{{designerInfo.designer.theme_pic}}"/>
		            <img style="width:100%;height:290px; " ng-if="designerInfo.designer.theme_pic==null" src="${baseUrl}/images/theme_pic/design_banner_1.jpg" id="markHall-skin" alt=""/>
		           	<img style="width:100%;height:290px;  " ng-if="designerInfo.designer.theme_pic" ng-src="${baseUrl}/images/theme_pic/design_banner_{{designerInfo.designer.theme_pic}}.jpg" id="markHall-skin" alt=""/>
		             <!--<img style="width:100%;" src="${baseUrl}/images/markHall/markHall-bg.png" id="markHall-skin" alt=""/>-->
		        </div>
		        <div class="case-details-content clearfix" style="padding:0px">
		        	<div style="width:1200px;margin:0px auto">
				        <ol class="breadcrumb" style="margin:0px !important;padding-left:0px;border:0px; line-height: 2;">
		                    <li><a href="${baseUrl}/mark/main/" style="color:#333">
		                        	我的主页
		                    </a>  </li>
		                    <li>
		                      	 <a style="color:#333" href="${baseUrl}/mark/designerCaselist">编辑管理</a>
		                    </li>
		                    <li class="active">
		                    	案例上传
		                    </li>
		                </ol>
	               </div>  
		            <div class="case-details-container">
		                <div class="case-details-container-left">
		                <form name="form_add" id="form_add" action="${baseUrl}/user/designerMapDeportAdd" enctype="multipart/form-data"  method="post" >
		                    <h3 ng-if="data.custom_string_status==0">上传案例</h3>
		                    <h3 ng-if="data.custom_string_status!=0">编辑案例</h3>
		                    <div class="case-details-container-left-container">
		                        <p> 案例名称：<span>*</span></p>
		                        <input type="text" style="border-radius: 5px!important" name="pro-name" id="pro-name" placeholder="" ng-model="title" maxlength="22" onkeyup="ValidateCaseName(this, value)"/> <span></span>
		                        <p> 项目地址：<span>*</span></p>
		                        <div name="select-name">
		                        
		                        	<select id="seachprov" name="s_province" class="form-controler"  placeholder="省"  onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"> </select>                                      
                                    <select id="seachcity" name="s_city" class="form-controler" placeholder="市" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"> </select>                                      
                                    <select id="seachdistrict" name="s_county" class="form-controler" placeholder="县/区"> </select>

		                        </div>
		                        <p> 户型：<span>*</span></p>
		                        <div>
		                            <select  class="form-controler" name="s_house" id="s_house" ng-model="room_type" >
		                                <option value="">室</option>
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
		                            <select  class="form-controler" name="t_house" id="t_house" ng-model="bedroom" style="margin-left:8px;">
		                                <option value="">厅</option>
		                                <option value="one" >一厅</option>
		                                <option value="two">二厅</option>
		                                <option value="three">三厅</option>
		                                <option value="four">四厅</option>
		                                <option value="five">五厅</option>
		                            </select>
		                            <select  class="form-controler" name="w_house" id="w_house" ng-model="restroom">
		                                <option value="">卫</option>
		                                <option value="one" >一卫</option>
		                                <option value="two">二卫</option>
		                                <option value="three">三卫</option>
		                                <option value="four">四卫</option>
		                                <option value="five">五卫</option>
		                            </select>
		                        </div>
		                        <p class="col-md-6"> 面积：<span>*</span></p>
		                        <p class="col-md-6"> 房屋类型：<span>*</span></p>
		                        <div class="col-md-6" style="padding:0">
		                             <input  type="text" placeholder="" style="border-radius: 5px!important;color:#333;" name="dwelling-area" id="dwelling-area" ng-model="room_area" onkeyup="return ValidateFloat(this,value)" maxlength="9" /><span style="position:absolute;right:163px;top:7px;"></span>
		                             <span style="position: absolute;right:36%; font-size:16px;top:5px;color:#999;">平米</span>
		                        </div>
		
		                        <div class="col-md-6" style="padding:0">
		                            <select class="form-controler " id="house-style" name="house-style" ng-model="house_style" style="width:248px!important;height:34px;background-position:210px -48px ">
		                                <option value="">请选择</option>
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
		                        </div>
		                         <p class="col-md-6"> 项目报价：<span>*</span></p>
		                        <p class="col-md-6"> 风格：<span>*</span></p>
		                        <div class="col-md-6" style="padding:0">
		                            <input  type="text" placeholder="" style="border-radius: 5px!important;color:#333;" id="project-price" name="project-price" ng-model="prj_price" onkeyup="return ValidateFloat(this,value)" maxlength="4" /><span style="position:absolute;right:163px;top:7px;"></span>
		                            <span style="position: absolute;right:36%; font-size:16px;top:5px;color:#999;">万元</span>
		                        </div>
		                        <div class="col-md-6" style="padding:0">
		                            <select class="form-controler" id="select_style" name="select_style" ng-model="project_style" style="width:248px!important;height:34px;background-position:210px -48px ">
		                                <option value="">选择风格</option>
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
		                        </div>
		                        <p class="col-md-12"> 小区名称：<span>*</span></p>
		                        <input type="text" style="border-radius: 5px!important" maxlength="32" name="dwelling-name" id="dwelling-name" placeholder="" ng-model="community_name" onkeyup="return ValidateString(this, value)" /> <span></span>
		                        <p class="col-md-12"> 设计理念:</p>
		                        <div class="col-md-12" style="padding:0">
		                            <textarea placeholder="" rows="10" cols="30" name="case_describe" maxlength="200" id="case_describe" ng-model="description"></textarea>
		                            <p class="describe-case">请输入 <span id="word" style="color:#666">200</span>字以内的案例描述</p>
		                        </div>
		                        <p class="col-md-12">图片上传:</p>
		                        <div class="col-md-12 uploading-img " style="padding:0;height:200px;">
		                        <div  id="description" class="wrapper" style="height:200px;overflow-y:hidden;" >
		                            <p ><span style="color:#1395f2;" id="count-number">0</span>/20最多上传20张图片，图片大小不超过6M，支持JPG/BMP/PNG/GIF格式</p>
		                            <ul id="case-images" class="col-md-12" style="margin:20px 0px 0px;" >
		                                <li class="exist col-md-3 uploading-img-img" ng-if="title != ''" ng-repeat="file in files" directive>
		                                	<div class="uploading-img-img-del-img"></div>
		                                    <img class="uploading-img-thumb" fid="{{file.file_id}}" ng-if="file.file_url.length >0" style="width:100%; height:84px;" ng-src="{{file.file_url}}Large.jpg" alt=""/>

		                                </li>
		                                <li id="case-uploading-img" class="col-md-3 uploading-img-img" id="case-add-img">
		                                    <img style="width:100%; height:84px;" src="${baseUrl}/images/userCenter/click-add_10.png" alt=""/>
		                                    <span id="file_fields">
		                                    	<!-- <input id="case-input-file" type="file"  name="file" onchange="previewImage(this,1)" multiple="true" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0" ng-model="file"/>-->
		                                    	<input id="case-input-file" type="file"  name="file" onchange="previewImage(this,1)" multiple="true" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0" />
		                                    </span>
		                                </li>
		                            </ul>
		                            <input type="hidden" id="fileList" name="fileList" />
		                            </div>
		                            <input type="hidden" name="status"  ng-model="status" value="{{status}}" />
		                            <input type="hidden" name="caseId"  ng-model="caseId" value="{{caseId}}" />
		                            <input type="hidden" id="protoImg" name="protoImg"  ng-model="protoImg" value="{{protoImg}}" />
		                            <input type="hidden" id="province_name" name="province_name" value="" />
		                            <input type="hidden" id="city_name" name="city_name" value="" />
		                            <input type="hidden" id="county_name" name="county_name" value="" />
		                            <input type="hidden" id="oldImg_id" name="oldImg_id" value="" />
		                            
		                        </div>
		                    </div>
		
		                    <div class="col-md-12" style="margin:50px 0">
		                        <div class="col-md-2"></div>
		                        <div class="col-md-2"></div>
		                        <div class="col-md-2">
		                            <a href="${baseUrl}/mark/designerCaselist" id="btnClose" class="NewBtn btn-defaultClose btn-block">关闭</a>
		                        </div>
		                        <div class="col-md-2">
		                            <button id="btnSubmit" type="submit" class="NewBtn btn-primarySubmit btn-block button">提交</button>
		                        </div>
		                    </div>
		
						</form>
		                </div>
		                    <div class="case-details-container-right">
		                        <div class="case-details-container-right-top">
		                        <h3 style="margin:0px;">原创案例规则</h3>
		                        <div class="case-details-container-right-rule">
		                            <span class="dot"></span><p style="margin-bottom: 10px;">上传大小6M以内的高清实景或效果图原创方案。</p>
		                            <span class="dot" style="position: relative;top:-50px;"></span><p>我保证所上传的作品是由我自己创作，并非剽窃<br/>抄袭他人的作品，拥有自主的知识产权， 如有侵<br/>权，我将承担一切版权纠纷责任。</p>
		                        </div>
		                    </div>
		                    <div class="case-details-container-right-bottom">
		                        <h3>请勿上传</h3>
		                        <div class="case-details-container-right-rule" style="height:173px;">
		                            <div>
		                            <span class="dot"></span><p >带有外网LOGO或广告水印的图片</p>
		                            </div>
		                            <div>
		                            <span class="dot" ></span><p>模糊变形，低质量的图片</p>
		                             </div>
		                            <div>
		                            <span class="dot" ></span><p>与主题明显不相干的图片</p>
		                            </div>
		                            <div>
		                            <span class="dot" style="position: relative;top:-23px;"></span><p>请勿上传PDF、TIFF、EPS文件格式（支持<br/>
		                            JPG/BMP/PNG/GIF格式）</p>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		         
		            </div>
					 <!--change-theme-->
			        <div class="change-theme modal fade in" id="needDetail" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="false" style="z-index: 99999;height: 410px; overflow: hidden; margin-top: 0px;">
			            <div class="change-theme-content">
			                <div class="row change-theme-title">
			                    <div class="col-md-11 "><p style="margin:0px !important">选择你喜欢的图片作为头图</p></div>
			                   <!-- <div class="col-md-1 text-right" ><p data-dismiss="modal">收起↑</p></div>-->
			                </div>
			                <div class="change-theme-main">
			                    <div class="col-md-12" style="height:270px;overflow: hidden;padding:0px">
			                        <ul class="change-theme-ul" >
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
			                        <!-- <img style="width:30px;height:120px;" src="${baseUrl}/images/markHall/change-theme-arrow_03.png" alt=""/> -->
			                    </div>
			                </div>
			              
			                     <div class="change-theme-save">	
				                	<button class="btn btn-primary btn-block" data-dismiss="modal" style="margin-top:15px;color:#fff; font-size:16px;font-family: 'microsoft yahei';width:118px;float: right;" ng-click="skinPeeler();">保&nbsp存</button>
				                </div>
				                <button class="btn btn-block" data-dismiss="modal" style="background-color:#fff;margin-top:15px;color:#666; border-color:#ebebeb;margin-right:15px;font-size:16px;font-family: 'microsoft yahei';width:118px;float: right;">取&nbsp消</button>
			           		
			            </div>
			        </div>
			        <!--change-theme-->
		        </div>
		    </div>
		</div>
		<script>
			function getUrlParam(name) {
				var reg = new RegExp("[\?\]"+name+"=([^\/]*)(\/?)","i");
	            var r = window.location.href.substr(1).match(reg); 
	            if (r != null) return unescape(r[1]); return null;
			};
			
			$(function() {
				if(getUrlParam('act') && getUrlParam('act') == 'case') {
					alert('发送成功！');
				}
				
				if(getUrlParam('act') && getUrlParam('act') == 'caseerr') {
					alert('发送失败！');
		    	}
			});
	
			$('#description').perfectScrollbar();
		</script>
			<#include '/common/footer.html'/>

	</body>
</html>
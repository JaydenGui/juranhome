<#assign baseUrl=request.contextPath/>
<!DOCTYPE html>
<html lang="en" class=" theme-color-33d685 theme-skin-light" ng-app="app">
	<head ng-controller="seoCtrl">
		<link rel="stylesheet" type="text/css" href="${baseUrl}/css/markHall/markHall.css"/>
	 	<#include '/common/commonhead.html'/>
	 	<script type="text/javascript" src="${baseUrl}/angularjs/markHall/caseList-app.js"></script>
		<script type="text/javascript" src="${baseUrl}/js/markHall/markHall-profile-edit.js"></script>
		<script src="${baseUrl}/js/public/bootstrap-hover-dropdown.min.js"></script>
		<script>
			$(document).ready(function(){
				skinpeeler(".change-theme-main li img");
			});
		</script>
	</head>
	<body class="page-single header-has-img loading" ng-controller="ctrl">
	<#include '/common/header.html'/>
	 	<div class="markhall-main-content" >
		    <div class="markhall-container" >
		        <div class="markhall-container-bg" ng-cloak>
		            <div class="markhall-container-bg-skin-all">
		            	<div class="markHall-avatarInfo">
			                <div class="markhall-container-bg-skin" data-toggle="modal" data-target="#needDetail">
			                    <p><span></span>头图设置</p>
			                </div>
			                <div class="markhall-container-bg-icon" ng-cloak>
				                <div class="avatar">
				                    <img ng-if="!designerInfo.avatar" src="${baseUrl}/images/global/avatar_def.jpg" alt=""/>
				                    <img ng-if="designerInfo.avatar" ng-src="{{designerInfo.avatar}}" alt=""/>
				               		<img ng-show="designerInfo.designer.is_real_name==2" src="${baseUrl}/images/userCenter/awqewrt.png" style="display: block;margin: 5px auto 0;" />
				                </div>    
				                <div class="info">
					                <p class="d-nickName" style="line-height:1.4">{{designerInfo.nick_name}}</p>
					                <p class="d-workLife" style="margin-bottom:8px">从业年限&nbsp:&nbsp{{designerInfo.designer.experience}}年</p>
					                <p class="d-roomFee"><span style="letter-spacing: 10px;">量房费</span>:&nbsp{{designerInfo.designer.measurement_price}}元&nbsp&nbsp&nbsp&nbsp&nbsp设计费&nbsp:&nbsp{{designerInfo.designer.design_price_min}} ~ {{designerInfo.designer.design_price_max}}元/m²</p>
					                <p class="d-goodStyle"><span style="letter-spacing: 4px;">擅长风格</span>:&nbsp{{designerInfo.designer.style_long_names}}</p>    	 	
					            </div>  
			                </div>
			            </div>   
		            </div>
		            <input type="hidden" name="pic_index" id="pic_index" ng-model="pic_index">
		            <img style="width:100%;height:290px; " ng-if="designerInfo.designer.theme_pic==null" src="${baseUrl}/images/theme_pic/design_banner_def.jpg" id="markHall-skin" alt=""/>
		            <img style="width:100%;height:290px; " ng-if="designerInfo.designer.theme_pic" ng-src="${baseUrl}/images/theme_pic/design_banner_{{designerInfo.designer.theme_pic}}.jpg" id="markHall-skin" alt=""/>
		        </div>
		
		        <div class="edit-personal-container-body">
			       <div style="width:1200px;margin:0px auto">
			        <ol class="breadcrumb" style="margin:0px;padding-left:0px;border:0px; line-height: 2;">
	                    <li><a href="${baseUrl}/mark/main/" style="color:#333">
	                        	我的主页
	                    </a>  </li>
	                    <li class="active">
	                      	 编辑管理
	                    </li>
	                </ol>
	               </div>  
		            <div class="edit-personal-container-body-content">
		                <h3 class="edit-management ">编辑管理</h3>
		                <div class="edit-personal-container-body-container">
		                    <div class="edit-personal-about-me edit-management-diy">
		                        <span class="dot"></span><h3>我的案例库</h3>
		                    </div>
		                    <div class="row my-diy-project" >
		                        <ul class=" col-md-12   " style="" >
		                        	<li  class="col-md-3 juran-building-img" id="material" style="border:0 none;position: relative;">
		                               <a href="${baseUrl}/mark/addCase"> <img style="width:100% height:200px;" src="${baseUrl}/images/userCenter/click-add_10.png" alt=""/></a>
		                            </li>
		                            <li  class="col-md-3 my-diy-project-img" ng-repeat = "list in caseList">
		                                <div style="overflow:hidden;height:190px;" ng-click="caseDetail(list.id,list.custom_string_status)"><img ng-if="!list.images[0].file_url" ng-src="${baseUrl}/images/global/default_image.jpg" alt=""/>
		                             		 <img ng-if="list.images[0].file_url"  ng-src="{{list.images[0].file_url}}Large.jpg" alt=""/></div>
		                                <!--<div class=rotate45>9图</div>-->
		                                <h3>{{list.title}}--{{list.community_name}}</h3>
		                                <p>{{list.room_type|replaceRoomType}}{{list.bedroom|replaceBedRoom}}{{list.restroom|replaceRestRoom}}<span>|</span>{{list.room_area|replaceArea}}<span>|</span>{{list.project_style|replaceStyle}}</p>
		                               <p class="my-diy-check" ng-if="list.custom_string_status == 0">审核中</p>
		                                <div class="audit-not-through" ng-if="list.custom_string_status == 2">
			                                <p ng-if="list.custom_string_status == 2">审核不通过</p>
			                                <p data-dismiss="modal"   data-toggle="modal" data-target="#cause-failure" ng-click="editDetail(list.id,list.custom_string_status,list.audit_desc)" >查看详情</p>
		                                
										</div>
		                        </ul>
		                   
		                    </div>
		                    <!--pagination start-->
					         <div class="mainpage"style="margin:0 auto;">
								<pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" ></pagination>
							 </div>
							<!--pagination end-->
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		 <!--change-theme-->
			        <div class="change-theme modal fade in" style="height: 410px;overflow: hidden;"  id="needDetail" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="false">
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
			                       <!--  <img style="width:30px;height:120px;" src="${baseUrl}/images/markHall/change-theme-arrow_03.png" alt=""/> -->
			                    </div>
			                </div>
			                <div class="change-theme-save">
			                    <button class="NewBtn btn-primarySubmit" data-dismiss="modal" style="margin-top:15px;font-family: 'microsoft yahei';float: right;" ng-click="skinPeeler();">保存</button>
			                	
			                </div>
			                <button class="NewBtn btn-defaultClose" data-dismiss="modal" style="margin-top:15px;margin-right:15px;font-family: 'microsoft yahei';float: right;">取&nbsp消</button>
			            </div>
			        </div>
			        <!--change-theme-->
			        <!-- Modal Dialog of reasons -->
			        <div class="no-certification cause-failure modal fade" id="cause-failure" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true" >
			            <div class="cause-failure-header">
				            <div class="col-md-11">
			                   <h3>对不起，审核未通过</h3>
			                   <input type="text"  style="border:none; color:#000; font-size:16px; letter-spacing:2px;" disabled="true"  ng-model="result">
			                </div>
			                <div class="col-md-1" style="padding-left:0px;margin-top: 12px;cursor: pointer; "data-dismiss="modal">
			                    <img src="${baseUrl}/images/markHall/close-btn_03.png" alt=""/>
			                </div>
			            </div>
			            <div class="cause-failure-body">
			                
			                <a target="_blank"   style="color: #fff;text-decoration: none;"><button class="NewBtn btn-primarySubmit cause-failure-body-btn " data-dismiss="modal" ng-click="gotoauthentication(id,status)" >立即修改</button></a>
			                <button class="NewBtn btn-defaultClose cause-failure-body-btn" data-dismiss="modal">取消</button>
			            </div>
			        </div>
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
       	 <!-- Modal Dialog of reasons -->
       	 <script type="text/javascript">
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
	     </script>
		<#if !users?exists>
		     <script type="text/javascript">
				 location.href =baseUrl+"/";
				 //location.href =loginPaht();
		 	 </script>
	    </#if>
	    <#include '/common/footer.html'/>
	      
	    <link href="${baseUrl}/css/public/paging.css" rel="stylesheet" type="text/css">
		<script src="${baseUrl}/js/userCenter/postyourwant.js" type="text/javascript"></script>
		<script src="${baseUrl}/js/public/date-time/bootstrap-datetimepicker.min.js"></script>
		<script src="${baseUrl}/js/public/date-time/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="${baseUrl}/js/public/perfect-scrollbar-v0.5.2.js"></script>
		<script type="text/javascript">
		   	$(document).ready(function(){
		   		var datejsop=new Date();
		   			   $('#msg-datetimepicker').datetimepicker({
		   			   		language:  'zh-CN',
		   			   		autoclose: true,
			    	   		startDate: datejsop,
			          		minuteStep: 10
		   			   });
		    	$("#msg-datetimepicker").attr('data-date',datejsop);
		   	});
      		$(document).on('click','#scrollTopG .scrollTopG',function(){
			   //console.log( $('#scrollTopG .scrollTopG').html() );
				//alert();
		       $('html,body').animate({scrollTop:0},'slow');
		   });
		</script>
	</body>
</html>
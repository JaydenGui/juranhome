<#assign baseUrl=request.contextPath/>
<!DOCTYPE html>
<html lang="en" class=" theme-color-33d685 theme-skin-light"  ng-app="app" id="ng-app" ng-cloak>
	<head ng-controller="seoCtrl">
	
			<link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/bootstrap-fileupload.min.css">
			<link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/certificate.css">
		    <!--[if lt IE 9]>
		    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		    <![endif]-->
		    <#include '/common/commonhead.html'/>
			<script type="text/javascript" src="${baseUrl}/angularjs/user/authentication-app.js"></script>
			<script type="text/javascript" src="${baseUrl}/js/userCenter/authentication.js"></script>
	</head>
	<body  class=" header-has-img" ng-controller="ctrl">
	<#include '/common/header.html'/>
	<div class="certificate-main-content" ng-cloak>
	    <div class="certificate-container">
	        <!-- start: PAGE HEADER -->
	        <div class="row certificate-header">
	            <div class="col-sm-12">
	                <!-- start: PAGE TITLE & BREADCRUMB -->
	                <ol class=" breadcrumb certificate-breadcrumb">
	                    <li>
	                        <a href="${baseUrl}/user/index#/mybidlist" style="text-decoration:none;color:#666;">
	                            个人中心
	                        </a>
	                    </li>
	                    <li class="active">
	                        实名认证
	                    </li>
	
	                </ol>
	                <!-- end: PAGE TITLE & BREADCRUMB -->
	            </div>
	        </div>
	        <!-- end: PAGE HEADER -->
	        <!-- start: PAGE CONTENT -->
	        <div class="row certificate-body" style="margin-bottom: 11%;" ng-cloak>
	            <div class="col-sm-12">
	                <div class="tabbable">
	                    <div class="">
	                        <div class="col-md-12 certificate-title">
	                            <h3>实名认证</h3>
	                        </div>
	                        <div id="panel_verification" class="tab-pane in active">
	                            <form name="form_submit"  role="form" enctype="multipart/form-data" method="post" action="${baseUrl}/user/DesignerAuthentication">
	
	                                <div class="row">
	                                    <div class="col-md-12 certificate-complete"  style="padding-left: 30px;">
	                                        		完善实名认证 - 1. 获实名认证标识  2. 可上传效果图方案  3. 可至“ 应标大厅 ”承接家装订单
	                                    </div>
	                                </div>
	                               
	                         <!--实名认证第一步-->
	                         
	                         <div ng-show="realname.audit_status==null||realname.audit_status==3" ng-cloak> 
	                                    <div class="col-md-12 certificate-complete-img">
	                                        <img src="${baseUrl}/images/userCenter/certificate-step1.png">
	                                    </div>
	                                <div class="row certificate-forms">
	                                    <div class="col-md-12">
	                                         <div class="form-group">
	                                             <div class="col-sm-2"></div>
	                                             <label class="col-sm-2 text-right " for="form-control">
	                                                 真实姓名
	                                             </label>
	                                             <div class="col-sm-5">
	                                                 <input type="text"  ng-disabled="isOnlyRead" maxlength="10"  class="form-control" id="lastname" name="lastname"  ng-model="realname.real_name">
	                                                 <span></span>
	                                             </div>
	                                         </div>
	                                     </div>
	                                     <div class="col-md-12">
	                                         <div class="form-group">
	                                             <div class="col-sm-2"></div>
	                                             <label class="col-sm-2 text-right" for="form-control">
	                                                 身份证号
	                                             </label>
	                                             <div class="col-sm-5">
	                                                 <input type="text" maxlength="18" style="ime-mode:disabled" class="form-control" ng-disabled="isOnlyRead" id="id-card" name="id-card" ng-model="realname.certificate_no">
	                                                 <span></span>
	                                             </div>
	                                         </div>
	                                     </div>
	                                     <div class="col-md-12"  ng-if="member.mobile_number==null">
	                                         <div class="form-group">
	                                             <div class="col-sm-2"></div>
	                                             <label class="col-sm-2 text-right" for="form-control">
	                                                 手机号码
	                                             </label>
	                                             <div class="col-sm-5">
	                                                 <input  class="form-control" ng-disabled="isOnlyRead" maxlength="11"  id="phone" name="phone" ng-model="realname.mobile_number">
	                                                 <span></span>
	                                             </div>
	                                         </div>
	                                     </div>
	                                     <div class="col-md-12"  ng-if="member.mobile_number!=null">
	                                         <div class="form-group">
	                                             <div class="col-sm-2"></div>
	                                             <label class="col-sm-2 text-right" for="form-control">
	                                                 手机号码
	                                             </label>
	                                             <div class="col-sm-5">
	                                                 {{phone}}<input type="text" id="phone2" name="phone2" style="display:none;" value="" ng-model="phone" /><span><span>
	                                                          <input type="text" id="phone3" name="phone3" style="display:none" value="" ng-model="truePhone">
	                                             </div>
	                                         </div>
	                                     </div>
	                                     <!-- 
	                                     <div class="col-md-12" ng-if="member.mobile_number==null">
	                                         <div class="form-group">
	                                             <div class="col-sm-2"></div>
	                                             <label class="col-sm-2 text-right" for="form-control">
	                                                 验证码
	                                             </label>
	                                             <div class="col-sm-3">
	                                                 <input  class="form-control" ng-disabled="isOnlyRead"  id="authcode" name="authcode" ng-model="authcode">
	
	                                             </div>
	                                             <div class="col-sm-2">
	                                                 <div class="form-control testGetcode" style="border-color:#0084ff;color:#0084ff;">获取验证码</div>
	                                             </div>
	                                         </div>
	                                     </div>
	                               -->
	                                     
	                                    <div class="col-md-12 upload-idcard " ng-cloak>
	                                        <div class="form-group col-md-4">
	                                            <label>
	                                                身份证正面上传
	                                            </label>
	                                            <div class="fileupload fileupload-new " data-provides="fileupload">
	                                                <div class="fileupload-new  fileupload-new-designer" style="width: 314px; height:234px;" ng-if="realname.audit_status==null">
	                                                    <img class="id-img" id="id-img-front" src="${baseUrl}/images/userCenter/facade.png" alt="" style="width:100%;height:100%;">
	                                                </div>
	                                                <div class="fileupload-new " style="width: 314px; height:234px;" ng-if="realname.audit_status==3">
	                                                    <img class="id-img" id="id-img-front" ng-src="{{realname.photo_front_end.file_url}}"  alt="" style="width:100%;height:100%;">
	                                                </div>
	                                                <div class="col-md-3"></div>
	                                                <div class="col-md-6" style="position:relative">
	                                                    <button class="btn btn-teal btn-block button" type="submit" style="background-color:#fff;color:#0084ff; font-size:14px;max-width:120px;border:1px solid #0084ff;font-family: 'microsoft yahei';margin:20px 0 0 -18px;"  > 选择图片</button>
	                                                    <input type="file" name="frontimageurl"   onchange="previewImage(this,1)"  value="" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0"/>
	                                                </div>
	                                            </div>
	                                        </div>
	
	                                        <div class="form-group col-md-4" ng-cloak>
	                                            <label>
	                                                身份证背面上传
	                                            </label>
	                                            <div class="fileupload fileupload-new" data-provides="fileupload">
	                                                <div class="fileupload-new fileupload-new-designer " style="width: 314px; height:234px;" ng-if="realname.audit_status==null">
	                                                    <img class="id-img" id="id-img-back" src="${baseUrl}/images/userCenter/backfaces.png" alt="" style="width:100%;height:100%;">
	                                                </div>
	                                                 <div class="fileupload-new " style="width: 314px; height:234px;;" ng-if="realname.audit_status==3">
	                                                    <img class="id-img" id="id-img-back" ng-src="{{realname.photo_back_end.file_url}}" alt="" style="width:100%;height:100%;">
	                                                </div>
	                                                <div class="col-md-3"></div>
	                                                <div class="col-md-6" style="position:relative">
	                                                    <button class="btn btn-teal btn-block button" type="submit" style="background-color:#fff;color:#0084ff; font-size:14px;max-width:120px;border:1px solid #0084ff;font-family: 'microsoft yahei';margin:20px 0 0 -18px;"> 选择图片</button>
	                                                    <input type="file"  name="backimageurl" onchange="previewImage(this,2)"   style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0" value=""/>
	                                                </div>
	                                            </div>
	                                        </div>
	
	                                        <div class="form-group col-md-4">
	                                            <label>
	                                                手持身份证上传
	                                            </label>
	                                            <div class="fileupload fileupload-new" data-provides="fileupload">
	                                                <div class="fileupload-new fileupload-new-designer" style="width: 314px; height:234px;" ng-if="realname.audit_status==null">
	                                                    <img class="id-img" id="id-img-holder" src="${baseUrl}/images/userCenter/shouchi.png" alt="" style="width:100%;height:100%;">
	                                                </div>
	                                                <div class="fileupload-new " style="width: 314px; height:234px;" ng-show="realname.audit_status==3">
	                                                    <img class="id-img" id="id-img-holder" ng-src="{{realname.photo_in_hand.file_url}}" alt="" style="width:100%;height:100%;">
	                                                </div>
	                                                <div class="col-md-3"></div>
	                                                <div class="col-md-6" style="position:relative">
	                                                    <button class="btn btn-teal btn-block button" type="submit" style="background-color:#fff;color:#0084ff; font-size:14px;max-width:120px;border:1px solid #0084ff;font-family: 'microsoft yahei';margin:20px 0 0 -18px;" > 选择图片</button>
	                                                    <input type="file" value="" name="handimageurl"  onchange="previewImage(this,3)" style="position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0"/>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <input type="hidden" id="submitType" name="submitType" >
	                        <div class="row" ng-cloak> 
	                            <div class="col-md-12" ng-show="realname.audit_status==null">
	                            	<div style="display:none;"></div>
	                                <div class="col-md-2"></div>
	                                <div class="col-md-2"></div>
	                                <div class="col-md-1"></div>
	                                <div class="col-md-2">
	                                    <button id="btnSubmit" class="NewBtn btn-primarySubmit button" type="submit"  onclick="$('#submitType').val(1)"> 提交</button>
	                                </div>
	                            </div>
	                        </div>
	                         <div class="row">
	                            <div class="col-md-12" ng-show="realname.audit_status==3">
	                            	<div style="display:none;"></div>
	                                <div class="col-md-2"></div>
	                                <div class="col-md-2"></div>
	                                <div class="col-md-1"></div>
	                                <div class="col-md-2">
	                                    <button id="btnSubmit" class="NewBtn btn-primarySubmit button" type="submit"  onclick="$('#submitType').val(2)" > 重新提交</button>
	                                </div>
	                            </div>
	                        </div>
	                     </form>
	                 </div>
	                     <!--正在审核中--> 
	                     <div ng-if="realname.audit_status==0" ng-cloak>  
	                        <div class="col-md-12">
	                        		 <div class="col-md-12 certificate-complete-img">
	                                        <img src="${baseUrl}/images/userCenter/certificate-step2.png">
	                                  </div>
	                                        <div class="form-group">
	
	                                            <label class="col-sm-6 text-right " for="form-control">
	                                                真实姓名
	                                            </label>
	                                            <div class="col-sm-5">
	                                                {{realname.real_name}}
	                                            </div>
	                                        </div>
	                          </div>
	                                    <div class="col-md-12">
	                                        <div class="form-group">
	
	                                            <label class="col-sm-6 text-right" for="form-control">
	                                                身份证号
	                                            </label>
	                                            <div class="col-sm-5">
	                                               {{realname.certificate_no}}
	                                            </div>
	                                        </div>
	                                    </div>
	
	                                    <!--Binding mobile phone-->
	                                    <div class="col-md-12">
	                                        <div class="form-group">
	
	                                            <label class="col-sm-6 text-right" for="form-control">
	                                                手机号码
	                                            </label>
	                                            <div class="col-sm-5">
	                                                {{realname.mobile_number}}
	                                            </div>
	                                        </div>
	                                    </div>
	                                     <!-----------------image   start--------------------->
	                        <div class="col-md-12 upload-idcard ">
	                                        <div class="form-group col-md-4">
	                                            <label>
	                                                身份证正面上传
	                                            </label>
	                                            <div class="fileupload fileupload-new " data-provides="fileupload">
	                                                <div class="fileupload-new fileupload-new-designer" style="width: 314px; height:234px;" >
	                                                    <img class="id-img" id="id-img-front" ng-src="{{realname.photo_front_end.file_url}}" alt="" style="width:100%;height:100%;">
	                                                </div>
	                                                <div class="col-md-3"></div>
	                                            </div>
	                                        </div>
	
	                                        <div class="form-group col-md-4">
	                                            <label>
	                                                身份证背面上传
	                                            </label>
	                                            <div class="fileupload fileupload-new " data-provides="fileupload">
	                                                <div class="fileupload-new fileupload-new-designer" style="width: 314px; height:234px;" >
	                                                    <img class="id-img" id="id-img-back" ng-src="{{realname.photo_back_end.file_url}}" alt="" style="width:100%;height:100%;">
	                                                </div>
	                                                <div class="col-md-3"></div>
	                                            </div>
	                                        </div>
	
	                                        <div class="form-group col-md-4">
	                                            <label>
	                                                手持身份证上传
	                                            </label>
	                                            <div class="fileupload fileupload-new " data-provides="fileupload">
	                                                <div class="fileupload-new fileupload-new-designer" style="width: 314px; height:234px;" >
	                                                    <img class="id-img" id="id-img-holder" ng-src="{{realname.photo_in_hand.file_url}}" alt="" style="width:100%;height:100%;">
	                                                </div>
	                                                <div class="col-md-3"></div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <!------------------image    end------------------------->
	                        
	                        </div>
	                       
	                        
	                        
	                        
	                         <!--通过实名认证去接单部分-->
	                         <div ng-if="realname.audit_status==2" ng-cloak>
	                         			 <div class="col-md-12 certificate-complete-img">
	                                        <img src="${baseUrl}/images/userCenter/certificate-step3.png">
	                                    </div>
	                                	<div class="row certificate-forms" >
	                                    <div class="col-md-5" style="margin-bottom: 60px;text-align:right;">
	                                        <img  style="float:right;" src="${baseUrl}/images/userCenter/verify-past.png" alt=""/>
	                                    </div>
	                                    <div class="col-md-7" style="margin-bottom: 140px;">
	                                        <h1 style="font-family: 'microsoft yahei';font-size: 18px;color:#82c65e;">恭喜您！您已经通过实名认证</h1>
	                                        <p style="font-size:14px;color:#333;">可以去应标大厅接单了</p>
	                                    </div>
	                                    <div class="col-md-12"  style="margin-bottom: 100px;" >
	                                        <div class="col-md-2"></div>
	                                        <div class="col-md-2"></div>
	                                        <div class="col-md-1"></div>
	                                        <div class="col-md-2">
	                                            <button class="NewBtn btn-primarySubmit" type="submit" ng-click="gotomarkpage()" > 我要应标</button>
	                                        </div>
	                                    </div>
	                                </div>
	                           </div>
	                            <!--实名认证失败部分-->
	                            <div ng-if="realname.audit_status==1" ng-cloak>
	                                 <div class="col-md-12 certificate-complete-img">
	                                        <img src="${baseUrl}/images/userCenter/certificate-step3.png">
	                                 </div>
	                                <div class="row certificate-forms">
	                                    <div class="col-md-5" style="margin-bottom: 60px;text-align:right;">
	                                        <img  style="float:right;" src="${baseUrl}/images/userCenter/verify-failed.png" alt=""/>
	                                    </div>
	                                    <div class="col-md-7" style="margin-bottom: 140px;">
	                                        <h1 style="font-family: 'microsoft yahei';font-size: 18px;color:#f24713;">很遗憾，您的身份审核失败。</h1>
	                                        <p style="font-family: 'microsoft yahei';font-size: 14px;color:#333;">原因：{{realname.auditor_opinion}}</p>
	                                    </div>
	                                    <div class="col-md-12" >
	                                        <div class="col-md-2"></div>
	                                        <div class="col-md-2"></div>
	                                        <div class="col-md-1"></div>
	                                        <div class="col-md-2">
	                                            <button ng-click="againSubmit()" class="NewBtn btn-primarySubmit" type="submit" > 重新提交</button>
	                                        </div>
	                                    </div>
	                                </div>
								</div>
	
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- end: PAGE CONTENT-->
	</div> 
	</body>
</html>
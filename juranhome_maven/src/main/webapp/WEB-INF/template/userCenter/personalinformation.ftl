<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html ng-app="app" id="ng-app" ng-cloak>
<head lang="en" ng-controller="seoCtrl">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title ng-bind="title"></title>
	<meta name="keywords" content="{{keywords}}">
	<meta name="description" content="{{description}}">
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/edit_avatar.css">
    <link href="${baseUrl}/css/userCenter/cropper.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${baseUrl}/css/userCenter/personal.css">
    <#include '/common/commonhead.html'/>
    <script src="${baseUrl}/angularjs/user/editPerson-app.js" charset="utf-8"></script>
    <script src="${baseUrl}/js/public/Area.js"></script>
    <script src="${baseUrl}/js/public/AreaData_min.js"></script>
    <script type="text/javascript">
		$(function(){
		     initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');
	    });
		
        function userName(){
      	  $('.promptse').css({'display':'block'});
        }
        function UserName(){
      	  $('.promptse').css({'display':'none'});
        }
        function userEmail(){
       	  $('.promptEmail').css({'display':'block'});
        }
        function UserEmail(){
       	  $('.promptEmail').css({'display':'none'});
        }
      	
   </script>
   
</head>
<body ng-controller="ctrl">
 <#include '/common/header.html'/>
<ul class="Personalxu">
   	<li>
   	 	<#if users.type=='member'>
      	 <a href="${baseUrl}/user/index/#myorder/">个人中心></a>
	    <#else>
	       <a href="${baseUrl}/user/index/#mybidlist/">个人中心></a>
	    </#if>
   	</li>
   	<li>&nbsp个人信息修改</li>
 </ul>
  <div class="editavatar" id="avatar-modal">
      <div class="container">
          <ul class="tabs">
              <li class="active"><a href="#tab1">基本资料</a></li>
              <li class="shuxian"></li>
              <li><a href="#tab4">编辑头像</a></li>
          </ul>
          <div class="tab_container">
              <div id="tab1" class="tab_content" style="display: block; ">
                  <!-- edit_personal_information -->
                  <div class="edit_personal_information">
                      <form class="registerform"  ng-submit="editMemberMessage()">
                          <div class="leftinformation">
                              <table width="100%" style="table-layout:fixed;">
                                  <tbody>
                                  <tr>
                                      <td style="width:125px;">用户名</td>
                                      <td style="width:300px;"><input id="user_name" type="text" value="" name="hitachi_account" class="inputxt"  ng-model="hitachi_account" readonly="readonly" style="border:none;" onFocus="userName()" onBlur="UserName()"></td>
                                      <td><div class="promptse" style="color:green;display:none;">用户名不可修改</div></td>
                                  </tr>
                                  <tr>
                                      <td style="width:125px;">昵称<span class="symbol required"></td>
                                      <td style="width:300px;"><input id="nickname" type="text" ng-model="nick_name" name="nickname" value="{{nick_name}}" class="inputxt" maxlength="10" onkeyup="this.value=this.value.replace(/[@#\$%\^&!()_+-==/\.,~`，;?><。、|—{}【】｛｝；‘’：:\*[]/g,'')"></td>
                                      <td><div class="prompts" style="color:red;display:none;">昵称为2-10个字符</div></td>
                                  </tr>
                                  <tr>
                                      <td>性别</td>
                                      <td>
                                          <input type="radio" value="2" name="gender" id="male" class="pr1"  errormsg="请选择性别！" ng-model="gender">
                                          <label for="male">男</label> <input type="radio" value="1" name="gender" id="femaleb" class="pr1" ng-model="gender">
                                          <label for="female">女</label><input type="radio" value="0" name="gender" id="female" class="pr1" ng-model="gender">
                                          <label for="female">保密</label>
                                      </td>
                                      <td><div class=""></div></td>
                                  </tr>
                                  <tr>
                                      <td style="position:relative;">生日<span class="symbol required"></span></td>
                                      <td width="480px" colspan="2">
                                          <!--<input class="vintage" type="text" placeholder="1982" id="yyyy" name="yyyy"  class="form-control"  onkeyup="return ValidateNumber(this,value)">  -->
										  <select  class="month elect-none form-control" name="year1" id="yyyy"></select>
                                          <select class="month elect-none form-control" name="month1" id="mm"></select>
                                          <select class="date elect-none form-control" name="day1" id="dd" ></select>
                                      </td>
                                      <td><div class=""></div></td>
                                  </tr>
                                  <tr>
                                      <td>邮箱</td>
                                      <td class="hasfa" ng-if="data.is_email_binding == 0">您还没有绑定邮箱 <a href="javascript:void(0);" style=" text-decoration:none; color: #3b85d1" ng-click="emailBind()">立即绑定</a></td>
                                      <td ng-if="data.is_email_binding != 0" ><input style="border:none;" id="email" type="text" maxlength="25" value="" name="email" class="inputxt"  ignore="ignore" nullmsg="请输入您常用的邮箱！"  errormsg="请输入您常用的邮箱！" ng-model="email" readonly="readonly"></td>
                                      <td><div class="promptEmail" style="color:green;display:none;">邮箱不可修改</div></td>
                                  </tr>
                                  <tr>
                                      <td>手机</td>
                                      <td class="hasfa" ng-if="data.is_validated_by_mobile == 0||data.is_validated_by_mobile == 2">您还没有绑定手机号码 <a href="#" style=" text-decoration:none; color: #3b85d1" ng-click="mobileBind()">立即绑定</a></td>
                                      <td ng-if="data.is_validated_by_mobile == 1" ><input id="mobile_phone" type="text" maxlength="11" value="" name="mobile_number" class="inputxt" ng-disabled="true"  errormsg="输入的手机号码有误！" ng-model="mobile_number" ></td>
                                      <td><div class=""></div></td>
                                  </tr>
                                  <tr>
                                      <td>住宅电话</td>
                                   	  <td><input id="home_phone" type=text value="" name="home_phone"  class="inputxt"  ng-model="home_phone" maxlength="13"></td>
                                      <td><div class="promptPhone" style="color:red;display:none;">住宅电话只能输入数字和"-"</div></td>
                                  </tr>
                                  <tr>
                                      <td>所在地<span class="symbol required"></span></td>
                                      <td width="480px" colspan="3">
                                          <select id="seachprov" name="s_province" class="form-control date  elect-none"  placeholder="省"  onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"> </select>                                      
                                          <select id="seachcity" name="s_city" class="form-control date  elect-none" placeholder="市" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"> </select>                                      
                                          <select id="seachdistrict" name="s_county" class="form-control date  elect-none" placeholder="县/区"> </select>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>邮编</td>
                                      <td><input id="zip_code" type="text" value="" name="zip_code" class="inputxt"  ng-model="zip_code"  maxlength="6"></td>
                                      <td><div class="promptCode" style="color:red;display:none;">邮编格式不正确</div></td>
                                  </tr>
                                  </tbody>
                              </table>
                                  <div class="xieyia">
                                     <!-- <p>点击保存，表示您同意设计家的<a href="#" style=" text-decoration:none; color: #3b85d1">政策和条款。</a></p>-->
                                  </div>
                                  <div class="renewal">
                                      <button  class="renewalbut NewBtn btn-primarySubmit" type="submit">保存</button>
                                  </div>
                          </div>
                      </form>
                      <!-- 
                      <div class="formouptright" style="margin-left: 100px;" ng-if="none" >
                          <div class="uploadphotos">照片上传</div>
                          <div class="fileuploa">
                              <div class="thumbnail" id="preview"><img src="${baseUrl}/images/userCenter/edit_avatar_03.png"></div>
                              <div class="userbuttons">
                                        <span class="btn-file">
                                            <span class="fileuploanew">编辑头像</span>
                                            <input id="photoimg" type="file" name="avatar" onchange="previewImage(this)">
                                            <span class="fileup-exists"><i class="fa fa-picture"></i> 储存</span>
                                        </span>
                                  <a href="#" class="light-grey" data-dismiss="fileupload">
                                     <i class="fa fa-times"></i> 取消
                                  </a>
                              </div>
                          </div>
                      </div> -->
                  </div>
                  <!-- edit_personal_information end-->
              </div>
              <div id="tab4" class="tab_content" style="display: none; ">
                  <form class="avatar-form" name="form" id="form" role="form" enctype="multipart/form-data"  method="post" action="${baseUrl}/user/uploadAvatar" style="margin-top: 30px;" >
                      <div class="editleft">
                          <div id="uploadImg" class="avatar-upload avatarwen avatarbj">
                          	  <input class="avatar-data" name="avatar_data" id="avatar_data" type="hidden">
                              <input class="avatar-input" id="file" name="avatar_file" type="file" ng-model="avatar">
                              <a for="avatarInput">选择您要上传的头像</a>
                          </div>
                          <div>
                              <div class="avatarwen woadap"><p>仅支持JPG/BMP/PNG/GIF格式，文件小于5M</p></div>
                              <div class="editheader avatar-wrapper">
                                  <span ng-if="data.avatar == ''"><img src="${baseUrl}/images/userCenter/edit_avatar_03.png"/></span>
                                  <!--<span class="datvtar" ng-if="data.avatar != ''"><img ng-src="{{data.avatar}}"/></span>-->
                              </div>
                              <img id="case_edit_loader" width="32" height="32" src="${baseUrl}/images/global/LoadingCursor2.gif" style="float:left;" />
                              <button class="avatarwen avatarbj adaswid NewBtn btn-primarySubmit"  type="button" id="btnSubmit" onclick="formSubmit_add()">保存上传</button>
                          </div>
                      </div>
                      <div class="editright">
                          <div class="avatarwen tishiona"><p>拖拽拾取框，选择要截取的图片位置和大小</p></div>
                          <div class="avatarwen tadaased"><p>以下头像预览，照片将自动生成4种尺寸，请注意小尺寸头像是否清晰</p></div>
                          <div class="headerlb">
                              <span class="avatarto avatar-preview preview-lg" ng-if="data.avatar == ''"><img src="${baseUrl}/images/userCenter/edit_avatar_03.png"/></span>
                              <span class="avatarto avatar-preview preview-lg" ng-if="data.avatar != ''"><img ng-src="{{data.avatar}}"/></span>
                              <i>200*200</i>
                          </div>
                          <ul style="margin-top: 40px;">
                              <li class="imga1 avatar-preview preview-lg" style="margin-left: 0px;" ng-if="data.avatar == ''"><img src="${baseUrl}/images/userCenter/edit_avatar_03.png"/></li>
                              <li class="imga1 avatar-preview preview-lg" style="margin-left: 0px;" ng-if="data.avatar != ''"><img ng-src="{{data.avatar}}"/></li>
                              <li class="imga2 avatar-preview preview-lg" ng-if="data.avatar == ''"><img src="${baseUrl}/images/userCenter/edit_avatar_03.png"/></li>
                              <li class="imga2 avatar-preview preview-lg" ng-if="data.avatar != ''"><img ng-src="{{data.avatar}}"/></li>
                              <li class="imga3 avatar-preview preview-lg" ng-if="data.avatar == ''"><img src="${baseUrl}/images/userCenter/edit_avatar_03.png"/></li>
                              <li class="imga3 avatar-preview preview-lg" ng-if="data.avatar != ''"><img ng-src="{{data.avatar}}"/></li>
                          </ul>
                          <ul class="measure">
                              <li class="imga1"><i>100*100</i></li>
                              <li class="imga2"><i>70*70</i></li>
                              <li class="imga3"><i>30*30</i></li>
                          </ul>
                      </div>
                  </form>
              </div>
          </div>
      </div>
  </div>
    <script language="javascript" src="${baseUrl}/js/userCenter/YMDClass.js"></script>
  
    <script src="${baseUrl}/js/userCenter/cropper.min.js"></script>
    <script src="${baseUrl}/js/userCenter/sitelogo.js"></script>

  <script type="text/javascript">
      new YMDselect('year1','month1','day1'); 
      $(document).ready(function() {
          //Default Action
          $(".tab_content").hide(); //Hide all content
          $("ul.tabs li:first").addClass("active").show(); //Activate first tab
          $(".tab_content:first").show(); //Show first tab content

          //On Click Event
          $("ul.tabs li").click(function() {
              $("ul.tabs li").removeClass("active"); //Remove any "active" class
              $(this).addClass("active"); //Add "active" class to selected tab
              $(".tab_content").hide(); //Hide all tab content
              var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
              $(activeTab).fadeIn(); //Fade in the active content
              return false;
          });
      });
  </script>
 <!-- <script type="text/javascript" src="${baseUrl}/js/userCenter/Validform.js"></script>
 <script type="text/javascript" src="${baseUrl}/js/userCenter/tietolomake.js"></script> -->
  <script src="${baseUrl}/js/userCenter/area.js" type="text/javascript"></script>
  <script type="text/javascript" src="${baseUrl}/js/userCenter/Picture_upload.js"></script>
  	<script src="${baseUrl}/js/userCenter/personalinformation.js"></script>
  
  <script>_init_area();</script>
  <script>
		  //普通js function 
		function ValidateNumber(e, pnumber)
		{
		    if (!/^\d+$/.test(pnumber))
		    {
		        var newValue =/^\d+/.exec(e.value);         
		        if (newValue != null)         
		        {             
		            e.value = newValue;        
		        }      
		        else     
		        {          
		            e.value = "";    
		        } 
		    }
		    return false;
		}
		function ValidateFloat(e, pnumber)
		{
		if (!/^\d+[.]?\d*$/.test(pnumber))
		{
		    var newValue = /^\d+[.]?\d*/.exec(e.value);         
		    if (newValue != null)         
		    {             
		        e.value = newValue;        
		    }      
		    else     
		    {          
		        e.value = "";    
		    } 
		}
		return false;
		}
		
		function getUrlParam(name) {
			var reg = new RegExp("[\?\]"+name+"=([^\/]*)(\/?)","i");
            var r = window.location.href.substr(1).match(reg); 
            if (r != null) return unescape(r[1]); return null;
		};
		
		$(function() {
			if(getUrlParam('act') && getUrlParam('act') == 'success') {
				alert('头像上传成功！');
			}
			
			if(getUrlParam('act') && getUrlParam('act') == 'error') {
				alert('头像上传失败！');
			}
			
			$('#case_edit_loader').hide();
		});
		
		function formSubmit_add(){
		/*
			if(ckImgSize == false){
				alert("图片大小不能小于截图框");
				return false;
			
			}
			*/				
			$('#case_loader').show();
			var fileSize;
			if(file.value == null || file.value.length <=0){
				alert("请选择图档!");
				return;
			}
			else{
				fileSize = file.files[0].size / 1024 / 1024;
			
			}
			
		    if(fileSize > 5) {
		    	alert("图档大于5M，请选择小于5M的图档");
		    	return false;
		    }
		    else{
				$("#btnSubmit").attr("disabled", "disabled");
				document.getElementById("form").submit();
			}
		}
  </script>
  <#include '/common/footer.html'/>
</body>
</html>

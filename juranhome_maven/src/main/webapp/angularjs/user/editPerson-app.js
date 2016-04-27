'use strict';
var app = angular.module('app', ['appService', 'helper' ]);
//seo controller
app.controller('seoCtrl',function($scope){
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
	
});
// main controller
app.controller('ctrl', function($scope,indexService ,userCenterService, $http,$rootScope,messageService) {
	$scope.editMemberMessage = function(){
  	  $('#loadingMask').css({'display':'block'});
  	 
		  //----------------------
	      var postData = {
	       nick_name : $scope.nick_name,
	       gender : $scope.gender,
	       email : $scope.email,
	       mobile_number : $scope.mobile_number,
	       province : $("#seachprov").val(),
	       city : $("#seachcity").val(),
	       district : $("#seachdistrict").val(),
	       hitachi_account : $scope.hitachi_account,
	       yyyy : $('#yyyy').val(),
	       mm : $('#mm').val(),
	       dd : $('#dd').val(),
	       home_phone : $scope.home_phone,
	       zip_code : $scope.zip_code,
	       province_name:$("#seachprov").find("option:selected").text(),
		   city_name:$("#seachcity").find("option:selected").text(),
		   district_name:$("#seachdistrict").find("option:selected").text() == "区" ? "none" : $("#seachdistrict").find("option:selected").text()
	      
	      };
	      userCenterService.editMemberMessage(postData).success(function(r) {
	    	  if (r.status < 400) {
	    		  var dataBase64 = $.base64.decode(decodeURIComponent(getCookie("users")).replace(/(\s*)/g, ""),'utf-8');
	    		  var cookie = JSON.parse(dataBase64);
	    		  cookie.user_name = $scope.nick_name;
	    		  var newCookie = Base64.encode(JSON.stringify(cookie));
	    		  $.cookie('users', newCookie, { expires: 7, path: '/' });
	    		  alert("更新成功");
	    		  location.reload();
	    	  }
	    	  else{
	    		  alert("更新失败");
	    	  }
	    	  $('#loadingMask').css({'display':'none'});
	      });
    }
	
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
	
	// get member msg
	var data = {};
	$('#loadingMask').css({'display':'block'});
	userCenterService.getMemberMessage(data).success(function(r) { // get
		if (r.status < 400) {
			$scope.data = r;
			$scope.hitachi_account = r.hitachi_account;
			$scope.nick_name = r.nick_name;
			$scope.gender = r.gender ;
			$scope.birthday = r.birthday;
			$scope.email = r.email;
			$scope.mobile_number=r.mobile_number;
			$scope.home_phone = r.home_phone;
			$scope.zip_code = r.zip_code;
			var birth = r.birthday.split("-");
			var yyyy = eval("birth[0]");
			var mm = eval("birth[1]");
			var dd = eval("birth[2]");
			var str_mm = mm.substring(0,1);
			var str_dd = dd.substring(0,1);
			if(str_mm == 0){
				mm = mm.substring(1,2);
			}
			if(str_dd == 0){
				dd = dd.substring(1,2);
			}
			if(yyyy>1000){
				$('#yyyy').val(yyyy).trigger('change');
				$('#mm').val(mm).trigger('change');
				$('#dd').val(dd);
			}
			if(r.province>0&&r.city>0&&r.district){
				$('#seachprov').val(r.province).trigger('change');
				$('#seachcity').val(r.city).trigger('change');
				$('#seachdistrict').val(r.district);
			}
			// init preview
			//$('.avatar-preview').empty().html('<img src="' + r.avatar + '">');
		}
		
		$('#loadingMask').css({'display':'none'});
	});
	
	// upload head img
	
	$scope.uploadHeadImg = function(){
		//alert("click");
		  $('#loadingMask').css({'display':'block'});
		  var postData={
				  avatar_file : $scope.avatar,
		  };
		  var promise = postMultipart(baseUrl+'/user/uploadAvatar', postData);
	      function postMultipart(url, data) {
	    	  //alert(url+" , "+data);
	        var fd = new FormData();
	        angular.forEach(data, function(val, key) {
	          fd.append(key, val);
	        });
	        var args = {
	          method: 'POST',
	          url: url,
	          data: fd,
	          headers: {'Content-Type': undefined},
	          transformRequest: angular.identity
	        };
	        $('#loadingMask').css({'display':'none'});
	        return $http(args);
	      }
	      promise.success(function(r) {
	    	  if (r.status < 400) {
	    		  alert("更新成功");
	    	  }
	    	  else{
	    		  alert("更新失败");
	    	  }
	    	  location.reload();
	      });
	}
	
	$scope.emailBind = function(){
		window.open(baseUrl+"/user/index#/security_center/");
	}
	
	$scope.mobileBind = function(){
		window.open(baseUrl+"/user/index#/security_center/");
	}
});


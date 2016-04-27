var app = angular.module('app', ['helper']);

app.controller('ctrl', function($scope, $http, userService) {
	$scope.userRegisteType=1;
	$scope.Registe=function(e){
		$scope.userRegisteType=e;
	}
	
	
	$scope.Captcha=function(){
		var phone= $scope.phone;
		//alert(phone);
		var data={
				phone:phone,
				type:0,
		};
		//create captcha
		userService.captchaResponse(data).success(function(r){
			if(r){
				//alert("captcha r "+r);
			}
		});
	}
	
	
	$scope.blur=function(){
		var phone= $scope.phone;
		var data={
				phone:phone,
		};
		
		userService.verifyPhoneResponse (data).success(function(r){
			if(r){
				//alert("verifyPhone r "+r);
			}
		});
	}
	
	
    $scope.submit = function(evt) {
    	
    	var phone= $scope.phone;
    	var name=$scope.name;
    	var pwd= $scope.password;
    	var type=$scope.userRegisteType;
    	var captcha=$scope.captcha;
    	var data={
			phone:phone,
			userName:name,
			password:pwd,
			captcha:captcha,
			type:type,
			captcha:captcha,
    	};
    	
    	//processing register 
    	userService.registeResponse(data).success(function(r){
    		if(r){
    			location.href = "/juranhome/login/index";
    		}
    	});
    }
});
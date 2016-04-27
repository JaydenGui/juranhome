var app = angular.module('app', ['helper']);
app.controller('ctrl', function($scope, $http,userService) {
	$scope.isError=2;
	$scope.userLoginType=1;
   // $scope.msg = Message.init();
	//login form submission event 
	$scope.Login=function(e){
		$scope.userLoginType=e;
	}
    $scope.submit = function(evt) {
    	
    	var phone= $scope.phone;
    	var pwd= $scope.password;
    	var type=$scope.userLoginType;
    	var rememberPwd=$scope.rememberPwd;
    	var data={
			username:phone,
			password:pwd,
			type:type,
			rememberPwd:rememberPwd
    	};
    	
    	
    	//processing login 
    	userService.loginResponse(data).success(function(r){
    		if(r.status<400){
    			if(r.member_type=="member"){
        			location.href =baseUrl+"/";
        		}else{
        			location.href = baseUrl+"/mark/index";
        		}
    		}else{
    			$scope.isError=1;
    		}
    	});
    }
});



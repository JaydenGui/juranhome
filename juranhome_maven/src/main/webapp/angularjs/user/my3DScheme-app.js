'use strict';
var app = angular.module('app', ['appService', 'helper' ]);
//seo controller
app.controller('seoCtrl',function($scope){
	
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
	
});

// main controller
app.controller('ctrl', function($scope,schemeService,$filter,$http,messageService) {
	var needsid=$filter('getQueryString')("needsid");
	var assetid=$filter('getQueryString')("assetid");
	
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================

	$scope.schemeList=[];
	$scope.needs_id=needsid;
	$scope.asset_id=assetid;
	
	var data={
	   needs_id:needsid,
	   asset_id:assetid,
	}
	
	schemeService.get3DAssetFile(data).success(function(r) {
		if (r.status < 400) {
			$scope.schemeList = r;
		}
	});
	
	$scope.saveUpload=function(){
		 var promise = postMultipart(baseUrl+'/3Dscheme/uploadFile3DAsset', data);
	      function postMultipart(url, data) {
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
	    	  location.reload();
	      });
     }
});
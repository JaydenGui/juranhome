'use strict';
var app = angular.module('app', [ 'appService', 'helper' ]);
// seo controller
app.controller('seoCtrl', function($scope, indexService) {

	$scope.title = "设计家在线设计平台";
	$scope.keywords = "设计家在线设计平台";
	$scope.description = "设计家在线设计平台";

});
// main controller
app.controller('ctrl', function($scope, $filter,messageService, indexService,designerService, userCenterService) {
	
	$scope.userType=true;
	// 获取页面utl参数
	// alert($filter('getQueryString')("type"));
	$scope.banners = [];
	$scope.designers = [];
	// get Banner data
	/*
	 * indexService.getBannerList(data).success(function(r) { if(r){
	 *  } });
	 */

	// get designer data
	function getDesignes(datas) {
		
		$('#loading').css({'display':'block'});
		designerService.getDesignerList(datas).success(function(r) {
			if (r.status < 400) {
				$scope.designers = r.designer_list;
		}else{
		}
			$('#loading').attr({'display':'none'});
		});
	}

	// get the parameters of the designer's data
	function getOptions() {
		var op = {
			page :0,
			pageSize :9
		}
		return op;
	}
	getDesignes(getOptions());
	
	/*var data={};
	userCenterService.getMemberMessage(data).success(function(r) { // get
		// userData
		if (r.status < 400) {
			$scope.contactsname = r.account;
			$scope.contactsmobile = r.mobile_number;
			$scope.data = r;
			$scope.data2 = r.real_name;
			// alert("success!!");
		} else {
			// alert("somthing hava erro");
		}
	});*/

	//====================message start======================
	//$scope.message=messageService;
	//==================message end===================
	
});
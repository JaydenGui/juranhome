'use strict';
var app = angular.module('app', [ 'appService', 'helper' ]);
// seo controller
app.controller('seoCtrl', function($scope, indexService) {

	$scope.title = "设计家在线设计平台";
	$scope.keywords = "设计家在线设计平台";
	$scope.description = "设计家在线设计平台";

});

//main controller
app.controller('ctrl', function($scope, $filter, indexService,designerService, userCenterService) {
	$scope.indexDesigner=[];
	/*indexService.getIndexDesigner().success(function(r){
		if(r.status<400){
			$scope.indexDesigner=r.designer_list;

		}else{
		}
	});*/
});
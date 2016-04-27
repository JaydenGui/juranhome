'use strict';
var app = angular.module('app', ['ngRoute', 'appService', 'helper']);
//seo controller
app.controller('seoCtrl',function($scope){
	
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
	
});
// main controller
app.controller('ctrl', function($scope,page,caseService,$filter,messageService) {
	
	$scope.userType=true;
	$scope.caseLsit=[];
	$scope.page = page.init();
	$scope.conf={};
	$scope.count="";
		//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
	//定义翻页的方法
	$scope.page.set_val('go_page', function(page) {
		var data = getOptions();
		data.page = data.pageSize*(page-1);
		getSearchList(data);
	})
	
	function getOptions() {
		var op = {
			spaces: $scope.search.spaces,
			layouts:$scope.search.layouts,
			styles: $scope.search.styles,
			keyWord: $filter('getQueryString')("keyWord"),
			page:0,
			pageSize:12
		}
		return op;
	}
	
	// search
	$scope.search={
			
		spaces:'',
		layouts:'',
		styles:'',
		space:function(space){
			$scope.conf={};
			$scope.search.spaces=space;
			var data=getOptions();
			getSearchList(data);
		},
		layout:function(layout){
			$scope.conf={};
			$scope.search.layouts=layout;
			var data=getOptions();
			getSearchList(data);
		},
		style:function(style){
			$scope.conf={};
			$scope.search.styles=style;
			var data=getOptions();
			getSearchList(data);
		}
	}
	function getSearchList(data){
		$('#loading').css({'display':'block'});
		  caseService.searchCase(data).success(function(r) { 
			  if(r.status<400){
					$scope.caseLsit=r.cases;
				    $scope.conf = {
					   currentPage:r.offset+1,
					   totalItems:r.count,
					   itemsPerPage:12,
					};
				    if(r.count<=0){
				    	$('#noMatch').css({'display':'block'});
				    }else{
				    	$('#noMatch').css({'display':'none'});
				    }
			  };
			  $('#loading').css({'display':'none'});
			  
		  });
	}
	getSearchList(getOptions());
});


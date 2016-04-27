'use strict';
var app = angular.module('app', ['appService', 'helper']);
//seo controller
app.controller('seoCtrl',function($scope,indexService){
	
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
	
});
// main controller
app.controller('ctrl', function($scope,designerService,page,messageService) {
	
	$scope.userType=true;
	$scope.designerlist=[];
	$scope.page = page.init();
	
	$scope.conf={};
		
		//定义翻页的方法
		$scope.page.set_val('go_page', function(page) {
			var data = getOptions();
			data.page =data.pageSize*(page-1);
			getList(data);
	 });
	
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
		
	function getList(data){
		$('#loading').css({'display':'block'});
		designerService.getDesignerList(data).success(function(r){
			if(r.status<400){
				$scope.designerlist=r.designer_list;
				$scope.conf = {
				   currentPage:r.offset+1,
				   totalItems:r.count,
				   itemsPerPage:12,
				};
				$('#loading').css({'display':'none'});
			}else{
				$('#loading').attr({'display':'none'});
			}
		});
	}
	
	
	function getOptions() {
		var op = {
			cityName: $scope.search.citys,
			spaceName: $scope.search.spaces,
			costName:$scope.search.costs,
			designerDetail:$scope.search.details,
			page:0,
			pageSize:12
		}
		return op;
	}
	//search
	$scope.search={
		citys:"",
		spaces:"",
		costs:"",
		details:"",
		city: function(city) {
			$scope.search.citys=city;
			var data=getOptions();
			getList(data);
		},
		space:function(space){
			$scope.search.spaces=space;
			var data=getOptions();
			getList(data);
		},
		cost:function(cost){
			$scope.search.costs=cost;
			var data=getOptions();
			getList(data);
		},
		detail:function(detail){
			$scope.search.details = detail;
			var detailData = getOptions();
			getDetail(detailData);
		}
	}
	
	getList(getOptions());
});
var app = angular.module('app', ['appService', 'helper']);
//seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
});
//body controller
app.controller('ctrl', function($scope,caseService,$filter,designerService,orderService,userCenterService,messageService){
	
	$scope.userInfo=[];
	$scope.caseDetail=[];
	$scope.needsList=[];
	$scope.needsDetails=[];
	
	var case_id=$filter('getQueryString')("caseid");
	var designeid=$filter('getQueryString')("designeid");
	
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
	

	//Get designer information according to designer ID 
	/*designerService.getDesignerInfo({designer_id:designeid}).success(function(r) {
		if (r.status<400) {
			$scope.userInfo=r;
		}
	});*/
	
	//get case info 
	caseService.getCaseDetail({case_id:case_id}).success(function(r) {
		if (r.status<400) {
			console.log(r);
			$scope.caseDetail=r;
		}
	});
	
	//get needs list
	orderService.getMyOrederList({page:0,pageSize:20,status:'success'}).success(function(r){
		if(r.status<400){
			$scope.needsList=r.needs_list;
		}
	});
	
	
	//get  needs  detail
	$scope.needsDetail=function(needs_id){
		var datas={};
		var datas={
		   needs_id:needs_id
		};
		orderService.getmybiddetail(datas).success(function(r){
			if(r.status<400){
				console.log(r);
				$scope.detail = r;
			}
		});
	};
	
	//Release requirements 
	$scope.selectTa=function(){
		
		var contactsname = $scope.contactsname;
		var phone=$scope.phone;
		var housetype = $scope.housetype;
		var housearea = $scope.housearea;
		var budget = $scope.budget;
		var style = $scope.style;
		var provincename = $scope.province;
		var cityname = $scope.city;
		var address = $scope.address;

		var room = $scope.room;
		var livingroom = $scope.livingroom;
		var bathroomCountreq = $scope.bathroomCountreq;
		var time = $scope.time;
		
		var data = {
				contactsname : contactsname,
				housetype : housetype,
				contactsmobile : contactsmobile,
				housearea : housearea,
				renovationbudget : renovationbudget,
				renovationstyle : renovationstyle,
				provincename : provincename,
				cityname : cityname,
				districtname : districtname,
				neighbourhoods : neighbourhoods,
				roomtype : roomtype,
				imgurl : imgurl,
				room : room,
				livingroom : livingroom,
				toilet : toilet,
				img_url : img_url,
		}
		userCenterService.publishDemand(data).success(function(r) {
			if(r.status<400){
				alert("发布成功！");			
			}else{
			    alert("发布失败！");	
			}
		});
	};
	
});

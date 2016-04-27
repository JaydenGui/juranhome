'use strict';
var app = angular.module('app', ['appService', 'helper' ]);
//seo controller
app.controller('seoCtrl',function($scope){
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
	
});
// main controller
app.controller('ctrl', function($scope,indexService ,userCenterService,messageService ) {
	var data = {};
	$scope.contactsmobile=null;
	userCenterService.getMemberMessage(data).success(function(r) { // get
		// userData
		if (r.status < 400) {
			$scope.contactsname = r.nick_name;
			$scope.nickName = r.nick_name;
			$scope.gender = r.gender ;
			$scope.location = r.address;
			$scope.contactsmobile = r.mobile_number;
		} 
		
	});
		
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
	
	$scope.submit = function() {// publish user demand
		
		var root = $('div.modal-content');
		var loadingMask = $('div.loadingMask');
		var contactsname = $scope.contactsname;
		
		
		if(!contactsname)
		{
			//alert(1-1);
			root.find('#pro-name').focus();
			//root.find('#pro-name').attr('style', 'border: 1px red solid');
			return false;
		}
		var contactsmobile = $scope.contactsmobile;
		//alert(contactsmobile);
		if(!contactsmobile)
		{
			root.find('#phone').focus();
			//root.find('#firstname').attr('style', 'border: 1px red solid');
			return false;
		}
		var housetype = $scope.housetype;
		//alert(housetype);
		if(!housetype)
		{
			root.find('#dd').focus();
			//root.find('#dd').attr('style', 'border: 1px red solid');
			return false;
		}
		//alert("housearea");
		var housearea = $scope.housearea;
		if(!housearea)
		{
			root.find('#h_mesure').focus();
			//root.find('#h_mesure').attr('style', 'border: 1px red solid');
			return false;
		}
		//alert("decoration_budget")
		var decoration_budget = $scope.decoration_budget;
		if(!decoration_budget)
		{
			root.find('#decoration_budget').focus();
			//root.find('#money').attr('style', 'border: 1px red solid');
			return false;
		}
		var renovationstyle = $scope.decoration_style;
		if(!renovationstyle)
		{
			root.find('#renovationStylereq').focus();
			//root.find('#renovationStylereq').attr('style', 'border: 1px red solid');
			return false;
		}
		var provincename = $scope.province;
		if(!provincename)
		{
			root.find('#s_province').focus();
			//root.find('#s_province').attr('style', 'border: 1px red solid');
			return false;
		}
		var cityname = $scope.city;
		if(!cityname)
		{
			root.find('#s_city').focus();
			//root.find('#s_city').attr('style', 'border: 1px red solid');
			return false;
		}
		var districtname = $('#seachdistrict').val();
		if(districtname==undefined)
		{
			districtname=0;
		}
		var neighbourhoods = $scope.community_name;
		if(!neighbourhoods)
		{
			root.find('#house-name').focus();
			//root.find('#house-name').attr('style', 'border: 1px red solid');
			return false;
		}
		var room = $scope.room;
		if(!room)
		{
			root.find('#room').focus();
			//root.find('#room').attr('style', 'border: 1px red solid');
			return false;
		}
		var livingroom = $scope.livingroom;
		if(!livingroom)
		{
			root.find('#livingroomCountreq').focus();
			//root.find('#livingroomCountreq').attr('style', 'border: 1px red solid');
			return false;
		}
		var toilet = $scope.toilet;
		if(!toilet)
		{
			root.find('#bathroomCountreq').focus();
			//root.find('#bathroomCountreq').attr('style', 'border: 1px red solid');
			return false;
		}
		var design_budget = $scope.design_budget;
		if(!design_budget)
		{
			root.find('#design_budget').focus();
			return false;
		}
		var data = {
				contactsname : contactsname,
				housetype : housetype,
				contactsmobile : contactsmobile,
				housearea : housearea,
				decoration_budget : decoration_budget,
				decoration_style : renovationstyle,
				provincename : provincename,
				cityname : cityname,
				districtname : districtname,
				community_name : neighbourhoods,
				room : room,
				livingroom : livingroom,
				toilet : toilet,
				design_budget : design_budget,
				
				province_name:$("#seachprov").find("option:selected").text(),
				city_name:$("#seachcity").find("option:selected").text(),
				district_name:$("#seachdistrict").find("option:selected").text() == "区" ? "none" : $("#seachdistrict").find("option:selected").text()
		}
		$("#loadingMask").attr('style', 'display:block');
		indexService.publishDemand(data).success(function(r) {
			if(r.status<400){
				alert("发布成功!");

				location.href = baseUrl+"/user/index#/myorder/";
			}
			else{
				alert("somthing hava error, error code : "+r.status);
				}
			$("#loadingMask").attr('style', 'display:none');
		});
	}
	 
});
var app = angular.module('app', ['appService', 'helper']);
//seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
});
//body controller
app.controller('ctrl', function($scope,caseService,$filter,designerService,orderService,userCenterService,memberService,messageService,page){
	//alert("designerCase");
	$scope.userInfo=[];
	$scope.caseDetail=[];
	$scope.needsList=[];
	$scope.needsDetails=[];
	$scope.designerInfo=[];
	$scope.realname=[];
	$scope.page = page.init();
	$scope.conf={};
	var case_id=$filter('getQueryString')("caseid");
	var designeid=$filter('getQueryString')("designeid");
	
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
	//Get designer information 
	designerService.getDesignerInfo({designer_id:designeid,uid:""}).success(function(r) { //get userData
			if (r.status<400) {
				//console.log(r);
				$scope.designerInfo = r;
			}
	 });

	//get designer add case list
	function getCaseList(data){
		$('#loadingMask').css({'display':'block'});
		designerService.getDesignerCaseList(data).success(function(r) {
			if (r.status < 400) {
				$scope.List = r;

				$scope.caseList = r.cases;
				$scope.conf = {
					    currentPage:r.offset+1,
					    totalItems:r.count,
					    itemsPerPage:11,
					};
			} 
			$('#loadingMask').css({'display':'none'});
		});
	}
	

	//定义翻页的方法
	$scope.page.set_val('go_page', function(page) {
			var data = getOptions();
			data.page =data.pageSize*(page-1);
			getCaseList(data);
	 });
	
	function getOptions() {
		var op = {
			page:0,
			pageSize:11
		}
		return op;
	}
	
	getCaseList(getOptions());
	
	//get  needs  detail
	$scope.needsDetail=function(needs_id){
		var datas={};
		var datas={
		   needs_id:needs_id
		};
		userCenterService.getMemberDemandList(datas).success(function(r){
			if(r.status<400){
				console.log(r);
				$scope.detail = r;
				
			}
		});
	};
	
	
	$scope.Ta=function(){
		//get needs list
		$('#poploading').css({'display':'block'});
		orderService.getMyOrederList({page:0,pageSize:20,status:'success'}).success(function(r){
			if(r.status<400){
				$scope.needsList=r.needs_list;
			}
			$('#poploading').css({'display':'none'});
		});
	};
	
	
	//Release requirements 
	$scope.selectTa=function(){
		
		var contactsname = $scope.detail.contacts_name;
	
		var phone=$scope.detail.contacts_mobile;
		
		var housetype = $scope.detail.house_type;
		var housearea = $scope.detail.house_area;
		
		var budget = $scope.detail.renovation_budget;
		var style = $scope.detail.renovation_style;
		
		var province = $scope.detail.province;
		var city = $scope.detail.city;
		
		var address = $scope.detail.neighbourhoods;
		var room = $scope.detail.room;
		
		var livingroom = $scope.detail.living_room;
		var bathroomCountreq = $scope.detail.toilet;
		var time = $scope.time;
		
		var data = {
				contactsname : contactsname,
				housetype : housetype,
				phone : phone,
				housearea : housearea,
				budget : budget,
				style : style,
				province : province,
				city : city,
				address : address,
				room : room,
				livingroom : livingroom,
				bathroomCountreq : bathroomCountreq,
				time:$filter('date')(time,'medium'),
				designe_id:designeid,
				amount:designerInfo.designer.measure_price
		}
		
		orderService.customDesigner(data).success(function(r) {
			if(r.status<400){
				alert("操作成功！");
			}else{
			    alert("操作失败！");	
			}
		});
	};
	
	//Theme designer switch 
	$scope.skinPeeler=function(){
		var pic_index=$("#pic_index").val();
		designerService.skinPeeler({pic_index:pic_index}).success(function(r) {
			if(r.status<400){
				//alert("操作成功！");
			}else{
			    //alert("操作失败！");	
			}
		});
	}
	
	$scope.caseDetail = function(id,status){
		window.open(baseUrl+"/mark/addCase/caseid/"+id+"/status/"+status+"/");
	}
	
	$scope.editDetail = function(id,status,result){
		$scope.id=id;
		$scope.status=status;
		$scope.result=result;
	}
	$scope.gotoauthentication = function(id,status){
		window.open(baseUrl+"/mark/addCase/caseid/"+id+"/status/"+status+"/");
	}

});

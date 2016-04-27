var app = angular.module('app', [ 'appService', 'helper' ]);

// seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
});
// body controller
app.controller('ctrl', function($scope, markHallService, userCenterService,memberService,
		designerService, page,messageService) {
	$scope.show=0;
	
	$scope.needdetail=false;
	$scope.needList = [];
	$scope.detail = [];
	$scope.mark_id = "";
	$scope.page = page.init();
	$scope.conf = {};
	
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================

	// Defines the methods of pages
	$scope.page.set_val('go_page', function(page) {
		var data = getOptions();
		data.page = data.pageSize * (page - 1);
		getList(data);
	})
	function getList(data) {
		$('.loading').css({'display':'block'});
		markHallService.getDesigneMarkNeeds(data).success(function(r) {
			if (r.status < 400) {
				$scope.needList = r.needs_list;
				$scope.conf = {
					currentPage : r.offset + 1,
					totalItems : r.count,
					itemsPerPage : 12
				};
			}$('.loading').css({'display':'none'});
		});
	}
	function getOptions() {
		var op = {
			page : 0,
			pageSize : 12,
			spaces: $scope.spaces,
			layouts:$scope.layouts,
			styles: $scope.styles
		}
		return op;
	}
	getList(getOptions());

//	// get need detail
//	$scope.needDetail = function(needs_id,status) {
//		$scope.status=status;
//		var data = {
//			needs_id : needs_id,
//		};
//		// get my order detail
//		$('.poploading').css({'display':'block'});
//		userCenterService.getMemberDemandList(data).success(function(r) {
//			if (r.status < 400) {
//				$scope.detail = r;
//			}
//			var data = {};
//			$('.poploading').css({'display':'none'});
//		});
//	}
	$scope.gotoGetOrder = function(needs_id) {
		
			var data = {
					needs_id : needs_id,
				};
				// get my order detail
				$('.poploading').css({'display':'block'});
				userCenterService.getMemberDemandList(data).success(function(r) {
					if (r.status < 400) {
						$scope.detail = r;
					}
					var data = {};
					$('.poploading').css({'display':'none'});
				});			
			$scope.numberCount = "0";
			$scope.markDeckaration = "";
			$scope.mark_id = needs_id;
	}
	// designer mark
	$scope.mark = function(needs_id) {
		$('#loadingMask').css({'display':'block'});
		designerService.getDesignerDetail({}).success(function(r) {
			if (r.status < 400) {
				if (r.designer.is_real_name == 2) {
					if(r.designer.measurement_price<0||r.designer.measurement_price==null){
						alert("未设置量房费   不能应标");
						$("html").css({'overflow':'auto'});
						$('.modal-backdrop').remove();
					}else{
						$scope.show=0;
						var data = {
							needs_id : $scope.mark_id,
							markDeckaration : $scope.markDeckaration
						};
						markHallService.mark(data).success(function(r) {
							if (r.status < 400) {
								//$scope.visible = true;
								alert("应标成功！");
								location.href = baseUrl +"/mark/category";
							} else {
								alert("应标失败！");
								//$scope.visible = false;
							}
						});
					}						
				} else {
						//$scope.isRealname = true;
						$scope.show=1;//显示未实名
					}
			}
			$('#loadingMask').css({'display':'none'});
		});
	}

	$scope.size = function() {
		$scope.numberCount =$scope.markDeckaration.length;
	} 
	
	$scope.gotoauthentication=function(){
		location.href = baseUrl +"/user/authentication";
	}
	
	//search ------------------------
	$scope.search = function(){
		$scope.conf = {};
		var data=getOptions();
		$('#loading').css({'display':'block'});
		markHallService.searchNeeds(data).success(function(r) {
			if (r.status < 400) {
				$scope.needList = r.needs_list;
				$scope.conf = {
					currentPage : r.offset + 1,
					totalItems : r.count,
					itemsPerPage : 12
				};
			}$('.loading').css({'display':'none'});
		});
	}
});


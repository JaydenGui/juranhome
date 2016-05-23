var app = angular.module('app', ['appService', 'helper']);
//seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
});
//body controller
app.controller('ctrl', function($scope,caseService,$filter,designerService,orderService,userCenterService,memberService,messageService){
    
	$scope.userType=true;
	$scope.userInfo=[];
	$scope.caseDetail=[];
	$scope.needsList=[];
	$scope.needsDetails=[];
	$scope.designerInfo=[];
	$scope.realname=[];
	
	var case_id=$filter('getQueryString')("caseid");
	var uid=$filter('getQueryString')("uid");

	//====================message start author shx======================
	//$scope.message=messageService;
	//==================message end===================

	//get case info 
	var caseDetail;
    caseService.getCaseDetail({case_id:case_id}).success(function(r) {
        if (r.status<400) {
            $scope.caseDetail=r;
            caseDetail=r;
        }
    });
	
	
	//get  needs  detail
    var needsDetail;
	$scope.needsDetail=function(needs_id){
		var datas={};
		var datas={
		   needs_id:needs_id
		};
		userCenterService.getMemberDemandList(datas).success(function(r){
			if(r.status<400){
				$scope.contacts_mobile = r.contacts_mobile;
				$scope.house_type = r.house_type;
				$scope.house_area = r.house_area;
				$scope.design_budget = r.design_budget;
				$scope.decoration_budget = r.decoration_budget;
				$scope.decoration_style = r.decoration_style;
				$scope.room = r.room;
				$scope.living_room = r.living_room;
				$scope.toilet = r.toilet;
				$scope.community_name = r.community_name;
				$('#seachprov').val(r.province).trigger('change');
				$('#seachcity').val(r.city).trigger('change');
				$('#seachdistrict').val(r.district);
				$scope.time="";
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
		var pattern = /^1[34578]\d{9}$/;
		var phone=$scope.contacts_mobile;
		if((!phone)||(!pattern.test(phone))){
			$('#phone').attr('style','border: 1px red solid');
			$('#phone').next().text('电话为空或填写有误').removeClass('state1').addClass('state3');
			return ;
		}
		var housetype = $scope.house_type;
		if(!housetype){
			$('#dd').attr('style','border: 1px red solid');
			$('#dd').next().text('请选择房屋类型').removeClass('state1').addClass('state3');
			return ;
		}
		var housearea = $scope.house_area;
		if(!housearea){
			$('#h_mesure').attr('style','border: 1px red solid');
			$('#h_mesure').next().text('面积不能为空').removeClass('state1').addClass('state3');
			return ;
		}
		var budget = $scope.design_budget;
		if(!budget){
			$('#design_budget').attr('style','border: 1px red solid');
			$('#design_budget').next().text('请选择设计预算').removeClass('state1').addClass('state3');
			return ;
		}
		var decoration_budget=$scope.decoration_budget;
		if(!decoration_budget){
			$('#Decoratebudget').attr('style','border: 1px red solid');
			$('#Decoratebudget').next().text('请选择装修预算').removeClass('state1').addClass('state3');
			return ;
		}
		var style = $scope.decoration_style;
		if(!style){
			$('#renovationStylereq').attr('style','border: 1px red solid');
			$('#renovationStylereq').next().text('请选择风格').removeClass('state1').addClass('state3');
			return ;
		}
		var room = $scope.room;
		if(!room){
			$('#room').attr('style','border: 1px red solid');
			$('#room').next().text('请选择户型').removeClass('state1').addClass('state3');
			return ;
		}
		var livingroom = $scope.living_room;
		if(!livingroom){
			$('#livingroomCountreq').attr('style','border: 1px red solid');
			$('#livingroomCountreq').next().text('请选择户型').removeClass('state1 state4').addClass('state3');
			return ;
		}
		var bathroomCountreq = $scope.toilet;
		if(!bathroomCountreq){
			$('#bathroomCountreq').attr('style','border: 1px red solid');
			$('#bathroomCountreq').next().text('请选择户型').removeClass('state1 state4').addClass('state3');
			return ;
		}
		var province=$("#seachprov").val();
		if(province<=0){
			$('#seachprov').attr('style','border: 1px red solid');
			$('#seachprov').next().text('请选择省').removeClass('state1').addClass('state3');
			return ;
		}
	    var city=$("#seachcity").val();
	    if(city<=0){
			$('#seachcity').attr('style','border: 1px red solid');
			$('#seachcity').next().text('请选择市').removeClass('state1').removeClass('state4').addClass('state3');
			return ;
		}
	    var districtCount=document.getElementById("seachdistrict").options.length;
		var district="";
		if(districtCount<=1)
    	{
			district=0;
    	}
    	else
    	{
    		if(document.getElementById("seachdistrict").selectedIndex > 0){
    			district=$("#seachdistrict").val();
    		}else{
    			$('#seachdistrict').attr('style','border: 1px red solid');
    			$('#seachdistrict').next().text('请选择区').removeClass('state1').removeClass('state4').addClass('state3');
    			return ;
    		}
    	}
		var address = $scope.community_name;
		if(!address){
			$('#house-name').attr('style','border: 1px red solid');
			$('#house-name').next().text('小区名称不能为空').removeClass('state1').addClass('state3');
			return ;
		}
		var time =$('#time').val();
		if(!time){
			$('#time').attr('style','border: 1px red solid');
			$('#msg-datetimepicker').next().text('请选择量房时间').removeClass('state1').removeClass('state4').addClass('state3');
			return ;
		}
		var data = {
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
				designe_id:$scope.caseDetail.designer_id,
				amount:$scope.caseDetail.designer_info.designer.measurement_price,
				decoration_budget:decoration_budget,
				district:district,
		        province_name:$("#seachprov").find("option:selected").text(),
			    city_name:$("#seachcity").find("option:selected").text(),
			    district_name:$("#seachdistrict").find("option:selected").text() == "区" ? "none" : $("#seachdistrict").find("option:selected").text(),
			    uid:uid,
		}
		$scope.selectTaAbleFlag =true;
		orderService.customDesigner(data).success(function(r) {
			if(r.status<400){
				alert("操作成功！");
				$("#panel-config-two").modal('hide');
				$scope.selectTaAbleFlag =false;
				location.reload();
			}else{
			    alert("操作失败！");
			    $scope.selectTaAbleFlag =false;
			}
		});
	};
	
	
	//Image magnification
	$scope.images=function(){
		$(document).ready(function(){
			var obox=document.getElementById("box");
			var oantzone=$(".antzone");
			var w=oantzone.width();
			var h=oantzone.height();
			var marginLeft=-(w/2)+"px";
			var marginTop=-(h/2)+"px";
			oantzone.css({
				position:"absolute",
				left:"40%",
				top:"35%",
				marginLeft:marginLeft,
				marginTop:marginTop
			});	
			addLoadEvent(Focus());
		});		
	};
});

var app = angular.module('app', ['appService', 'helper']);
//seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
});
//body controller
app.controller('ctrl', function($scope,$filter,schemeService,caseService,userCenterService,designerService,orderService,page,messageService) {
	var types;
	$scope.userInfo=[];
	$scope.mySchemeList=[];
	$scope.myCaseList=[];
	$scope.page = page.init();
	$scope.conf={};
	var designe_id=$filter('getQueryString')("id");
	var uid=$filter('getQueryString')("uid");

	if(designe_id==null){
		designe_id=0;
	};
	
	$scope.designe_id=designe_id;
	
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
	
	var designerInfo;
	//Get designer information according to designer ID 
	$('.loading').css({'display':'block'});
	designerService.getDesignerInfo({designer_id:designe_id,hs_uid:uid}).success(function(r) {
		if (r.status<400) {
			$scope.designerInfo=r;
			designerInfo=r;
		}
		$('.loading').css({'display':'none'});
	});
	
	
	//According to the designer ID to get their own design 
	function getCaseList(data){
		$('.loading').css({'display':'block'});
		caseService.myCaseList(data).success(function(r) {
			if (r.status<400) {
				
				$scope.myCaseList=r.cases;
				
				$scope.conf = {
				    currentPage:r.offset+1,
				    totalItems:r.count,
				    itemsPerPage:15,
				};
			}
			$('.loading').css({'display':'none'});
		});
	}

	//Visitors get the designer's wild program
	function get3dsheme(data){
		$('.loading').css({'display':'block'});
		schemeService.getDesigner3dsheme(data).success(function(r) {
			if (r.status<400) {
				$scope.mySchemeList=r.cases;
				$scope.conf = {
				    currentPage:r.offset+1,
				    totalItems:r.count,
				    itemsPerPage:15,
				};
			}
			$('.loading').css({'display':'none'});
		});
	}

    //定义翻页的方法
	$scope.page.set_val('go_page', function(page) {
			var data = getOptions();
			data.page =data.pageSize*(page-1);
			
			if(type==""||type==1){
			   getCaseList(data);
			}else{
			   get3dsheme(data);
			}
	 });
	
	function getOptions() {
		var op = {
			page:0,
			pageSize:15,
			designe_id:designe_id
		}
		return op;
	}
	
	
	$scope.myCase=function(type){
		types=type;
		if(type==1){
			$scope.conf = {};
			getCaseList(getOptions());
		}else{
			$scope.conf = {};
			get3dsheme(getOptions());
		}
	};
	
	
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
		$scope.ableFlag =true;
		var phone=$scope.contacts_mobile;
		if(!phone){
			$('#phone').attr('style','border: 1px red solid');
			$('#phone').next().text('电话不能为空').removeClass('state1').addClass('state3');
			return ;
		}
		var housetype = $scope.house_type;
		if(!housetype){
			$('#dd').attr('style','border: 1px red solid');
			$('#dd').next().text('请选择房屋类型').removeClass('state1').addClass('state3');
			return ;
		}
		var housearea =$scope.house_area;
		if(!housearea){
			$('#h_mesure').attr('style','border: 1px red solid');
			$('#h_mesure').next().text('面积不能为空').removeClass('state1').addClass('state3');
			return ;
		}
		var budget =$scope.design_budget;
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
		var livingroom = $scope.living_room ;
		if(!livingroom){
			$('#livingroomCountreq').attr('style','border: 1px red solid');
			$('#room').next().text('请选择户型').removeClass('state1').addClass('state3');
			return ;
		}
		var bathroomCountreq = $scope.toilet;
		if(!bathroomCountreq){
			$('#bathroomCountreq').attr('style','border: 1px red solid');
			$('#room').next().text('请选择户型').removeClass('state1').addClass('state3');
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
				designe_id:designerInfo.designer.acs_member_id,
				amount:designerInfo.designer.measurement_price,
				decoration_budget:decoration_budget,
				district:district,
		        province_name:$("#seachprov").find("option:selected").text(),
			    city_name:$("#seachcity").find("option:selected").text(),
			    district_name:$("#seachdistrict").find("option:selected").text() == "区" ? "none" : $("#seachdistrict").find("option:selected").text()
		}
		//console.log(data);
		$('#commit').attr('disabled',true);
		orderService.customDesigner(data).success(function(r) {
			$scope.ableFlag =false;
			if(r.status<400){
				alert("操作成功！");
				$("#panel-config-two").modal('hide');
				$('#commit').attr('disabled',false);
				location.reload();
			}else{
			    alert("操作失败！");	
				$('#commit').attr('disabled',false);
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
	
});

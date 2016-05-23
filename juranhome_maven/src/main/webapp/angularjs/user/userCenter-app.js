'use strict';
var app = angular.module('app', [ 'ngRoute', 'appService', 'helper' ]);
app.config(function($routeProvider, $locationProvider) {
	$routeProvider.when('/', {
		templateUrl : baseUrl + '/user/pCenter',
		controller : 'listCtrl'
	}).when('/message/', {
		templateUrl : baseUrl + '/user/message',
		controller : 'messageCtrl'
	}).when('/im/', {
		templateUrl : baseUrl + '/im/index',
		controller : 'imCtrl'
	}).when('/myorder', {
		templateUrl : baseUrl + '/myOrder/myorder',
		controller : 'myorderCtrl'
	}).when('/designerOrder', {
		templateUrl : baseUrl + '/myOrder/orderList',
		controller : 'designerOrderCtrl'
	}).when('/orderDetail/:id/', {
		templateUrl : baseUrl + '/myOrder/orderDetail',
		controller : 'myorderdetailCtrl'
	}).when('/targets/:id/', {
		templateUrl : baseUrl + '/myOrder/targets',
		controller : 'targetsCtrl'
	}).when('/getMemberNeeds/', {
		templateUrl : baseUrl + '/myOrder/getMemberNeeds',
		controller : 'getMemberNeedsCtrl'
	}).when('/mydiy', {
		templateUrl : baseUrl + '/user/mydiy',
		controller : 'mydiyCtrl'
	}).when('/mymoney', {
		templateUrl : baseUrl + '/user/mymoney',
		controller : 'mymoneyCtrl'
	}).when('/drawcash', {
		templateUrl : baseUrl + '/user/drawcash',
		controller : 'drawcashCtrl'
	}).when('/mybidlist', {
		templateUrl : baseUrl + '/myOrder/mybidlist',
		controller : 'mybidlistCtrl'
	}).when('/mypage', {
		templateUrl : baseUrl + '/user/mypage',
		controller : 'mypageCtrl'
	}).when('/my3DScheme', {
		templateUrl : baseUrl + '/3Dscheme/my3DScheme',
		controller : 'my3DSchemeCtrl'
	}).when('/beishuOreder', {
		templateUrl : baseUrl + '/myOrder/beishuOreder',
		controller : 'beishuOrederCtrl'
	}).when('/security_center/', {
		templateUrl : baseUrl + '/user/security_center',
		controller : 'securityCenterCtrl'
	}).otherwise({
		redirectTo : '/'
	})
});

// seo controller
app.controller('seoCtrl', function($scope, indexService) {
	$scope.title = "设计家在线设计平台";
	$scope.keywords = "设计家在线设计平台";
	$scope.description = "设计家在线设计平台";
});

var str_token;
var str_memberId;
var str_memberMsg = [];
// main controller
app.controller('ctrl', function($scope,designerService,$filter,userCenterService,messageService) {

	$scope.is_show=false;
	designerService.getDesignerInfo({designer_id:"0",hs_uid:"0"}).success(function(r) {
		if (r.status<400) {
			$scope.designerInfo=r;
		}
	});
	
	$scope.openwindow=function(){
		window.open(baseUrl+'/mark/main');
	};
	
	
	// get member msg
	var data = {};
	userCenterService.getMemberMessage(data).success(function(r) { // get
		// userData
		if (r.status < 400) {
			$scope.data = r;
			// init preview
		}
	});
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
});

// body controller
app.controller('listCtrl', function($scope, userCenterService) {

	// alert("into pcenter controller");

	$scope.auth_submit = function(data) {// real name authentication submit
		var token = str_token;
		var realname = $scope.realname;
		var sex = $scope.sex;
		var birth_y = $scope.birth_y;
		var birth_m = $scope.birth_m;
		var birth_d = $scope.birth_d;
		var phone = $scope.phone;
		var idnumber = $scope.idnumber;
		var upimg = $scope.upimg;
		var downimg = $scope.downimg;

		var data = {
			token : token,
			realname : realname,
			sex : sex,
			birth_y : birth_y,
			birth_m : birth_m,
			birth_d : birth_d,
			phone : phone,
			idnumber : idnumber,
			upimg : upimg,
			downimg : downimg
		}
		userCenterService.authSubmit(data).success(function(r) {
			if (r.status < 400) {
				alert("submit");
			} else {
			}
		});
	}

});

// message controller
app.controller('messageCtrl', function($scope,page, userCenterService,$filter) {
	$scope.messageType = "2";	
	$scope.messages=[];
	$scope.isShow=true;
	$scope.checkall=false;
	//page 
	$scope.page = page.init();
	$scope.page.set_val('go_page', function(page) {
		var data = getOptions();
		data.page = data.pageSize * (page - 1);
		getList(data);
	});
	
	function getOptions() {
		var op = {
			page : 0,
			pageSize : 10,
			status : '',
			messageType:$scope.messageType
		}
		return op;
	}
	//var messageType = $scope.messageType;
		
	function getList(data){
		$scope.messages=[];
		$('#loadingMask').css({'display':'block'});
		userCenterService.getSystemMessageList(data).success(function(r){
			if(r.status < 400)
			{
				$scope.messages=r.messages;	
				if(r.messages.length>0){
					$scope.isShow=true;
				}
				else
				{
					$scope.isShow=false;
				}
				$scope.conf = {
						currentPage : r.offset + 1,
						totalItems : r.count,
						itemsPerPage : r.limit,
						numberOfPages : Math.ceil(r.count/r.limit)
					};
			}
			$('#loadingMask').css({'display':'none'});
		});
	}

	getList(getOptions());
	
	$scope.checkAll=function(checked){
		$scope.messages.forEach(function(item){
			item.isChecked=checked;
		});
	}
	// select system notification by status
	$scope.messageSearch = function(selected) {
		// alert(selected);
		var dataSearch = {
			selected : selected,
		};
		userCenterService.getSystemNoticeList(dataSearch).success(function(r) {
			if (r) {
				console.log("=====msg:"+r);
			}
		});
	};
	$scope.deleteMsg=function(id){
		$scope.conf={};
		var data={};
		if(id!=null){
			data.ids=id;
		}
		else{
			data.ids=getSelectedMsgIds();
		}
		userCenterService.deleteSystemMessage(data).success(function(r){
			if(r.status ==204){//delete success
				getList(getOptions());//refresh data
				$scope.checkall=false;
			}
		});
	}
	//get selected message id's
	function getSelectedMsgIds(){
		var ids="";
		$scope.messages.forEach(function(item){
			if(item.isChecked){
				ids+=item.message_id+",";
			}
		});
		if(ids!=""){
			ids=ids.substr(0,ids.length-1);
		}
			
		return ids;
	}
	
});

// myorder controller
app.controller('myorderCtrl', function($scope, $routeParams, userCenterService,orderService, page,$filter,memberService,designerService,schemeService) {
    
    $scope.orderList = [];
	$scope.is_show = false;
	$scope.page = page.init();
	$scope.conf = {};
	$scope.show = function() {
		$scope.is_show = true;
	}
	
	$scope.deliveryFiles=[];
	$scope.isShow=false;
	var str_needsId;
    
	//page 
	$scope.page.set_val('go_page', function(page) {
		var data = getOptions();
		data.page = data.pageSize * (page - 1);
		getList(data);
	});
	function getOptions() {
		var op = {
			page : 0,
			pageSize : 10,
			status : ''
		}
		return op;
	}

	// Get my next order data
	function getList(data) {
		$('#loadingMask').css({'display':'block'});
		orderService.getMyOrederList(data).success(function(r) {
			if (r.status < 400) {
				if(r.needs_list.length>0){
					$scope.isShow=false;
				}else{
					$scope.isShow=true;
				}
				$scope.orderLis = r.needs_list;
				$scope.conf = {
						currentPage : r.offset + 1,
						totalItems : r.count,
						itemsPerPage : 10
					};
			}else{
			}
			$('#loadingMask').css({'display':'none'});
		});
	}
	
	// Rejection volume
	$scope.refuse = function(nees_id, designent_id) {
		$scope.refuseAbleFlag =true;
		var data = {
			designent_id : designent_id,
			nees_id : nees_id
		};

		orderService.deleteOrder(data).success(function(r) {
			$scope.refuseAbleFlag =false;
			if (r.status < 400) {
				alert("拒绝TA成功！");
				$("#refuse").modal('hide');
				getList(getOptions());
				//location.reload();
			} else {
				alert("拒绝TA失败！");
			}
		});
	}
    
	
	$scope.clearError = {
	    selectTatime: function() {
		     $scope.selectTatime_error=false; 
		},
	}
	// Select TA volume room
	$scope.selectTa = function(nees_id, designer_id) {
		$scope.selectTaAbleFlag =true;
		
		if($("#dateop").val().length<=0){
			$("#dateop").attr('style','border: 1px red solid');
			 $scope.selectTatime_error=true; 
			 $scope.ableFlag =false;
			 return false;
		}
		
		var data={
				needs_id:nees_id,
				designer_id:designer_id,
				expenses:$scope.expenses,
				time:$("#dateop").val(),
		};
		orderService.selectTa(data).success(function(r){
			$scope.selectTaAbleFlag = false;
			if(r.status<400){
				alert("选TA量房成功！");
				$("#orderDetail").modal('hide');
				getList(getOptions());
			}
			else{
				alert("数据请求失败");
			}
		});
	}
	getList(getOptions());

	var bidderorder;
	var contractData;
	var bidderDetial;
	// View requirements details page
	$scope.orderDetail = function(needs_id,designer_id,type,status,expenses,uid,orders,contract) {
	
		//alert(needs_id+"/"+designer_id+"/"+type+"/"+status+"/"+expenses);
		
		$scope.designer_id=designer_id;
		$scope.type=type;
		$scope.status=status;
		$scope.expenses=expenses;
		$scope.needs_id=needs_id;
		$scope.designer_id=designer_id;
		bidderorder=orders;
		$scope.measure_time=uid;
		//contractData=contract
		$scope.contractData=contract;
		console.log(contract);
		
		
		if(type==3){
			$scope.memberInfo=getMemberInfo(designer_id);
		}
		
		var datas = {
			needs_id : needs_id
		};
		$('#poploading').css({'display':'block'});
		orderService.getmybiddetail(datas).success(function(r) {
			if (r.status < 400) {
				$scope.detail = r;
				$scope.designer_id = designer_id;
				$scope.bidder = r.bidder_list;
				bidderDetial = r.bidders;
				$('#seachprov').val(r.province).trigger('change');
				$('#seachcity').val(r.city).trigger('change');
				$('#seachdistrict').val(r.district);
				var datass = {};
				$scope.str_needsId = r.needs_id;
				if(type==3){
					designerService.getDesignerInfo({designer_id:designer_id,hs_uid:uid}).success(function(r){
						$scope.memberInfo=r;
					});
				}
			} else {
				alert("error");
			}
			$('#poploading').css({'display':'none'});
		});
	}

	$scope.modify = function(needs_id) {
		var pattern = /^1[34578]\d{9}$/;
		var contactsname = $scope.detail.contacts_name;
		var housetype = $scope.detail.house_type;
		
		var contactsmobile = $scope.detail.contacts_mobile;
		var housearea = $scope.detail.house_area;
		
		var renovationbudget = $scope.detail.design_budget;
		var renovationstyle = $scope.detail.decoration_style;
		
		
		var neighbourhoods = $scope.detail.community_name;
		var roomtype = $scope.roomtype;

		var room = $scope.detail.room;
		var livingroom = $scope.detail.living_room;
		
		var toilet = $scope.detail.toilet;
		var provincename = $("#seachprov").val();
		
		var cityname = $("#seachcity").val();
		var districtname = $("#seachdistrict").val();
		if(districtname==null){
			districtname=0;
		}
		var province_name=$("#seachprov").find("option:selected").text();
		var city_name=$("#seachcity").find("option:selected").text();
		var district_name_obj = document.getElementById("seachdistrict");
		var district_name= district_name_obj.options.length > 1 ? $("#seachdistrict").find("option:selected").text() : "none";
		
		if((!contactsmobile)||(!pattern.test(contactsmobile))){
			alert("联系电话为空或填写有误！");
			return false;
		}
		if(provincename<=0){
			alert("请选择省份");
			return false;
		}
		if(cityname<=0){
			alert("请选择城市");
			return false;
		}
		var districtCount=document.getElementById("seachdistrict").options.length;
		if(districtCount>1&&districtname==0)
    	{
			alert("请选择地区");
			return false;
    	}
		if(!neighbourhoods||neighbourhoods.length<2){
			alert("小区名称为空或不符合规则");
			return false;
		}
		$("#ModifySubmit, #ModifyClose").attr("disabled", "disabled");
		var data = {
			needId : needs_id,
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

			room : room,
			livingroom : livingroom,
			toilet : toilet,

			province_name:province_name,
			city_name:city_name,
			district_name:district_name,
			
			decoration_budget : $scope.detail.decoration_budget,
			design_budget:$scope.detail.design_budget,
		}
		userCenterService.modifyDemand(data).success(function(r) {
			if (r.status < 400) {
				alert("修改成功");
				location.reload();
			} else {
				alert("修改失败！");
			}
			$('.poploading').css({'display':'none'});
		});
	}
	
	//The first step to terminate the demand
	var needsid;
	$scope.ends=function(needs_id){
	    needsid=needs_id;
	}

	//End demand confirmation
	$scope.terminate = function() {
		$("#agreeBtn, #closeBtn").attr("disabled", "disabled");
		var input = {
			needs_id : needsid,
			explain:$scope.explain
		};
	  userCenterService.terminateDemand(input).success(
			function(r) {
				if (r.status < 400) {
					alert("终止需求成功！");
					location.reload();
				} else {
					alert("终止需求失败！");
				}
			});
	}
	//data update
	$scope.update = function(data) {
		$scope.contactsname = $scope.detail.contacts_name;
		$scope.housetype = $scope.detail.house_type;
		$scope.contactsmobile = $scope.detail.contacts_mobile;
		$scope.housearea = $scope.detail.house_area;
		$scope.renovationbudget = $scope.detail.decoration_budget;
		$scope.renovationstyle = $scope.detail.decoration_style;
		$scope.neighbourhoods = $scope.detail.community_name;
		$scope.room = $scope.detail.room;
		$scope.livingroom = $scope.detail.living_room;
		$scope.toilet = $scope.detail.toilet;
		$scope.imgurl = $scope.detail.house_image_list;
		$('#s_province').val($scope.detail.province).trigger('change');
		$('#s_city').val($scope.detail.city).trigger('change');
		$('#s_county').val($scope.detail.district);
		$scope.hidden_province = $scope.detail.province;
		$scope.hidden_city = $scope.detail.city;
		$scope.hidden_district = $scope.detail.district;
	};
	
	/*-----------PayPal-----------*/
	
	$scope.prePay = function(needs_id, designer_id){
		$('#poploading').css({'display':'block'});
		var data={};
		userCenterService.getMemberMessage(data).success(function(r) { // get
			// userData
			if (r.status < 400) {
				$scope.memberData = r;
			}
		});

		var datas = {
				needs_id : needs_id
			};
			orderService.getmybiddetail(datas).success(function(r) {
				if (r.status < 400) {
					$scope.detail = r;
					$scope.designer_id = designer_id;
					$scope.bidder = r.bidders;
				} else {
					alert("error");
				}
				$('#poploading').css({'display':'none'});
			});
	}
	
	
	var memberInfo;
	
	//Payment of the first 
	$scope.contract=function(needs,design_contract,orders,designer_id,uid,status,measurement_fee){
		
		$scope.needsDetail=needs;
		$scope.contractData=design_contract;
		contractData=design_contract;
		bidderorder=orders;
		$scope.status=status;
		$scope.measurement_fee=measurement_fee;
		
	    orderService.getURLDecoder({contract_data:design_contract[0].contract_data}).success(function(r){
	   
			$scope.contract_Data=r;
			$scope.name=r.name;
			$scope.addr=r.addr;
			$scope.addrDe=r.addrDe;
			$scope.mobile=r.mobile;
			$scope.email=r.email;
			$scope.zip=r.zip;
			$scope.impression=r.design_sketch;
			$scope.diy=r.render_map;
			$scope.price=r.design_sketch_plus;
		});
	    
	    designerService.getDesignerInfo({designer_id:designer_id,hs_uid:uid}).success(function(r){
			$scope.memberInfo=r;
			memberInfo=r;
		});
	}
	
	
	 $scope.PayFirst = function(status){

			var order_status;
			var order_no;
			var order_line_no;
			
			if(status==13){
				order_status=1;
			}else if(status==31){
				order_status=5;
			}else{
				order_status=6;
			}
		    
		
			for(var i=0;i<bidderorder.length;i++){
				if(bidderorder[i].order_status==order_status){
					order_no=bidderorder[i].order_no;
					order_line_no=bidderorder[i].order_line_no;
					break;
				}
			}
			
			var paydata={
				order_id:order_no,
			    orderLine_id:order_line_no,
			};
		
			orderService.getAlipayUrl(paydata).success(function(r) {
				window.open(r.payUrl);
			});
		}
	
	
	//get member info
	function getMemberInfo(member_id){
		memberService.getMemberIdInfo({member_id:member_id}).success(function(r) {
			return r;
		});
	}
	
	//view delivery
	$scope.viewDelivery=function(needs_id,designer_id,status,community_name){
		
		$scope.community_name=community_name;
		$scope.designer_id=designer_id;
		$scope.needs_id=needs_id;
		$scope.status=status;
		
		schemeService.viewDelivery({needs_id:needs_id,designer_id:designer_id}).success(function(r) {
			if (r.status < 400) {
				$scope.deliveryFiles=r.deliveryFiles;
			}
		});
	}
	
	
	//get  Design info
	$scope.getDesignInfo=function(uid,designer_id,status,mesure_cost,declaration,needs_id){
		if(status < 11){
			//alert(declaration);
			var designerDeclaration = declaration ? declaration : "";
			if($("#UserDetail_" + needs_id + "_" + designer_id).html().length == 0){
				designerService.getDesignerInfo({designer_id:designer_id,hs_uid:uid}).success(function(r){
					var workingExperience = r.designer.experience ? r.designer.experience + "年" : "未填写";
					var designInfoStr = "";
					designInfoStr += "<table class='table bid-designer-info' ng-if='blist.wk_cur_sub_node_id<11'>";
					designInfoStr += "<tr><td>从业年限：" + workingExperience + "</td>";
					designInfoStr += "<td>设计费：" + r.designer.design_price_min + "元~" + r.designer.design_price_max + "元/m²</td></tr>";
					designInfoStr += "<tr>";
					designInfoStr += "<td class='col-md-2 col-sm-2'>量房费:" + mesure_cost + "元</td>";
					designInfoStr += "<td class='col-md-7 col-sm-7'>擅长风格：" + r.designer.style_long_names + "</td>";
					designInfoStr += "<td class='col-md-3 col-sm-3'>手机：" + r.real_name.mobile_number + "</td>";
					designInfoStr += "</tr>";
					designInfoStr += "<tr><td colspan='3'><div class='designer-description alert-info col-md-12'>" + designerDeclaration + "<br><br><br><br><br></div></td></tr>";
					designInfoStr += "</table>";
					$("#UserDetail_" + needs_id + "_" + designer_id).html(designInfoStr);
				});
			}
			//alert($("#UserDetail_" + designer_id).html());
		}
	}
	
	
	//view 3d
	$scope.viewDeliveryService=function(needs_id,designer_id){
		schemeService.viewDelivery({needs_id:needs_id,designer_id:designer_id}).success(function(r) {
			if (r.status < 400) {
				var asset_id;
				for(var i=0;i<r.deliveryFiles.length;i++){
					
					if(r.deliveryFiles[i].usage_type=="10"){
						asset_id=r.deliveryFiles[i].id;
						break;
					}
				}
		
				if(asset_id){
					schemeService.getHsPrints({asset_id:asset_id,needs_id:needs_id,designer_id:designer_id}).success(function(r) {
						if(r.status<400){
							if(r.hs_designer_uid){
								var url=baseUrl+"/3Dscheme/open3Dscheme/hs_design_id/"+r.hs_design_id+"/acs_asset_id/"+asset_id+"/acs_project_id/"+needs_id+"/";
								window.open(url); 
							}
						}
					});	
				}
			}
		});
	};
	
	//Enlarge picture 
	var isInit = false;
	$scope.enlargePicture=function(type){
		$scope.type=type;
		$(document).ready(function() {
			var obj = setInterval(function() {
				if($('.pgwSlideshow').is(':visible')) {
					clearInterval(obj);
					$('.pgwSlideshow').pgwSlideshow();
					
					if(!isInit) {
						isInit = true;
					} else {
						$('.pgwSlideshow .ps-list .ps-current').remove();
					}
					
					var hd = $(window).height()+'px';
					$('#windowImg .windowImages').css({"height":"hd"});
					$('#windowImg .qp-ps-caption').css({"display":"none"});
					$(document).on('click','.qp-ps-caption',function(){
						setTimeout('$(window).resize()', 10);
					})
					$('#windowImg .pgarrow').css({"display":"block","cursor":"pointer"});
					$('#windowImg .windowImages .ps-current').css({"minHeight":"80vh"});
					$('#windowImg .windowImages .ps-current ul li img').css({"width":"60%"});
			        var imagesUrl=baseUrl+"/images/designer/pgarrow01.png";
					var k = false;
					$(document).on("click","#windowImg .pgarrow img",function(){
						var Iw = $('.ps-current ul img').width()+'px';
						var Ih = $('.ps-current ul img').height()+'px';
						if( k == false ){
							$(this).attr("src",imagesUrl);
							$('#windowImg .ps-list').stop().slideUp();
							$('#windowImg ul .ps-current img').css({"width":"80%","height":"80%"});
							k = true;
						}else{
							$(this).attr("src",imagesUrl);
							$('#windowImg .ps-list').stop().slideDown();
							$('#windowImg ul .ps-current img').css({"width":"Iw","height":"Ih"});
							k = false;
						}
					})
				}
			}, 10);
		});
	};
});

// designerOrderCtrl controller
app.controller('designerOrderCtrl', function($scope, orderService,userCenterService,designerService,page,$filter,memberService,schemeService) {
   
	$scope.orders = [];
	$scope.detail = "";
    $scope.totalDesign="";
	//init page
	$scope.page = page.init();
	
	//page 
	$scope.page.set_val('go_page', function(page) {
		var data = getOptions();
		data.page = data.pageSize * (page - 1);
		getList(data);
	});
	
	function getList(data) {
		$('#loadingMask').css({'display':'block'});
		orderService.getDesignersOrderlist(data).success(function(r) {
			if (r.status < 400) {         
				
				$scope.orders = r.order_list;
				$scope.conf = {
						currentPage : r.offset + 1,
						totalItems : r.count,
						itemsPerPage :20
				};
				
			} else {
				$scope.isShow=true;
			}
			if(r.count<=0){
		    	$('#noMatch').css({'display':'block'});
		    }else{
		    	$('#noMatch').css({'display':'none'});
		    }
			$('#loadingMask').css({'display':'none'});
		});
	}

	function getOptions() {
		var op = {
			page :0,
			pageSize :20
		}
		return op;
	}

	getList(getOptions());

	// View requirements details page
	$scope.orderDetail = function(needs_id) {
		var datas={};
		var datas = {
			needs_id : needs_id
		};
		$('.poploading').css({'display':'block'});
		orderService.getmybiddetail(datas).success(function(r) {
			if (r.status < 400) {
				$scope.detail = r;
			}
			$('.poploading').css({'display':'none'});
		});
	}
	
	//Designers reject consumers real 
	$scope.refuse = function(needs_id){
		$scope.refuseAbleFlag = true;
		var data={
		    needs_id:needs_id
		};
		orderService.refused(data).success(function(r) {
			$scope.refuseAbleFlag =false;
			if (r.status < 400) {
				alert("拒绝量房成功！");
				$('#remind').modal('hide');
				getList(getOptions());
			}else{
				alert("拒绝量房失败！");
			}
		});
	}
	
	//Confirmation of the volume of housing
	$scope.confirm=function(needs_id){
		$scope.confirmAbleFlag = true;
		var datas={
			needs_id:needs_id	
		};
		orderService.confirm(datas).success(function(r) {
			$scope.confirmAbleFlag = false;
			if (r.status < 400) {
				alert("操作成功！");
				$('#measureconfirm').modal('hide');
				getList(getOptions());
			}else{
				alert("操作失败！");
			}
		});
	}
	
	//Designers create contracts
	var orderStatus;
	var design_contract_data;
	$scope.createContract=function(needs_id,status,designer_id,member_id,design_contract){
        
		//alert(needs_id+"|"+status+"|"+designer_id+"|"+member_id);
		//get member info
		design_contract_data=design_contract;
		$scope.needs_id=needs_id;
	    $scope.memberInfo=getMemberInfo(designer_id);
		$scope.status=status;
		orderStatus=status;
		//get needs detail
		orderService.getmybiddetail({needs_id:needs_id}).success(function(r) {
			if (r.status < 400) {
				$scope.detail = r;
				if(r.bidders[0].wk_cur_sub_node_id>=31){
					$scope.totalDesign=r.bidders[0].design_contract[0].contract_charge;
					$scope.designFirst=r.bidders[0].design_contract[0].contract_first_charge;
					$scope.contractNumber=r.bidders[0].design_contract[0].contract_no;
					$scope.time=r.bidders[0].design_contract[0].contract_create_date;
				}
				if(status==21){
					$scope.name=r.contacts_name;
					$scope.addr=r.province_name+r.city_name+r.district_name;
					$scope.addrDe=r.province_name+r.city_name+r.district_name+r.community_name;
					$scope.mobile=r.contacts_mobile;
				}
			}
		});
		
		if(status==21){
			orderService.getContractNumber({}).success(function(r) {
				if (r.status < 400) {
				$scope.contractNumber=r.contractNO;
				$scope.time=new Date();
				}
			});
		}
		
		if(status>=31){
			orderService.getURLDecoder({contract_data:design_contract[0].contract_data}).success(function(r){
		    	console.log(r);
				$scope.contract_Data=r;
				
				$scope.name=r.name;
				$scope.addr=r.addr;
				$scope.addrDe=r.addrDe;
				$scope.mobile=r.mobile;
				var email=r.email;
				
				if(email!="null"){
					$scope.email=email;
				}else{
					$scope.email="";
				}
				
				var zip=r.zip;
				if(zip!="null"){
					$scope.zip=zip;
				}else{
					$scope.zip="";
				}
				
				$scope.impression=r.design_sketch;
				$scope.diy=r.render_map;
				$scope.price=r.design_sketch_plus;
			});
		}
	}
	
	
	//验证
	$scope.clearError = {
		impressionDrawing: function() {
			$scope.impressionDrawing_error=false; 
			$scope.impressionDrawing_is_number_error=false; 
		},
		diy:function() {
			$scope.diy_error = false;
			$scope.diy_is_number_error = false;
		},
		price:function(){
			$scope.price_error=false;
			$scope.price_is_number_error=false;
		},
		totalDesign:function(){
			$scope.totalDesign_error=false;
			$scope.totalDesign_is_number_error=false;
			$scope.totalDesign_isfee_error=false;
		},
		designFirst:function(){
			$scope.designFirst_error=false;
			$scope.designFirst_is_number_error=false;
			$scope.designFirst_is_error=false;
			$scope.designFirst_gte_error=false;
			$scope.designFirst_isfistfee_error=false;
		},
		name:function(){
			$scope.name_error=false;
		},
		mobile:function(){
			$scope.mobile_error=false;
			$scope.error=false;
		},
		addrDe:function(){
			$scope.addrDe_error=false;
		},
    };
	
	//save contracts
	$scope.saveContract=function(needs_id,measurement_fee){
		//$('#contract2').modal('show');
		//impressionDrawing  效果图
		//diy   diy 渲染图
		//price 每增加一张图 的价格
		//totalDesign 设计总额
		//designFirst 设计首款
		//designTail  设计尾款
		var is_submit = true;
		
		$scope.ableFlag = true;
		if(!$scope.impression){
			$scope.impressionDrawing_error=true;
			is_submit = false;
		}else if(isNaN($scope.impression)||parseInt($scope.impression)<=0){
			$scope.impressionDrawing_is_number_error=true;
			is_submit = false;
		}
		
		if(!$scope.diy){
			$scope.diy_error=true;
			is_submit = false;
		}else if(isNaN($scope.diy)||parseInt($scope.diy)<=0){
			$scope.diy_is_number_error = true;
			is_submit = false;
		}
		
		if(!$scope.price){
			$scope.price_error=true;
			is_submit = false;
		}else if(isNaN($scope.price)||parseFloat($scope.price)<=0){
			$scope.price_is_number_error=true;
			is_submit = false;
		}
		
		if(!$scope.totalDesign){
			$scope.totalDesign_error=true;
			is_submit = false;
		}else if(isNaN($scope.totalDesign)||parseFloat($scope.totalDesign)<=0){
			$scope.totalDesign_is_number_error=true;
			is_submit = false;
		}else if(parseFloat($scope.totalDesign)<=parseFloat(measurement_fee)){
			$scope.totalDesign_isfee_error=true;
			is_submit=false;
		}
		
		
		if(!$scope.designFirst){
			$scope.designFirst_error=true;
			is_submit = false;
		}else if(isNaN($scope.designFirst)){
			$scope.designFirst_is_number_error=true;
			is_submit = false;
		}else if(parseFloat($scope.designFirst)<parseFloat(($scope.totalDesign)*0.8).toFixed(2)||parseFloat($scope.designFirst)<=0){
			$scope.designFirst_is_error=true;
			is_submit = false;
		}else if(parseFloat($scope.designFirst)>parseFloat($scope.totalDesign)){
			$scope.designFirst_gte_error=true;
			is_submit = false;
		}else if(parseFloat($scope.designFirst)<=parseFloat(measurement_fee)){
			$scope.designFirst_isfistfee_error=true;
			is_submit=false;
		}
		
		if(!$scope.name){
			$scope.name_error=true;
			is_submit = false;
		}
		if(!$scope.mobile){
			$scope.mobile_error=true;	
			is_submit = false;
		}else if(!$filter('VerifyPhone')($scope.mobile)){
			$scope.error=true;	
			is_submit = false;
		}
		if(!$scope.addrDe){
			$scope.addrDe_error=true;
			is_submit = false;
		}
		
		if(!is_submit){
			$scope.ableFlag = false; //点击控制
			return false;
		}
		var contract_no;
		if(orderStatus==31){
			contract_no=design_contract_data[0].contract_no;
		}else{
			contract_no=$scope.contractNumber;
		}
		
		var contractDate={
		   needs_id:needs_id,
		   contract_no:contract_no,
		   contract_type:'0',
		   contract_first_charge:$scope.designFirst,
		   contract_charge:$scope.totalDesign,
		   impressionDrawing:$scope.impression,
		   diy:$scope.diy,
		   price:$scope.price,
		   designTail:$scope.totalDesign-$scope.totalDesign*0.8,
		   contract_template_url:'www.baidu.com',
		   
		   name:$scope.name,
		   mobile:$scope.mobile,
		   zip:$scope.zip,
		   email:$scope.email,
		   addr:$scope.addr,
		   addrDe:$scope.addrDe
		};
		orderService.createContract(contractDate).success(function(r) {
			$scope.ableFlag = false;
			if (r.status < 400) {
				alert("操作成功！");
				$('#contract2').modal('hide');
				getList(getOptions());
			}else{
				alert("操作失败！！");
			}
		});
	}
	
	//The amount of housing delivery
	$scope.roomPay=function(needs_id,wk_cur_sub_node_id){
		$scope.needs_id=needs_id;
		$scope.wk_cur_sub_node_id=wk_cur_sub_node_id;
	};
	
	//get member info
	function getMemberInfo(member_id){
		designerService.getDesignerInfo({designer_id:""}).success(function(r) {
			return r;
		});
	}
	
	//get getAsset ID
	$scope.getAsset=function(needs_id){
		schemeService.get3DAssetid({needs_id:needs_id}).success(function(r){
			if(r.status<400){
				var hs_design_id=0;
				if(r.hs_design_id){
					hs_design_id=r.hs_design_id;
				}
				var url=baseUrl+"/3Dscheme/open3Dscheme/hs_design_id/"+hs_design_id+"/acs_asset_id/"+r.design_asset_id+"/acs_project_id/"+needs_id+"/";
				window.open(url);  
			}
		});
	}
	
	
	
	//Design delivery 
	var needsId;
	var submitType;
	var designer_id;
	var design_asset_id;
	var hs_design_id;
	var type;
	$scope.designDelivery=function(needs_id,community_name,designer_id,type,status){
		$scope.community_name=community_name;
		$scope.type=type;
		submitType=type;
		$scope.designer_id=designer_id;
		$scope.status=status;
		needsId=needs_id;
		//get 3D design_asset_id
		schemeService.get3DAssetid({needs_id:needs_id}).success(function(r){
			if(r.status<400){
				design_asset_id=r.design_asset_id;
				//hs_design_id=r.hs_design_id;
				
				//Get 3D file
				schemeService.get3DAssetFile({needs_id:needs_id,asset_id:design_asset_id}).success(function(r) {
					if (r.status < 400) {
						
						for(var i=0;i<r.design_file.length;i++){
							if(r.design_file[i].type==10){
								$scope.is_diy=true;
							}
							if(r.design_file[i].type==0){
								$scope.is_bom=true;
							}
							if(r.design_file[i].type==3){
								$scope.is_designdrawing=true;
							}
							
							if(r.design_file[i].type==2){
								$scope.is_forageList=true;
							}
						}
						$scope.schemeList = r;
					}
				});
			}
		});
	}
	
	
	//view delivery
	$scope.viewDelivery=function(needs_id,status,type,community_name){
		$scope.status=status;
		$scope.type=type;
		$scope.community_name=community_name;
		schemeService.viewDelivery({needs_id:needs_id,designer_id:""}).success(function(r) {
			if (r.status < 400) {
				$scope.deliveryFiles=r.deliveryFiles;
			}
		});
	}
	
	var designdrawing_id;
	var forageList_id;
	var bom_id;
	var diy_id;
	
	$scope.submit=function(type){
		if(type==1){
			diy_id=$('#diy').val();
			$scope.diy=$('#diy').val();
		}else if(type==2){
			$scope.bom_id=$('#bom').val();
			bom_id=$('#bom').val();
		}else if(type==3){
			designdrawing_id=$('#designdrawing').val()
			$scope.designdrawing=$('#designdrawing').val();
		}else{
			$scope.forageList=$('#forageList').val();
			forageList_id=$('#forageList').val();
		}
	}
	
	
	//Upload delivery
	$scope.saveDesignDelivery=function(){
		$scope.goAbleFlag=true;
		var fell_ids="";
		if(submitType==1){
			if(!design_asset_id){
				alert("请选择3D设计方案");
				$scope.goAbleFlag=false;
				return false;
			}
			if(!bom_id){
				alert("请选择渲染图");
				$scope.goAbleFlag=false;
				return false;
			}
			
			if(!designdrawing_id){ 
				alert("请选择设计图纸");
				$scope.goAbleFlag=false;
				return false;
			}
			
			if(!forageList_id){
				$scope.goAbleFlag=false;
				alert("材料清单");
				return false;
			}
			
			fell_ids=forageList_id+bom_id;
			
		}else{
			
			if(!designdrawing_id){ 
				alert("请选择设计图纸");
				$scope.goAbleFlag=false;
				return false;
			}
			
			fell_ids+=designdrawing_id;
		}
		
		
			
		
		
		var data={
		    needs_id:needsId,
		    type:submitType,
		    hs_design_id:hs_design_id,
		    asset_id:design_asset_id,
		    fell_ids:fell_ids
		}
		//fell_ids:designdrawing_id+forageList_id+bom_id+diy_id
		schemeService.designDelivery(data).success(function(r) {
			$scope.goAbleFlag=false;
			if (r.status < 400) {
			   alert("提交成功！");
			   $('#confirm8').modal('hide');
			   getList(getOptions());
			   }else{
				alert("提交失败！");
			}
		});
	}
	
	//view 3d
	$scope.viewDeliveryService=function(needs_id,status){
		schemeService.viewDelivery({needs_id:needs_id,designer_id:""}).success(function(r) {
			if (r.status < 400) {
				var asset_id;
				for(var i=0;i<r.deliveryFiles.length;i++){
					
					if(r.deliveryFiles[i].usage_type=="10"){
						asset_id=r.deliveryFiles[i].id;
						break;
					}
				}
				if(asset_id){
					schemeService.getHsPrints({asset_id:asset_id,needs_id:needs_id}).success(function(r) {
						if(r.status<400){
							if(r.hs_designer_uid){
								var url=baseUrl+"/3Dscheme/open3Dscheme/hs_design_id/"+r.hs_design_id+"/acs_asset_id/"+asset_id+"/acs_project_id/"+needs_id+"/";
								window.open(url); 
							}
						}
					});	
				}
			}
		});
	};
    
	
	//Enlarge picture 
	var isInit = false;
	$scope.enlargePicture=function(type){
		$scope.type=type;
		$(document).ready(function() {
			var obj = setInterval(function() {
				if($('.pgwSlideshow').is(':visible')) {
					clearInterval(obj);
					$('.pgwSlideshow').pgwSlideshow();
					
					if(!isInit) {
						isInit = true;
					} else {
						$('.pgwSlideshow .ps-list .ps-current').remove();
					}
					
					var hd = $(window).height()+'px';
					$('#windowImg .windowImages').css({"height":"hd"});
					$('#windowImg .qp-ps-caption').css({"display":"none"});
					$(document).on('click','.qp-ps-caption',function(){
						setTimeout('$(window).resize()', 10);
					})
					$('#windowImg .pgarrow').css({"display":"block","cursor":"pointer"});
					$('#windowImg .windowImages .ps-current').css({"minHeight":"80vh"});
					$('#windowImg .windowImages .ps-current ul li img').css({"width":"60%"});
					var k = false;
					$(document).on("click","#windowImg .pgarrow img",function(){
						var Iw = $('.ps-current ul img').width()+'px';
						var Ih = $('.ps-current ul img').height()+'px';
						if( k == false ){
							$(this).attr("src","${baseUrl}/images/global/pgarrow02.png");
							$('#windowImg .ps-list').stop().slideUp();
							$('#windowImg ul .ps-current img').css({"width":"80%","height":"80%"});
							k = true;
						}else{
							$(this).attr("src","${baseUrl}/images/global/pgarrow01.png");
							$('#windowImg .ps-list').stop().slideDown();
							$('#windowImg ul .ps-current img').css({"width":"Iw","height":"Ih"});
							k = false;
						}
					})
				}
			}, 10);
		});
	};
});

// beishuOrderCtrl controller
app.controller('beishuOrederCtrl', function($scope,orderService,userCenterService,page,$filter,schemeService) {

	$scope.orders = [];
	$scope.detail = "";
    
    $scope.page = page.init();
	
	//page 
	$scope.page.set_val('go_page', function(page) {
		var data = getOptions();
		data.page = data.pageSize * (page - 1);
		getList(data);
	});
	
	function getList(data) {
		$('#loadingMask').css({'display':'block'});
		orderService.getBeishuOrderlist(data).success(function(r) {
			if (r.status < 400) {
				console.log(r);
				$scope.orders = r.beishu_needs_order_list;
				$scope.conf = {
						currentPage : r.offset + 1,
						totalItems : r.count,
						itemsPerPage :20
				};
				
			} else {
				//alert("请求失败!");
			}
			$('#loadingMask').css({'display':'none'});
		});
	}

	function getOptions() {
		var op = {
			page : 0,
			pageSize : 20
		}
		return op;
	}

	getList(getOptions());

	// View requirements details page
	$scope.orderDetail = function(needs_id) {
		var datas = {};
		var datas = {
			needs_id : needs_id
		};
		$('#loadingMask').css({'display':'block'});
		orderService.getmybiddetail(datas).success(function(r) {
			if (r.status < 400) {
				console.log(r);
				$scope.detail = r;
			}
			$('#loadingMask').css({'display':'none'});
		});
	}
	
	//get getAsset ID
	$scope.getAsset=function(needs_id){
		schemeService.get3DAssetid({needs_id:needs_id}).success(function(r){
			var hs_design_id=0;
			if(r.status<400){ 
				console.log(r);
				if(r.hs_design_id){
					hs_design_id=r.hs_design_id;
				}
				var url=baseUrl+"/3Dscheme/open3Dscheme/hs_design_id/"+hs_design_id+"/acs_asset_id/"+r.design_asset_id+"/acs_project_id/"+needs_id+"/";
				window.open(url);  
			}
		});
	}
	
});

// myorder controller
app.controller('myorderdetailCtrl', function($scope, $routeParams,
		userCenterService, orderService, designerService) {
	$scope.detail = [];
	var data = {
		need_id : $routeParams.id,
		status : $routeParams.status,
	}

	function getOrderDetail(data) {
		$('#loadingMask').css({'display':'block'});
		userCenterService.getMemberDemandList(data).success(function(r) {
			// alert(r.status);
			if (r.status < 400) {
				$scope.detail = r;
			}
			$('#loadingMask').css({'display':'none'});
		});
	}
	orderService.getMemberDemandList(data).success(function(r) {
		if (r.status < 400) {
			$scope.detail = r;
		}
	});

	// get home improvement order detail designer list
	$('#loadingMask').css({'display':'block'});
	userCenterService.orderDetailDesignerList(data).success(function(r) {
		if (r.status < 400) {
			$scope.order = r.bidder_list;
		}
		$('#loadingMask').css({'display':'none'});
	});
	//getOrderDetail(data);
	
	$scope.getDCDtail = function(case_id){
		var data = {
				case_id : case_id	
		};

		$('#loadingMask').css({'display':'block'});
		designerService.getDesignerOderCaseDetail(data).success(function(r) {
		if (r.status < 400) {
			$scope.caseDetail = r;
		}
		else{
			//alert("get data fail");
		}
		$('#loadingMask').css({'display':'none'});
	});
		
	}

});
// target controller
app.controller('targetsCtrl', function($scope, $routeParams, orderService) {

	$scope.targets = [];
	var data = {
		id : $stateParams.id,
		status : $stateParams.status,
	}
	// get my order detail
	orderService.getMyOrederDetail(data).success(function(r) {
		if (r) {
			$scope.targets = r;
		}
	});
});
// im controller
app.controller('imCtrl', function($scope) {

});

// getMemberNeeds controller
app.controller('getMemberNeedsCtrl', function($scope, orderService) {
	$scope.order = [];
	var data = {}
	// get member needs list
	orderService.getMemberNeeds(data).success(function(r) {
		if (r) {

		}
	});
});

// mydiy controller
app.controller('mydiyCtrl', function($scope,schemeService,page) {
	$scope.mydiy = [];    
    $scope.page = page.init();
	
	//page 
	$scope.page.set_val('go_page', function(page) {
		var data = getOptions();
		data.page = data.pageSize * (page - 1);
		getList(data);
	});
	
	function getList(data) {
		$('#loadingMask').css({'display':'block'});
		schemeService.mySchemelist(data).success(function(r) {
			if (r.status < 400) {
				console.log(r);
				$scope.mydiy = r.three_imensional_list;
				$scope.conf = {
						currentPage : r.offset + 1,
						totalItems : r.count,
						itemsPerPage :15
				};
			} else {
				alert("请求失败!");
			}
			$('#loadingMask').css({'display':'none'});
			
		});
	}

	function getOptions() {
		var op = {
			page : 0,
			pageSize :15
		}
		return op;
	}

	getList(getOptions());
});
// mybidlist controller
app.controller('mybidlistCtrl', function($scope, orderService,page) {
	$scope.mybidlist = [];
	 $scope.page = page.init();
		//page 
		$scope.page.set_val('go_page', function(page) {
			var data = getOptions();
			data.page = data.pageSize * (page - 1);
			getList(data);
		});
	// get member needs list
		function getList(data) {
			$('#loadingMask').css({'display':'block'});
			orderService.getmybidlist(data).success(function(r) {
				if (r.status < 400) {
					$scope.mybidlist = r.bidding_needs_list;
					$scope.conf = {
							currentPage : r.offset + 1,
							totalItems : r.count,
							itemsPerPage : 10
					};
				}if(r.count<=0){
			    	$('#noMatch').css({'display':'block'});
			    }else{
			    	$('#noMatch').css({'display':'none'});
			    }
				$('#loadingMask').css({'display':'none'});
			});
		}
	// mybidDetail
	$scope.mybidDetail = function(needs_id) {
		$scope.mybiddetail = [];
		var data = {
			needs_id : needs_id
		}
		// get mybiddetail
		$('#poploading').css({'display':'block'});
		orderService.getmybiddetail(data).success(function(r) {
			if (r.status < 400) {
				$scope.mybiddetail = r;
			}
			$('#poploading').css({'display':'none'}); 
		});
	}
	$scope.needs_id="";
	$scope.saveneedsid=function(needs_id){
		$scope.needs_id=needs_id;
	}
	//desiger stop mark
	$scope.stopMark=function(){
		console.log("$scope.needs_id"+$scope.needs_id);
		var data={
				needs_id:$scope.needs_id
		}
		orderService.stopmark(data).success(function(r){
			if(r.status<400){
				alert("您已终止应标");
				location.href = baseUrl + "/user/index#mybidlist";
			}
		});
	}
	
	function getOptions() {
		var op = {
			page : 0,
			pageSize : 10
		}
		return op;
	}

	getList(getOptions());
	
});

// user center my page controller
app.controller('mypageCtrl', function($scope, caseService, designerService,userCenterService) {

	// get designer detail
	$scope.isChecked=false;
	$scope.selectedTags = [];
	$('#loadingMask').css({'display':'block'});
	designerService.getDesignerDetail().success(function(r) {
		if (r.status < 400) {
			$scope.selfIntroduce = r.designer.self_introduction;
			$scope.certificateAward = r.designer.personal_honor;
			$scope.workAge = r.designer.design_experience;
			$scope.amountRoomMoney = r.designer.measure_price;
			$scope.designMoneyMin = r.designer.design_price_min;
			$scope.designMoneyMax = r.designer.design_price_max;
			
			var style=r.designer.styles == null ? "" : r.designer.styles ;
			$scope.selectedTags=style.split(","); 
			for (var i = 0; i < $scope.selectedTags.length; i++) {
				if($scope.selectedTags[i]=='日式风格'){
					$scope.Japanese=true;
				}else if($scope.selectedTags[i]=='韩式风格'){
					$scope.Korean=true;
				}else if($scope.selectedTags[i]=='混搭风格'){
					$scope.Mashup=true;
				}else if($scope.selectedTags[i]=='欧式风格'){
					$scope.European=true;
				}else if($scope.selectedTags[i]=='中式风格'){
					$scope.Chinese=true;
				}else if($scope.selectedTags[i]=='新古典风格'){
					$scope.NewClassical=true;
				}else if($scope.selectedTags[i]=='东南亚风格'){
					$scope.SoutheastAsia=true;
				}else if($scope.selectedTags[i]=='美式风格'){
					$scope.American=true;
				}else if($scope.selectedTags[i]=='田园风格'){
					$scope.Pastoral=true;
				}else if($scope.selectedTags[i]=='地中海风格'){
					$scope.MediterraneanSea=true;
				}else if($scope.selectedTags[i]=='现代风格'){
					$scope.Modern=true;
				}else if($scope.selectedTags[i]=='其他风格'){
					$scope.Other=true;
				}
			}
		}
		$('#loadingMask').css({'display':'none'});
	});

	// dispose style
	var updateSelected = function(action, name) {
		if (action == 'add'&& $scope.selectedTags.length<5) {
			$scope.selectedTags.push(name);
		}else{
			for (var i = 0; i < $scope.selectedTags.length; i++) {
				if($scope.selectedTags[i]==name){
					//console.log("删除前"+$scope.selectedTags);
					$scope.selectedTags.splice(i,i+1);
					//console.log("删除后"+$scope.selectedTags);
				}
			}
		}
	}

	$scope.updateSelection = function($event) {
		var checkbox = $event.target;
		//console.log("添加、删除"+checkbox.checked);
		var action = (checkbox.checked ? 'add' : 'remove');
		updateSelected(action, checkbox.name);
	}


	// My homepage information submitted
	$scope.submit = function() {
		var selfIntroduce = $scope.selfIntroduce;
		var certificateAward = $scope.certificateAward;
		var workAge = $scope.workAge;
		var amountRoomMoney = $scope.amountRoomMoney;
		var designMoneyMin = $scope.designMoneyMin;
		var designMoneyMax = $scope.designMoneyMax;
		var style="";
		for (var i = 0; i < $scope.selectedTags.length; i++) {
			style+=$scope.selectedTags[i]+",";
			//console.log("循环内style"+style);
		}
		//console.log(style);
		var data = {
			selfIntroduce : selfIntroduce,
			certificateAward : certificateAward,
			workAge : workAge,
			amountRoomMoney : amountRoomMoney,
			designMoneyMin : designMoneyMin,
			designMoneyMax : designMoneyMax,
			style:style
		}
		// update designer detail info
		designerService.updateDesignerDetail(data).success(function(r) {
			if (r.status < 400) {
				alert("更新成功");
				$scope.selfIntroduce="";
				$scope.certificateAward="";
				$scope.workAge="";
				$scope.amountRoomMoney="";
				$scope.designMoneyMin="";
				$scope.designMoneyMax="";
				$scope.isChecked=false;
				$scope.selectedTags = [];
				$scope.Japanese=false;
				$scope.Other=false;
				$scope.Modern=false;
				$scope.MediterraneanSea=false;
				$scope.Pastoral=false;
				$scope.American=false;
				$scope.SoutheastAsia=false;
				$scope.NewClassical=false;
				$scope.Chinese=false;
				$scope.European=false;
				$scope.Mashup=false;
				$scope.Korean=false;
			}
		});
	}

	// get my thridD design
	$scope.myDesignThridD = function() {

	}

	$scope.myCase = function() {
		//alert("0 : " + designer_id);
		var data = {
			
		}

		$('#loadingMask').css({'display':'block'});
		designerService.getDesignerCaseList(data).success(function(r) {
			if (r.status < 400) {
				$scope.List = r;

				$scope.caseList = r.cases;
			
			} else {

				alert("get data fail");
			}
			$('#loadingMask').css({'display':'none'});
		});
	}


	$scope.detial = function(case_id){
		var data={
				case_id : case_id
		}
		userCenterService.getDesignerCaseDetail(data).success(function(r) {
			if (r.status < 400) {
				$scope.title = r.title;
				$scope.description = r.description;
				$scope.community_name = r.community_name;
				$scope.room_area = r.room_area;
				$scope.project_style = r.project_style;
				$scope.prj_price = r.prj_price;
				$scope.case_color = r.case_color;
				$scope.case_id = case_id;
				
				var room_type = r.room_type.split('-');
				var room = room_type[0];
				var living_room = room_type[1];
				var toilet = room_type[2];
		
				$('#sss_province').val(r.province).trigger('change');
				$('#sss_city').val(r.city).trigger('change');
				$('#sss_county').val(r.district);
				$scope.room = room;
				$scope.living_room = living_room;
				$scope.toilet = toilet;
			}
			else{
				alert("数据请求有误");
			}
		});
	}
	


});

// myhomestylerCtrl controller
app.controller('my3DSchemeCtrl', function($scope,schemeService, page) {
	var types;
	$scope.schemeList = [];
    
	$scope.page = page.init();
	$scope.conf = {};
	
	//page 
	$scope.page.set_val('go_page', function(page) {
		var data = getOptions();
		data.page = data.pageSize * (page - 1);
		if(types==1||types==""){
		   data.status='bound';
		}else if(types==2){
		   data.status='unbound';	
		}
		getBoundList(data);
	});
	
	// Get your own design
	function getBoundList(data) {
		$('#loadingMask').css({'display':'block'});
		schemeService.getSchemeList(data).success(function(r) {
			if (r.status < 400) {
				if(r.type=='bound'){
					$scope.schemeList = r.needs_list;
					if(r.count<=0){
				    	$('#noMatch').css({'display':'block'});
				    }else{
				    	$('#noMatch').css({'display':'none'});
				    }
				}else{
					$scope.schemeList = r.three_imensional_list;
					if(r.count<=0){
				    	$('#noMatch1').css({'display':'block'});
				    }else{
				    	$('#noMatch1').css({'display':'none'});
				    }
				}
				
				$scope.conf = {
						currentPage : r.offset + 1,
						totalItems : r.count,
						itemsPerPage : 15
				};
			}
			$('#loadingMask').css({'display':'none'});
		});
	}

	function getOptions() {
		var op = {
			page : 0,
			pageSize :15,
			status:'bound'
		}
		return op;
	}
	getBoundList(getOptions());	
	
	//Bound and unbound 3D switch 3D scheme 
	$scope.switchs=function(type){
		var data = getOptions();
		types=type;
		if(type==1){
			$scope.schemeList='';
			$scope.conf={};
			data.status='bound';
			getBoundList(data);
		}else{
			$scope.conf={};
			$scope.schemeList='';
			data.status='unbound';	
			getBoundList(data);
		}
	};
});

// myhomestyler2Ctrl controller
app.controller('my3DSchemeDetailCtrl', function($scope, schemeService,
		$routeParams) {
	$scope.schemeList = [];

	var needs_id = $routeParams.id;

	// Get your own design
	$('#loadingMask').css({'display':'block'});
	schemeService.schemeDetaillist(data).success(function(r) {
		if (r.status < 400) {
			$scope.schemeList = r;
		}
		$('#loadingMask').css({'display':'none'});
	});

	// Delete facility plan
	$scope.deleteDiy = function(id) {
		schemeService.deleteScheme({
			id : id
		}).success(function(r) {
			if (r.status < 400) {
				alert("删除成功！");
			} else {
				alert("删除失败！");
			}
		});
	};

	// edit facility plan
	$scope.editDiy = function(id) {

		var name = $scope.name;
		schemeService.editScheme({
			id : id,
			name : name
		}).success(function(r) {
			if (r.status < 400) {
				alert("编辑成功！");
			} else {
				alert("编辑失败！");
			}
		});
	};

	// binding facility plan
	$scope.binding = function(id) {
		var needs_id = $scope.needs_id;
		schemeService.binding({
			id : id,
			needs_id : needs_id
		}).success(function(r) {
			if (r.status < 400) {
				alert("绑定成功！");
			} else {
				alert("绑定失败！");
			}
		});
	}
});
// mymoneyCtrl controller
app.controller('mymoneyCtrl', function($scope, paymentService,page) {
	$scope.page = page.init();
	$scope.withdrawalRecordList = [];
	$scope.transactionRecordList=[];
	var types;
	//page 
	$scope.page.set_val('go_page', function(page) {
		var data = getOptions();
		data.page = data.pageSize * (page - 1);
		if(types==2){
			grtWithdrawalRecordList(data);
		}else{
			getList(data);
		}
	});
	
	
	//get designer account  info
	$scope.designerMoneyInfo = [];
	paymentService.getMyMoneyInfo({}).success(function(r) {
		if (r.status < 400) {
			$scope.designerMoneyInfo=r;
		}
	});
	
	//get Transaction record list
	function getList(data){
		paymentService.transactionRecordInfo(data).success(function(r){
			if(r.status<400){
				$scope.transactionRecordList=r.designer_trans_list;
				$scope.conf = {
						currentPage : r.offset + 1,
						totalItems : r.count,
						itemsPerPage : 10
				};
				 if(r.count<=0){
				    	$('#noMatch').css({'display':'block'});
				    }else{
				    	$('#noMatch').css({'display':'none'});
				    }
			}
		});
	}
	function getOptions() {
		var op = {
			page : 0,
			pageSize : 10
		}
		return op;
	}

	getList(getOptions());
	
	function grtWithdrawalRecordList(data){
		paymentService.withdrawalRecordInfo(data).success(function(r) {
			if (r.status < 400) {
				$scope.withdrawalRecordList = r.translog_list;
				$scope.conf = {
						currentPage : r.offset + 1,
						totalItems : r.count,
						itemsPerPage : 10
				};
			}
		});
	}
	
	
	$scope.switchs=function(type){
		types=type;
		$scope.conf={};
		if(type==1){
			getList(getOptions());
		}else{
			grtWithdrawalRecordList(getOptions());
		}
	}
});
// drawcashCtrl controller
app.controller('drawcashCtrl', function($scope,  paymentService) {
	//get designer account  info
	$scope.isShow=false;
	$scope.OK=false;
	$scope.disable=true;
	$scope.designerMoneyInfo = [];
	paymentService.getMyMoneyInfo({}).success(function(r) {
		if (r.status < 400) {
			$scope.designerMoneyInfo=r;
			if(r.account_user_name!=null&&r.account_user_name!=""&&r.account_user_name!=undefined){
				$scope.isShow=true;
				$scope.account_user_name=r.account_user_name;
				$scope.bank_name=r.bank_name;
				$scope.branch_bank_name=r.branch_bank_name;
				$scope.deposit_card=r.deposit_card;
			}else{
				$scope.disable=false;
			}
		}
	});
	
	$scope.updateBankCardInfo=function(){
		$scope.disable=false;
		$scope.account_user_name="";
		$scope.bank_name="";
		$scope.branch_bank_name="";
		$scope.deposit_card="";
	}
	
	$scope.submit=function(){
		$scope.flag=false;
		var account_user_name=$scope.account_user_name;
		var name=/^[\u4e00-\u9fa5]{2,10}$/;
		if(!account_user_name){
			
			$("html").css({'overflow':'auto'});
			$('.modal-backdrop').remove();
			$("#lastname").attr('style','border: 1px red solid');
			$("#lastname").next().text('请填写开户人姓名').removeClass('state1 state4').addClass('state2 state3');
			return false;
		}else{
			if(!name.test(account_user_name)){
				$("html").css({'overflow':'auto'});
				$('.modal-backdrop').remove();
				alert("用户名格式错误，重新填写信息！");
				return false;
			}
		}
		var bank_name=$scope.bank_name;
		if(!bank_name){
			$("html").css({'overflow':'auto'});
			$('.modal-backdrop').remove();
			$('#bank').attr('style','border: 1px red solid !important');
			$('#bank').next().text('请选择开户银行').removeClass('state1 state4').addClass('state2 state3');
			return false;
		}
		var branch_bank_name=$scope.branch_bank_name;
		 var bankname=/^[\u4e00-\u9fa5]{2,32}$/;
		if(!branch_bank_name){
			
			$("html").css({'overflow':'auto'});
			$('.modal-backdrop').remove();
			$('#bankname').attr('style','border: 1px red solid');
			$('#bankname').next().text('请填写支行名称').removeClass('state1 state4').addClass('state2 state3');
			return false;
		}else{
			if(!bankname.test(branch_bank_name)){
				$("html").css({'overflow':'auto'});
				$('.modal-backdrop').remove();
				alert("支行名称格式错误，重新填写信息！");
				return false;
			}
		}
		var deposit_card=$scope.deposit_card;
		var num=/^\d{19}$/;
		if(!deposit_card){
			$("html").css({'overflow':'auto'});
			$('.modal-backdrop').remove();
			$("#banknum").attr('style','border: 1px red solid');
			$('#banknum').next().text('请填写银行卡号').removeClass('state1 state4').addClass('state2 state3');
			return false;
		}else{
			if(!num.test(deposit_card)){
				$("html").css({'overflow':'auto'});
				$('.modal-backdrop').remove();
				alert("银行卡号格式错误，重新填写信息！");
				return false;
			}
		}
		//var amount=$scope.amount;
		var data={
				account_user_name:account_user_name,	
				bank_name:bank_name,
				branch_bank_name:branch_bank_name,
				deposit_card:deposit_card
				//amount:amount
		}
		$scope.aaaa=true;
		paymentService.submitDesignerBankCardInfo(data).success(function(r){
			if(r.status<400){
				$scope.aaaa=false;
				$scope.OK=true;
			}else{
				$scope.aaaa=false;
				alert("提现申请发送失败，请再次提交");
			}
		});
	}
	
	$scope.gotomymoney=function(){
		$("html").css({'overflow':'auto'});
		$('.modal-backdrop').remove();
		 location.href="#/mymoney"
	}
});


//securityCenterCtrl
app.controller('securityCenterCtrl',function($scope){
	
});
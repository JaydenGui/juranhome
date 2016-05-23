completeNum = 0;
myBidAll = [];
myBidSuccess = [];
myBidFail = [];



function requestComplete() {
	$(window).scrollTop(0);
	$(window).resize();
	$('#loading').css({'display':'none'});
	enableScroll();
	completeNum++;
}

$(function() {
	disableScroll();
});

var app = angular.module('app', ['appService', 'helper']);
//seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title = "设计家在线设计平台";
	$scope.keywords = "设计家在线设计平台";
	$scope.description = "设计家在线设计平台";
});
//body controller
app.controller('ctrl', function($scope,designerService,orderService,schemeService,memberService,$filter,messageService) {
		
	$scope.userTypeNav=true;
	$scope.designer=[];
	$scope.designerInfo=[];
	$scope.needsList=[];
    $scope.beishuOrder=[];
    $scope.mybidlist=[];
	
    //====================message start author shx======================
	 $scope.message=messageService;
	//==================message end===================
	
  //Get designer info
    $('#loading').css({'display':'block'});
    memberService.getMemberInfo().success(function(r) { //get userData
		if (r.status<400) {
			$scope.designer = r;
		}
	});
	//Get designer information 
    $('#loading').css({'display':'block'});
	designerService.getDesignerDetail({}).success(function(r) { //get userData
		if (r.status<400) {
			$scope.designerInfo = r;
		}
	});
	
	//get needs order
	function orderList(){
		orderService.getDesignersOrderlist({page:0,pageSize:10}).success(function(r){
			if(r.status<400){
				$scope.needsList =r.order_list;
			}
			if(r.count<=0){
		    	$('#noMatchOrder').css({'display':'block'});
		    }else{
		    	$('#noMatchOrder').css({'display':'none'});
		    }
			completeNum == 2 ? (requestComplete()) : (completeNum++);
		});
	}
	orderList();
	//get member needs list
	function mybidList(data){
		orderService.getmybidlist(data).success(function(r){
			if(r.status<400){
				$.each(r.bidding_needs_list, function(index, item) {
					if(myBidAll.length < 10 && item.bidder && item.bidder.status)
						myBidAll.push(item);
					if(myBidSuccess.length < 10 && item.bidder && item.bidder.status && item.bidder.status === 1) 
						myBidSuccess.push(item);
					if(myBidFail.length < 10 && item.bidder && item.bidder.status && item.bidder.status === 2) 
						myBidFail.push(item);
				});

				$scope.mybidlist=myBidAll;
			}
			if(r.count<=0){
		    	$('#noMatchMark').css({'display':'block'});
		    }else{
		    	$('#noMatchMark').css({'display':'none'});
		    }
			completeNum == 2 ? (requestComplete()) : (completeNum++);
		});
	}
	
	mybidList({page:0,pageSize:50});
	
	
	//View requirements details page 
	$scope.orderDetail=function(needs_id){	
		$('#poploading').css({'display':'block'});
		var datas={
		   needs_id:needs_id
		};
		orderService.getmybiddetail(datas).success(function(r){
			if(r.status<400){
				console.log('bigdetail');
				$scope.detail = r;
				datas={};
				$('#poploading').css({'display':'none'});
			}
		});
	}
	
	
	//Get beishu order 
	orderService.getBeishuOrderlist({page:0,pageSize:10}).success(function(r){
		if(r.status<400){
			$scope.beishuOrder =r.beishu_needs_order_list;
		}
		if(r.count<=0){
	    	$('#noMatchBeishu').css({'display':'block'});
	    }else{
	    	$('#noMatchBeishu').css({'display':'none'});
	    }
		completeNum == 2 ? (requestComplete()) : (completeNum++);
	});
	
	$scope.searchbid=function(type){
		if(type == 1) 
			$scope.mybidlist=myBidAll;
		else if(type == 2)
			$scope.mybidlist=myBidSuccess;
		else 
			$scope.mybidlist=myBidFail;
		
		$(window).trigger('scroll').trigger('resize');
	};

	//Designers reject consumers real 
	$scope.refuse = function(needs_id){
		var data={
		    needs_id:needs_id
		};
		orderService.refused(data).success(function(r) {
			if (r.status < 400) {
				alert("拒绝量房成功！");
				orderList();
			}else{
				alert("拒绝量房失败！");
			}
		});
	}
	
	//Confirmation of the volume of housing
	$scope.confirm=function(needs_id){
		var datas={
			needs_id:needs_id	
		};
		orderService.confirm(datas).success(function(r) {
			if (r.status < 400) {
				alert("操作成功！");
				$("html").css({'overflow':'auto'});
				$('.modal-backdrop').remove();
				orderList();
			}else{
				alert("操作失败！");
				$("html").css({'overflow':'auto'});
				$('.modal-backdrop').remove();
			}
		});
	}
	
	//Designers create contracts
	var design_contract_data;
	var orderStatus;
	$scope.createContract=function(needs_id,status,designer_id,member_id,design_contract){
        
		//alert(needs_id+"|"+status+"|"+designer_id+"|"+member_id);
		design_contract_data=design_contract;
		orderStatus=status;
		$scope.needs_id=needs_id;
	    $scope.memberInfo=getMemberInfo(designer_id);
		$scope.status=status;
		$scope.totalDesign="";
		$scope.designFirst="";
		$scope.contract_Data="";
		$scope.impression="";
		$scope.diy="";
		$scope.price="";
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
				$("#contract2").modal("hide");
				orderList();
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
							
							if(r.design_file[i].type==3){
								$scope.is_designdrawing=true;
							}
							
							if(r.design_file[i].type==0){
								$scope.is_bom=true;
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
			
			if(!forageList_id){
				$scope.goAbleFlag=false;
				alert("材料清单");
				return false;
			}
			
			fell_ids=forageList_id+bom_id;
		}
		
		if(!designdrawing_id){ 
			alert("请选择设计图纸");
			$scope.goAbleFlag=false;
			return false;
		}
			
		fell_ids+=designdrawing_id;
		
		var data={
		    needs_id:needsId,
		    type:submitType,
		    hs_design_id:hs_design_id,
		    asset_id:design_asset_id,
		    fell_ids:fell_ids
		}
		
		schemeService.designDelivery(data).success(function(r) {
			$scope.goAbleFlag=true;
			if (r.status < 400) {
			   alert("提交成功！");
			   $('#confirm8').modal('hide');
			   orderList();
			}else{
				alert("提交失败！");
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

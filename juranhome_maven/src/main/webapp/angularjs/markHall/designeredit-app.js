var app = angular.module('app', ['appService', 'helper']);
//seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
});
//body controller
app.controller('ctrl', function($scope,designerService,messageService) {
	
	var diy_count="";
	var case_count="";
	var theme_pic="";
	
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
	
	// get designer detail
	$scope.selectedTags = [];
	$('#loadingMask').css({'display':'block'});
	designerService.getDesignerDetail().success(function(r) {
		if (r.status < 400) {
			$scope.designerInfo=r;
			$scope.introduction = r.designer.introduction;
			$scope.personal_honour = r.designer.personal_honour;
			$scope.experience = r.designer.experience;
			if(r.designer.measurement_price==null){
				$scope.measurement_price =0;
			}else{
				$scope.measurement_price = r.designer.measurement_price;
			}
			$scope.design_price_min = r.designer.design_price_min;
			$scope.design_price_max = r.designer.design_price_max;
			$scope.design_price = r.designer.design_price_min+"-"+r.designer.design_price_max;
			diy_count=r.designer.diy_count;
			case_count=r.designer.case_count;
			theme_pic=r.designer.theme_pic;
			
			var style=r.designer.style_long_names == null ? "" : r.designer.style_long_names ;
			if(style!=null){
				if(style.substr(0,1) == ",")
					style = style.substr(1);
				$scope.selectedTags=style.split(","); 
				var checkItems = $(".green");
				var selectedStyle = "," + style + ",";
				for(i = 0; i < checkItems.length; i++){
					if(selectedStyle.indexOf(',' + $(checkItems[i]).attr('name') + ',') > -1){
						$(checkItems[i]).prop('checked', 'checked');
					}
				}
			}
		}
		$('#loadingMask').css({'display':'none'});
	});
	$scope.array=[];
	// My homepage information submitted
	$scope.submit = function() {
		var introduction = $scope.introduction;
		var personal_honour = $scope.personal_honour;
		var experience = $scope.experience;
		var measurement_price = $scope.measurement_price;
		var design_price_min = $scope.design_price_min;
		var design_price_max = $scope.design_price_max;
		var design_price = $scope.design_price;
		$scope.array=design_price.split("-");
		var design_price_min=$scope.array[0];
		var design_price_max=$scope.array[1];
		var checkItems = $(".green");
		$scope.selectedTags.length = 0;
		for(i = 0; i < checkItems.length; i++){
			if($(checkItems[i]).prop('checked'))
			$scope.selectedTags.push($(checkItems[i]).attr('name'));
		}
		if(measurement_price.length<=0){
			$("#relatedFee").addClass("error");		
			$("#relatedFee").parent("div").find(".de-check-tip").css("display","block");
			$("#relatedFee").focus();
			return;
		}else{
			var rf_reg= /^\d{0,6}$|^\d{0,6}\.\d{1,2}$/;
			if(!rf_reg.test($("#relatedFee").val())){
				$("#relatedFee").addClass("error");		
				$("#relatedFee").parent("div").find(".de-check-tip").css("display","block");
				$("#relatedFee").focus();
				return;
			}
		}
		if(document.getElementById("fee").selectedIndex == 0){
			$("#fee").addClass("error");		
			$("#fee").parent("div").find(".de-check-tip").css("display","block");
			$("#fee").focus();
			return;
		}
		var data = {
			introduction : introduction,
			personal_honour : personal_honour,
			experience : experience,
			measurement_price : measurement_price,
			design_price_min : design_price_min,
			design_price_max : design_price_max,
			style:$scope.selectedTags.join(","),
			diy_count:diy_count,
			case_count:case_count,
			theme_pic:theme_pic
		}
		// update designer detail info
		$('#save').attr('disabled',true);
		designerService.updateDesignerDetail(data).success(function(r) {
			if (r.status < 400) {
				alert("保存成功");
				location.href=location.href;
			}else{
				alert("信息更新失败");
				$('#save').attr('disabled',false);
			}
			//$('#loadingMask').css({'display':'none'});
		});

	}
	


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

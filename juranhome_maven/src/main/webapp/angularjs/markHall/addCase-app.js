var app = angular.module('app', ['appService', 'helper']);
//seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
});
//body controller
app.controller('ctrl', function($scope,caseService,$filter,designerService,orderService,userCenterService,memberService,messageService){
	var case_id=$filter('getQueryString')("caseid");
	var status=$filter('getQueryString')("status");
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
	//Get designer information 
	designerService.getDesignerInfo({designer_id:0}).success(function(r) { //get userData
			if (r.status<400) {
				//console.log(r);
				$scope.designerInfo = r;
			}
	 });
	//==============getDesignerCaseDetail start====================
	userCenterService.getDesignerCaseDetail({case_id:case_id,status:status}).success(function(r) {
		if(r.status<400){
			$scope.data = r;
			$scope.title = r.title;
			$scope.city = r.city;
			$scope.district = r.district;
			$scope.province = r.province;
			$scope.description = r.description;
			$scope.room_type = r.room_type;
			$scope.restroom = r.restroom;
			$scope.bedroom = r.bedroom;
			$scope.room_area = r.room_area;
			$scope.project_style = r.project_style;
			$scope.prj_price = r.prj_price;
			$scope.house_style = r.house_type;
			$scope.community_name = r.community_name;
			$scope.files = r.images;
			$scope.protoImg = r.images;
			$scope.status = status;
			$scope.caseId = case_id;
			$('#seachprov').val(r.province).trigger('change');
			$('#seachcity').val(r.city).trigger('change');
			$('#seachdistrict').val(r.district);
			
			//-------------------------------------------------
		}
	 });
	//==============getDesignerCaseDetail end====================
	validate();
});

	validate = function(){
		// Release requirements form validation 发布需求验证
		 $(function(){
			var reg = /^[1-9]\d*$/;
			var errorMsg = '';
			
			var valiLength = function($this, minLen, maxLen, error) {
				if($this.val() !='' && $this.val().length >= minLen && $this.val().length <= maxLen){
					$this.next().text('输入成功').removeClass('state1').addClass('state4');
					$this.css({"border": "1px #eaeaea solid","border-radius":"5px!important"});
					return true;
				} 
				
				$this.next().text(error).removeClass('state1').addClass('state3');
				$this.css({"border": "1px red solid","border-radius":"5px!important"});
				errorMsg.length <= 0 ? (errorMsg = error) : (null);
				
				return false;
			};
			
			var valiNum = function($this, error) {
				if($this.val()>0){
					$this.next().text('输入成功').removeClass('state1').addClass('state4');
					$this.css({"border": "1px #eaeaea solid","border-radius":"5px!inportant"});
					return true;
				}

				$this.next().text('请输入大于0的数字').removeClass('state1').addClass('state3');
				$this.css({"border": "1px red solid","border-radius":"5px!important"});
				errorMsg.length <= 0 ? (errorMsg = error) : (null);
				
				return false;
			};
			var valiNum1 = function($this, error) {
				if(reg.test($this.val())){
					$this.next().text('输入成功').removeClass('state1').addClass('state4');
					$this.css({"border": "1px #eaeaea solid","border-radius":"5px!inportant"});
					return true;
				}

				$this.next().text('请输入0-9999的整数').removeClass('state1').addClass('state3');
				$this.css({"border": "1px red solid","border-radius":"5px!important"});
				errorMsg.length <= 0 ? (errorMsg = error) : (null);
				
				return false;
			};
			
			var valiSel = function($this, error, checkZero) {
				if((checkZero && $this.val() > 0) || (!checkZero && $this.val().length > 0)) {
					$this.attr('style', 'border: 1px #eaeaea solid');
					return true;
				}
				
				$this.attr('style', 'border: 1px red solid');
				errorMsg.length <= 0 ? (errorMsg = error) : (null);
				
				return false;
			};
			
			var valiCaseName = function() {				
				return valiLength($('input[name="pro-name"]'), 2, 12, '案例名称长度应在2-12个字');
			};
			
			var valiProvince = function() {
				return valiSel($('select[name="s_province"]'), '请输入完整的项目地址', true);
			}
			
			var valiCity = function() {
				return valiSel($('select[name="s_city"]'), '请输入完整的项目地址', true);
			}
			
			var valiCounty = function() {
				var districtCount = document.getElementById('seachdistrict').options.length;
				if(districtCount > 1)
				{
					return valiSel($('select[name="s_county"]'), '请输入完整的项目地址', true);
				}
				else
				{
					return true;
				}
			}
			
			var valiShouse = function() {
				return valiSel($('select[name="s_house"]'), '请输入室', false);
			}
			
			var valiThouse = function() {
				return valiSel($('select[name="t_house"]'), '请输入厅', false);
			}
			
			var valiWhouse = function() {
				return valiSel($('select[name="w_house"]'), '请输入卫', false);
			}
			
			var valieDwellingArea = function() {
				return valiNum($("#dwelling-area"), '面积请输入大于0的数字');
			};
			
			var valiHouseStyle = function() {
				return valiSel($('select[name="house-style"]'), '请输入房屋类型', false);
			}
			
			var valiPrjPrice = function(){
				return valiNum1($("#project-price"), '项目报价请输入0-9999的整数');
			}
			
			var valiStyle = function(){
				return valiSel($('#select_style'), '请输入风格', false);
			}
			
			var valieDwellingName = function(){
				return valiLength($('#dwelling-name'), 2, 12, '小区名称长度应在2-12个字');
			};
			
			$('input[name="pro-name"]').focus(function(){       	
				$(this).next().text('请输入案例名称').removeClass('state1').addClass('state2');
			}).blur(function(){
				valiCaseName();
			});
			
			//项目地址1
			$('select[name="s_province"]').blur(function(){	
				valiProvince();
			});

			$('select[name="s_province"]').change(function(){
		    	$('#seachcity').attr('style','border: 1px #ddd solid');
		    	$('#seachdistrict').attr('style','border: 1px #ddd solid');
			});
			
			
			//项目地址2
			$('select[name="s_city"]').blur(function(){	
				valiCity();
			});
			
			//项目地址3
			$('select[name="s_county"]').blur(function(){	
				valiCounty();
			});
			
		    //戶型1
	        $('select[name="s_house"]').blur(function(){	
	    	    valiShouse();
	        });
	
	        //戶型2
	        $('select[name="t_house"]').blur(function(){	
	    	    valiThouse();
	        });
	
	        //戶型3
	        $('select[name="w_house"]').blur(function(){	
	    	    valiWhouse();
	        });
		       
			//房间面积
			$("#dwelling-area").focus(function(){
				$(this).next().text('请输入大于0的数字').removeClass('state1').addClass('state2');
			}).blur(function(){
				valieDwellingArea();
			});
			
			//房屋类型
			$('select[name="house-style"]').blur(function(){	
				valiHouseStyle();
			});
			
			//项目报价
	        $("#project-price").focus(function(){
	   		   $(this).next().text('请输入0-9999的整数').removeClass('state1').addClass('state2');
		    }).blur(function(){
			    valiPrjPrice();
	        });
	        
	        //风格
	        $('#select_style').blur(function(){	
	        	valiStyle();
	        });
		
	        //小区名称
	        $('#dwelling-name').focus(function(){       	
	             $(this).next().text('请输入小区名称').removeClass('state1').addClass('state2');
	        }).blur(function(){
	        	valieDwellingName();
	        });
	        //提交按钮,所有验证通过方可提交
	        $('.button').click(function(){ 
	    	    errorMsg = '';
	    	    var preImgArray = [];
	       		
	    	    if(valiCaseName() && valiProvince() && valiCity() && valiCounty() 
    			  && valiShouse() && valiThouse() && valiWhouse() && valieDwellingArea() 
    			  && valiHouseStyle() && valiPrjPrice() && valiStyle() && valieDwellingName() ){
		       		$('.uploading-img-thumb').each(function(index, item) {
		       			preImgArray.push($(item).attr('fid'));
		       		});

		       		$('#oldImg_id').val(preImgArray);
		       		$("#btnSubmit, #btnClose").attr("disabled", "disabled");
		       		$('#province_name').val($('#seachprov').find("option:selected").text());
		       		$('#city_name').val($('#seachcity').find("option:selected").text());
		       		$('#county_name').val($('#seachdistrict').find("option:selected").text());
		       		//$('#file_fields').remove('#case-input-file' + inputCount);
		       		if($("#file_fields").children().length > 1)$("#file_fields :last-child").remove();
		       		
		       		var fileList = ",";
		       		var uploadImages = $(".uploading-img-img").length - 1;		
		       		$("#case-images").children().each(function(i,n){
		       			if($(n).attr("id") != "case-uploading-img")fileList += $(n).attr("id") + ",";
		       		});
		       		
		       		$("#fileList").val(fileList);
		       		//alert($("#fileList").val());
		       		$('form').submit();
	       		} else {
	       			alert(errorMsg);
		       		return false;
	       		}
		     });
		      
	         $("#case_describe").keydown(function(){
	             var len = $(this).val().length;
	           
	             if(len > 200)
	               $(this).val($(this).val().substring(0,200));
	         });
		 });
	 };
	
	//普通js function 
	function ValidateNumber(e, pnumber) {
	    if (!/^\d+$/.test(pnumber)) {
	        var newValue =/^\d+/.exec(e.value);         
	        if (newValue != null)            
	            e.value = newValue;        
	        else        
	            e.value = "";    
	    }
	    
	    return false;
	};
	
	function ValidateFloat(e, pnumber) {
		if (!/^\d+[.]?\d*$/.test(pnumber)) {
		    var newValue = /^\d+[.]?\d*/.exec(e.value);         
		    if (newValue != null)                    
		        e.value = newValue;           
		    else              
		        e.value = "";    
		}
		
		return false;
	};
	
	function ValidateCaseName(e,text){
		
		if(!/^[\u0391-\uFFE5A-Za-z]+$/.test(text)){
		    var newValue = /^[\u0391-\uFFE5A-Za-z0-9\-/\_/]+/.exec(e.value);         
		    if (newValue != null)                    
		        e.value = newValue;           
		    else              
		        e.value = "";    
		}
		
		return false;
	}


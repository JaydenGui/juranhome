var app = angular.module('app', [ 'appService', 'helper' ]);

// seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
});

// body controller
app.controller('ctrl', function($scope, memberService,
		userCenterService,$http,messageService) {
	$scope.realname=[];
	$scope.member=[];
	$('#loadingMask').css({'display':'block'});
	memberService.getMemberRealnameInfo({designer_id:0}).success(function(r){
		if(r.status<400){
			if(r.audit_status==null){
				// checked member is or no registe use phone
				memberService.getMemberInfo().success(function(k) {
					if (k.status < 400) {
						$scope.member=k;
						if (k.mobile_number) {
							var phone=k.mobile_number;
							$scope.truePhone=k.mobile_number;
							var phone_head=phone.substring(0,3);
							var phone_foot=phone.substring(phone.length-4,phone.length);
							$scope.phone=phone_head+"****"+phone_foot;
						} 
					}
				});
			}
			if(!r.photo_front_end||!r.photo_back_end||!r.photo_in_hand){
				$scope.frontimageurl=null;
				$scope.backimageurl=null;
				$scope.handimageurl=null;
			}else{
				$scope.realname=r;
				$scope.frontimageurl=r.photo_front_end.file_url;
				$scope.backimageurl=r.photo_back_end.file_url;
				$scope.handimageurl=r.photo_in_hand.file_url;
			}
		}
		
		$('#loadingMask').css({'display':'none'});
	});
	
	//====================message start author shx======================
	
	$scope.message=messageService;
	//==================message end===================//
	
	$scope.gotomarkpage=function(){
		location.href = baseUrl + "/mark/category";
	}
	
	$scope.againSubmit=function(){
		var data={};
		userCenterService.againSubmit(data).success(function(r){
		if(r.status<400){
			location.href = baseUrl + "/user/authentication";
		}
	});
		
		$scope.Captcha=function(){
			var phone= $scope.realname.mobile_number;
			var data={
					phone:phone
			};
			//create captcha
			userService.captchaResponse(data).success(function(r){
				if(r){
					alert("captcha r "+r);
				}
			});
		}
		
		
	}
	
});


function ValidateNumber(cardid) {
	//身份证正则表达式(18位)
	var isIdCard2 = /^[1-9]\d{5}(19\d{2}|[2-9]\d{3})((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])(\d{4}|\d{3}X)$/i;
	var stard = "10X98765432"; //最后一位身份证的号码
	var first = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]; //1-17系数
	var sum = 0;
	if (!isIdCard2.test(cardid)) {
		//alert("身份证号码填写不正确");
		//$("#id-card").focus();
		return false;
	}
	var year = cardid.substr(6, 4);
	var month = cardid.substr(10, 2);
	var day = cardid.substr(12, 2);
	var birthday = cardid.substr(6, 8);
	if (birthday != dateToString(new Date(year + '/' + month + '/' + day))) { //校验日期是否合法
		//alert("身份证号码填写不正确");
		//$("#id-card").focus();
		return false;
	}
	for (var i = 0; i < cardid.length - 1; i++) {
		sum += cardid[i] * first[i];
	}
	var result = sum % 11;
	var last = stard[result]; //计算出来的最后一位身份证号码
	if (cardid[cardid.length - 1].toUpperCase() == last) {
		return true;
	} else {
		//alert("身份证号码填写不正确");
		//$("#id-card").focus();
		return false;
	}
	//日期转字符串 返回日期格式20080808
	function dateToString(date) {
		if (date instanceof Date) {
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			month = month < 10 ? '0' + month: month;
			var day = date.getDate();
			day = day < 10 ? '0' + day: day;
			return "" + year + month + day;
		}
	return '';
	}
};
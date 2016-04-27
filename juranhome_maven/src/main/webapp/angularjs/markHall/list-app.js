var app = angular.module('app', ['appService', 'helper']);
//seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台";
	$scope.keywords="设计家在线设计平台";
	$scope.description="设计家在线设计平台";
});
//body controller
app.controller('ctrl', function($scope, markHallService) {
	var str_token ;
	var str_memberId;
	var data = {
		token : "zaq12wsxcde34rfvbgt5"
	};
	markHallService.getDesigneMarkNeeds(data).success(function(r) {
		if (r) {
			//alert("success!!");
			str_token = r.token;
			str_memberId = r.memberId;
		} else {
			alert("somthing hava erro");
		}
	});

});

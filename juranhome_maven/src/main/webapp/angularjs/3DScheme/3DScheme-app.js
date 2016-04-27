'use strict';
var app = angular.module('app', []);
// main controller
app.controller('ctrl', function($scope,$filter) {
	
	var acs_asset_id=$filter('getQueryString')("acs_asset_id");
	var acs_project_id=$filter('getQueryString')("acs_project_id");
	var hs_design_id=$filter('getQueryString')("hs_design_id");
	
	var asset_ids;
	var project_ids;
	var design_ids;
	
	if(acs_asset_id && acs_asset_id!=0){
		asset_ids=acs_asset_id;
	}else{
		asset_ids='';
	}
	
	if(acs_project_id && acs_project_id!=0){
		project_ids=acs_project_id;
	}else{
		project_ids="";
	}
	
	if(hs_design_id && hs_design_id!=0){
		design_ids=hs_design_id
	}else{
		design_ids='';
	}
	
	
	$scope.project_id=project_ids;
	$scope.asset_id=asset_ids;
	$scope.design_id=design_ids;
	
});
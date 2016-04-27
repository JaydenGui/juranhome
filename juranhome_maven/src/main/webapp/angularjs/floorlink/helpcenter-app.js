"use strict"
var app=angular.module("app",['appService']);

app.controller('ctrl',function($scope,messageService){
	$scope.userType=true;
	//====================message start author shx======================
	$scope.message=messageService;
	//==================message end===================
});
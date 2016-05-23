/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *+ Http angularjs request service public method
 *+==========================================================================+
 *+@autho: zhigang.fang
 *+==========================================================================+
 *+@date: 2016-05-10 09:29
 *+==========================================================================+*/
'use strict';
var app = angular.module('appService', []);

/**
 * Define generic objects
 */
app.factory('commonRequestObj', function($http) {
  return {
    request: function(url, method, data) {
      var request_data = {
        method: method,
        url: baseUrl+url
      };
      if (data) {
        request_data.data = data;
      }
      return $http(request_data);
    }
  };
});

/**
 * Get  index data requests
 */
app.service('indexService',function(commonRequestObj){
	var index={
		//get banner data
		getBannerList:function(data){
			 return commonRequestObj.request('/test/getUser', 'post', data);
		},
	};
	return index;
});



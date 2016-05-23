/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *+ JS angular auxiliary public method 
 *+==========================================================================+
 *+@autho: zhigang.fang
 *+==========================================================================+
 *+@date: 2016-05-10 10:29
 *+==========================================================================+*/
'use strict';
var app = angular.module('helper', ['appService']);
app.factory('page', function () {
	var page = {};
	page.init = function (opt) {
		var opt = opt || {};
		return {
			loading: opt.loading === false ? false : true,
			empty: true,
			current: 1,
			limit: opt.limit || 10,
			total: 0,
			set_page: function (page) {
				this.currentPage = page;
			},
			set_total: function (num) {
				this.totalItems = num;
			},
			set_val: function (type, value) {
				this[type] = value;
			},
			set_empty: function (value) {
				var val = !!value;
				this.set_val('empty', val);
			},
			set_loading: function (value) {
				var val = !!value;
				this.set_val('loading', val);
			},
			set_groupLoading: function (value) {
				var val = !!value;
				this.set_val('groupLoading', val);
			},
			go_page: function (page) {}
		};
	};
	return page;
});
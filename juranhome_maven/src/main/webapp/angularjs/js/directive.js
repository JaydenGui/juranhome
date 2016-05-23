//兼容ie7,8
app.config(function ($sceProvider) {
	$sceProvider.enabled(false);
});
app.config(function ($httpProvider) {
	$httpProvider.defaults.headers.common['Cache-Control'] = 'no-cache';
});
app.config(function ($anchorScrollProvider) {
	$anchorScrollProvider.disableAutoScrolling();
});
//配置Content-type格式
app.config(function ($httpProvider) {
	$httpProvider.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded';
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
	$httpProvider.defaults.transformRequest = [

		function (data) {
			var param = function (obj) {
				var query = '';
				var name, value, fullSubName, subName, subValue, innerObj, i;
				for (name in obj) {
					value = obj[name];
					if (value instanceof Array) {
						for (i = 0; i < value.length; ++i) {
							subValue = value[i];
							fullSubName = name + '[' + i + ']';
							innerObj = {};
							innerObj[fullSubName] = subValue;
							query += param(innerObj) + '&';
						}
					} else if (value instanceof Object) {
						for (subName in value) {
							subValue = value[subName];
							fullSubName = name + '[' + subName + ']';
							innerObj = {};
							innerObj[fullSubName] = subValue;
							query += param(innerObj) + '&';
						}
					} else if (value !== undefined && value !== null) {
						query += encodeURIComponent(name) + '=' + encodeURIComponent(value) + '&';
					}
				}
				return query.length ? query.substr(0, query.length - 1) : query;
			};
			return angular.isObject(data) && String(data) !== '[object File]' ? param(data) : data;
		}
	]
});
//事件指令
app.directive('eventLoader', function () {
	return {
		restrict: 'A',
		replace: true,
		scope: {
			doneUpload: '&',
			id: '@',
			url: '@',
			type: '='
		},
		link: function (scope, element, attrs) {
			element.attr('id', scope.id);
			var obj = {
				button: scope.id,
				action: scope.url,
				onComplete: function (fileName, response) {
					if (response.ret != 0) {
						return;
					}
					if (!scope.doneUpload) {
						return;
					}
					scope.$apply(function () {
						/*注意,此处方法的参数以对象的形式传递*/
						scope.doneUpload({
							data: response
						});
					})
				}
			};
			$.jUploader.setDefaults({
				allowedExtensions: scope.type
			});
			$.jUploader(obj);
		}
	}
});
/*上传指令*/
app.directive('uploader', function () {
	return {
		restrict: 'A',
		scope: {
			option: '=',
			limit: '=' //限制的上传的长度
		},
		link: function (scope, element, attr) {
			if (scope.option.id) {
				element.attr('id', scope.option.id);
			} else {
				return;
			}
			var option = {
				height: 30,
				swf: '/js/public/uploadify/uploadify.swf',
				width: 120,
				buttonText: '选择文件',
				fileTypeExts: '*.*',
				removeCompleted: true,
				removeTimeout: 2,
				queueSizeLimit: 1,
				multi: false,
				onUploadStart: function (file) {},
				onUploadComplete: function (file) {
					var uploadLimit = scope.limit;
					if (this.getStats().successful_uploads >= uploadLimit) {
						//超过最大的上传数量按钮设置为disable
						this.setButtonDisabled(true);
					}
				},
				onUploadError: function (file, errorCode, errorMsg, errorString) {},
				onUploadProgress: function (file, bytesUploaded, bytesTotal, totalBytesUploaded, totalBytesTotal) {},
				onUploadSuccess: function (file, data, response) {}
			};
			if (scope.option) {
				for (var n in scope.option) {
					option[n] = scope.option[n];
				}
			}
			element.uploadify(option);
		}
	}
});
//自定义指令调用时间插件
// $scope.dataOptions={lang:'zh-cn'}
// $scope.current_time="",
// $scope.call_back=function(){}
// <input date-picker ng-model="current_time" done="call_back()" date-options=""/>
app.directive('datePicker', function () {
	return {
		restrict: 'A',
		require: '?ngModel',
		scope: {
			dateOptions: '=',
			done: '&',
		},
		link: function (scope, element, attrs, ngModel) {
			if (!ngModel)
				return;
			element.focus(function () {
				var option = {
					lang: 'zh-cn',
					onpicked: function () {
						element.blur();
					},
					oncleared: function () {
						element.blur();
					}
				};
				if (scope.dateOptions) {
					for (var n in scope.dateOptions) {
						option[n] = scope.dateOptions[n];
					}
				}
				WdatePicker(option);
			});
			element.bind('blur change keyup', function () {
				ngModel.$setViewValue(element.val());
				if (scope.done) {
					scope.done({
						date: element.val()
					});
				}
			});
		}
	}
});
//图片加载时获取图片的宽和高并使其适应容器的宽高
// $scope.loading_done = function(){}
// <div resize loding-done="loading_done()"></div>
app.directive('resize', function ($timeout) {
	return {
		restrict: 'A',
		scope: {
			loadingDone: '&'
		},
		link: function (scope, element, attrs) {
			//第一次被调用时隐藏图片
			element.css({
				'visibility': 'hidden'
			})
			element.load(function () {
				$timeout(function () {
					scope.loadingDone();
				}, 10);
				// 清除设置的所有属性
				element.parent().css({
					'width': '',
					'height': '',
					'margin-left': '',
					'margin-top': ''
				});
				element.css({
					'width': '',
					'height': '',
					'margin-left': '',
					'margin-top': '',
					'visibility': 'visible'
				});
				/*获取父元素的高度和宽度*/
				var w = Math.ceil(element.width()),
					h = Math.ceil(element.height()),
					max_w = 1024,
					offset_w = 0;
				/*获取窗口的宽度和高度*/
				var ww = Math.ceil(angular.element(window).width()),
					wh = Math.ceil(angular.element(window).height()),
					max_h = wh - 100;
				/*设置父元素的偏移量和图片的宽高*/
				if (w > max_w) {
					element.css({
						'width': max_w + 'px'
					});
				} else {
					element.parent().css({
						'margin-left': -w / 2 + offset_w + 'px',
						'width': w + 'px'
					});
				}

				if (h > max_h) {
					element.parent().css({
						'height': max_h + 'px',
						'margin-top': -max_h / 2 + 'px'
					});
					element.css({
						'height': max_h + 'px'
					})
				} else {
					element.parent().css({
						'margin-top': -h / 2 + 'px',
						'height': h + 'px'
					});
				}
			})
		}
	}
});
// 点击小图看大图
// $scope.imgArr = [{id:'1',img:'test.jpg'}];
// $scope.currentImg = {id:'1',img:'test.jpg'};
// <div img-scan img-arr="imgArr" current-img="currentImg"></div>
app.directive('imgScan', function ($window) {
	var imgScan = {
		restrict: 'A',
		scope: {
			imgArr: '=',
			currentImg: '='
		},
		replace: true,
		template: '<div class="shadeBox" ng-if="currentImg">'

			+ '<div class="shade" ng-click="closeShade()" ></div>'

			+ '<div id="imgBox" >'

			+ '<a ng-click="prev()" ng-if="imgArr[0].id != currentImg.id"  href="javascript:;" class="prev"><img ng-src="/img/prev-50-45.png" alt="上一张"></a>'

			+ '<img resize  loading-done="removeLoading()"  ng-src="' + resourceUrl + '{{currentImg.img}}" alt=""/>'

			+ '<img ng-if="loading == true" src="/img/spinner.gif" class="imgLoading">'

			+ '<a ng-click="next()" ng-if="imgArr[imgArr.length-1].id != currentImg.id"  href="javascript:;" class="next"><img ng-src="/img/next-50-45.png" alt="下一张"></a>'

			+ '</div>'

			+ '</div>',
		compile: function (element, attr) {
			element.css({
				'position': 'fixed',
				'z-index': 2000,
				'height': '100%',
				'width': '100%',
				'top': 0,
				'left': 0
			});
			angular.element('body').append(element);
			return function (scope, element, attr) {
				scope.loading = true;
				scope.closeShade = function () {
					scope.currentImg = '';
				}
				scope.prev = function () {
					var index = getIndex();
					index -= 1;
					if (index >= 0) {
						scope.currentImg = scope.imgArr[index];
						scope.loading = true;
					}
				}
				scope.next = function () {
					var index, len;
					len = scope.imgArr.length;
					index = getIndex();
					index += 1;
					if (index < len) {
						scope.currentImg = scope.imgArr[index];
						scope.loading = true;
					}
				}
				scope.removeLoading = function () {
					scope.loading = false;
				}

				function getIndex() {
					var i,
						id = scope.currentImg.id,
						len = scope.imgArr.length;
					for (i = 0; i < len; i++) {
						if (scope.imgArr[i].id == id) {
							return i;
						}
					}
				}
			}
		}
	};
	return imgScan;
});
//最大长度控制 
// <input ctrl-max-length="10",ng-model="username" />
app.directive('ctrlMaxlength', function () {
	return {
		require: 'ngModel',
		link: function (scope, element, attrs, ngModelCtrl) {
			var maxlength = Number(attrs.ctrlMaxlength);

			function fromUser(text) {
				if (text.length > maxlength) {
					var transformedInput = text.substring(0, maxlength);
					ngModelCtrl.$setViewValue(transformedInput);
					ngModelCtrl.$render();
					return transformedInput;
				}
				return text;
			}
			ngModelCtrl.$parsers.push(fromUser);
		}
	};
});
// 单张图片加载之后的宽高限制
// <img img-limit max-h="60" max-w="100">
app.directive('imgLimit', function () {
	return {
		restrict: 'A',
		scope: {
			maxH: '@',
			maxW: '@'
		},
		link: function (scope, element, attr) {
			element.css({
				'display': 'none'
			});
			element.load(function () {
				element.css({
					'display': 'inline-block'
				});
				element.height(scope.maxH);
				element.width(scope.maxH);

			});
		}
	}
});

// 点击元素时,给元素一个背景色变化的提示
// <div click-reminder></div>
app.directive('clickReminder', function ($timeout) {
	return {
		restrict: 'A',
		link: function (scope, element, attr) {
			element.bind('click', function () {
				element.css({
					"background-color": "#006dcc",
					"color": "#ffffff"
				});
				$timeout(function () {
					element.css({
						"background-color": "",
						"color": ""
					});
				}, 800);
			});
		}
	};
});

//垂直居中
app.directive('autoMiddle', function () {
	return {
		restrict: 'A',
		link: function (scope, ele, attr) {
			var h = ele[0].clientHeight,
				wh = document.body.clientHeight - 100;
			if (h > wh) {
				ele[0].clientHeight = wh;
			} else {
				var top = (wh - h) / 2 + 50;
				ele[0].style.top = '10%';
				// ele[0].style.marginTop = -top + 'px';
			}
		}
	}
});

//分页
app.directive('pagination', function () {
	 return {
	        restrict: 'EA',
	        replace: true,
	        scope: {
	            conf: '=',
	            goPage:'&',
	            focusable: '@'
	        },
	        template:'<div id="scrollTopG" class="paging clearfix" style="margin-top:60px;margin-bottom:60px;clear:both;" ng-show="conf.totalItems > 0">'
	            +'<div class="find-designer-paging-content">'
                +'<ul class="scrollTopg_magrina">'
                +'<li class="scrollTopG" style="background:none;" class="not-allowed-click find-designer-pre" ng-class="{\'find-designer-not-allowed-click\': conf.currentPage == 1,\'find-designer-pre\': conf.currentPage > 1}" ng-click=Pages("prev")>&lt上一页</li>'
                +'<li class="scrollTopG"  ng-repeat="item in pageList track by $index" ng-class="{\'find-designer-paging-current\':item == conf.currentPage,\'find-designer-no-border\':item == \'•••\'}" ng-click="Pages(item)">{{item}}</li>'
                +'<li class="scrollTopG" ng-class="{\'find-designer-not-allowed-click\': conf.currentPage === conf.numberOfPages,\'find-designer-pre\': conf.currentPage < conf.numberOfPages,\'currentpage\':item!=5}" ng-click=Pages("next")>下一页&gt</li> <span>共{{conf.numberOfPages}}页，到第 <input type="text" style="padding:0;" ng-model="offset" ng-keydown="keydownskip($event)" />页 <div class="scrollTopG" ng-click="skip();" style="vertical-align:middle;line-height:18px;">确定</div></span>'
                +'</ul>'
                +'</div>'
                +'</div>',
	        link: function(scope, element, attrs){
	           
	            // 定义分页的长度必须为奇数 (default:9)
	            scope.conf.pagesLength = parseInt(scope.conf.pagesLength) ? parseInt(scope.conf.pagesLength) :9;
	            if(scope.conf.pagesLength % 2 === 0){
	                // 如果不是奇数的时候处理一下
	                scope.conf.pagesLength = scope.conf.pagesLength -1;
	            }
	            //conf.erPageOptions
	            if(!scope.conf.perPageOptions){
	                scope.conf.perPageOptions = [5, 5, 5, 5, 5];
	            }
	            // pageList数组
	            function getPagination(newValue, oldValue) {
	                // conf.currentPage
	                scope.conf.currentPage = parseInt(scope.conf.currentPage) ? parseInt(scope.conf.currentPage) : 1;
	                // conf.totalItems
	                scope.conf.totalItems = parseInt(scope.conf.totalItems) ? parseInt(scope.conf.totalItems) : 0;

	                // conf.itemsPerPage (default:15)
	                scope.conf.itemsPerPage = parseInt(scope.conf.itemsPerPage) ? parseInt(scope.conf.itemsPerPage) : 15;
	                

	                // numberOfPages
	                scope.conf.numberOfPages = Math.ceil(scope.conf.totalItems/scope.conf.itemsPerPage);

	                // judge currentPage > scope.numberOfPages
	                if(scope.conf.currentPage < 1){
	                    scope.conf.currentPage = 1;
	                }

	                // 如果分页总数>0，并且当前页大于分页总数
	                if(scope.conf.numberOfPages > 0 && scope.conf.currentPage > scope.conf.numberOfPages){
	                    scope.conf.currentPage = scope.conf.numberOfPages;
	                }

	                // jumpPageNum
	                scope.jumpPageNum = scope.conf.currentPage;

	                // 如果itemsPerPage在不在perPageOptions数组中，就把itemsPerPage加入这个数组中
	                var perPageOptionsLength = scope.conf.perPageOptions.length;
	                // 定义状态
	                var perPageOptionsStatus;
	                for(var i = 0; i < perPageOptionsLength; i++){
	                    if(scope.conf.perPageOptions[i] == scope.conf.itemsPerPage){
	                        perPageOptionsStatus = true;
	                    }
	                }
	                // 如果itemsPerPage在不在perPageOptions数组中，就把itemsPerPage加入这个数组中
	                if(!perPageOptionsStatus){
	                    scope.conf.perPageOptions.push(scope.conf.itemsPerPage);
	                }

	                // 对选项进行sort
	                scope.conf.perPageOptions.sort(function(a, b){return a-b});

	                scope.pageList = [];
					
	                if(scope.conf.numberOfPages <= scope.conf.pagesLength){
	                    // 判断总页数如果小于等于分页的长度，若小于则直接显示
	                    for(i =1; i <= scope.conf.numberOfPages; i++){
	                        scope.pageList.push(i);
	                    }
	                }else{
	                    // 总页数大于分页长度（此时分为三种情况：1.左边没有...2.右边没有...3.左右都有...）
	                    // 计算中心偏移量
	                    var offset = (scope.conf.pagesLength - 1)/2;
	                    if(scope.conf.currentPage <= offset){
	                        // 左边没有...
	                        for(i =1; i <= offset +1; i++){
	                            scope.pageList.push(i);
	                        }
	               
	                        scope.pageList.push('•••');
	                        //scope.pageList.push(scope.conf.numberOfPages);
	                    }else if(scope.conf.currentPage > scope.conf.numberOfPages - offset){
	                        scope.pageList.push(1);
	                        scope.pageList.push('•••');
	                        for(i = offset + 1; i >= 1; i--){
	                            scope.pageList.push(scope.conf.numberOfPages - i);
	                        }
	                        scope.pageList.push(scope.conf.numberOfPages);
	                    }else{
	                        // 最后一种情况，两边都有...
	                        scope.pageList.push(1);
	                        scope.pageList.push('•••');

	                        for(i = Math.ceil(offset/2) ; i >= 1; i--){
	                            scope.pageList.push(scope.conf.currentPage - i);
	                        }
	                        scope.pageList.push(scope.conf.currentPage);
	                        for(i = 1; i <= offset/2; i++){
	                            scope.pageList.push(scope.conf.currentPage + i);
	                        }
	                        scope.pageList.push('•••');
	                        scope.pageList.push(scope.conf.numberOfPages);
	                    }
	                }
	                scope.keydownskip = function($event){
	                		if($event.keyCode == 13){	                			
	                			scope.skip();
	                		}
	                	
	                }
	              //Enter the number of pages 
	    			scope.skip = function () {
	    				var page = parseInt(scope.offset);
	    				if (isNaN(page)) {
	    					return;
	    				};
	    				page = page > scope.conf.numberOfPages ? scope.conf.numberOfPages : page;
	    				if (scope.skipPage <= 0 && page==1) {
	    					page = 1;
	    					return false;
	    				}
	    				
	    				scope.goPage({
	    					num: page,
	    				});
	    				scope.conf.currentPage=page;
	    				scope.offset = "";
	    				scope.current = page;
	    				element.find("input").blur();
	    			};
	                
	                if(scope.conf.onChange){
	                    // 防止初始化两次请求问题
	                    if(!(oldValue != newValue && oldValue[0] == 0)) {
	                        scope.conf.onChange();
	                    }
	                }
	                scope.$parent.conf = scope.conf;
	            }
	            
	            //
	            scope.Pages=function(type){
	            	var page;
	            	if(type=='prev'){
	            		//prevPage
	            		if(scope.conf.currentPage > 1){
	 	                    //scope.conf.currentPage -= 1;
	 	                    page=scope.conf.currentPage -=1;
	 	                    pages(page);
	 	                }
	            	}else if(type=='next'){
	            		//nextPage
	            		if(scope.conf.currentPage < scope.conf.numberOfPages){
	 	                    //scope.conf.currentPage += 1;
	 	                    page=scope.conf.currentPage+=1;
	 	                    pages(page);
	 	                }
	            	}else{
	            		//currentPage
	            		if(type== '•••'){
	 	                    return;
	 	                }else{
	 	                    //scope.conf.currentPage =type;
	 	                    page=type;
	 	                    pages(page);
	 	                }
	            	}
	            }
	            
	            function pages(page){
	               scope.goPage({num: page});
	               scope.conf.currentPage=page;
	            }
	             
	            scope.$watch(function() {
	                if(!scope.conf.totalItems) {
	                    scope.conf.totalItems = 0;
	                }
	                var newValue = scope.conf.totalItems + ' ' +  scope.conf.currentPage + ' ' + scope.conf.itemsPerPage;
	                return newValue;
	            }, getPagination);
	        }
	    };
});

//返回上一步
// <div go-back></div>
app.directive('goBack', function () {
	return {
		restrict: 'A',
		replace: true,
		scope: {},
		template: '<a href="javascript:;" class="" ng-click="go()">返回</a>',
		link: function (scope, iElement, iAttrs) {
			scope.go = function () {
				history.go(-1);
			}
		}
	};
});

//common loading flag
// <div page-loading></div>
app.directive('pageLoading', function () {
	return {
		restrict: 'A',
		template: '<div class="alert alert-warning"><img ng-src="' + imageUrl + '/spinner.gif" alt="loading"> 加载中...</div>',
		replace: true
	};
});
// <div page-empty></div>
app.directive('pageEmpty', function () {
	return {
		restrict: 'A',
		scope: {
			text: '@'
		},
		template: '<div class="alert alert-warning"> {{tip}}</div>',
		replace: true,
		link: function (scope) {
			scope.tip = scope.text || '没有记录!';
		}
	};
});
// <p ng-if="type" msg="text" type="type"></p>
app.directive('msg', function () {
	return {
		restrict: 'A',
		scope: {
			msg: '=',
			type: '='
		},
		replace: true,
		template: '<div class="alert" ng-class={"alert-success":isSuccess,"alert-danger":isError}>'

			+ '<strong ng-class={"icon-ok-sign":isSuccess,"icon-remove-sign":isError}></strong>&nbsp;{{msg}}'

			+ '</div>',
		link: function (scope, iElement, iAttrs) {
			scope.isSuccess = scope.type == 'success';
			scope.isError = scope.type == 'error';
		}
	}
});
//自动获取焦点
// <input auto-focus />
app.directive('autoFocus', function () {
	return {
		restrict: 'A',
		link: function (scope, element, attr) {
			element[0].focus();
		}
	};
});
// < div class = "backstretch" >
// 此处需要引入jquery.backstretch.min.js
app.directive('backstretch', function () {
	return {
		restrict: 'A',
		scope: {
			backstretch: '='
		},
		replace: true,
		link: function (scope, element, attr) {
			$.backstretch(scope.backstretch.imgs, scope.backstretch.active);
		}
	}
});
// 设置一个按钮,根据mouseover事件显示其他活动按钮,活动按钮自定义
// <div action-menu></div>
app.directive('actionMenu', function () {
	return {
		restrict: 'A',
		scope: {},
		replace: true,
		link: function (scope, element, attr) {
			element.find('ul').hide();
			element.bind('mouseover', function () {
				element.find('ul').show();
			});
			element.bind('mouseout', function () {
				element.find('ul').hide();
			});
		}
	}
});
// 弹窗,弹窗内容自定义
//<div dialog><div>这是一个弹窗</div></div>
app.directive('dialog', function () {
	return {
		restrict: 'A',
		template: '<div class="shadeBox"><div class="shade"></div><div ng-transclude></div></div>',
		replace: true,
		transclude: true,
		// link: function(scope, ele, attr) {
		// 	ele.css({
		// 		width: 300+'px',
		// 		height: 500+ 'px'
		// 	})
		// }
	}
});
// 提供一个加载图标,后面可自定义内容
// <div loading>正在加载</div>
app.directive('loading', function () {
	return {
		restrict: 'A',
		replace: true,
		transclude: true,
		template: '<div><img ng-src="' +baseUrl+ '/images/global/loading.gif" alt="loading"><span ng-transclude></span></div>'
	}
});
// $scope.v = {src:'video.mp4',id:'ck_id'}
// <div video src="{{v.src}}"></div>
app.directive('video', function () {
	return {
		restrict: 'A',
		scope: {
			src: '@',
			id: '@'
		},
		link: function (scope, element, attr) {
			var flashvars = {
				f: resourceUrl + scope.src,
				p: 1,
				e: 1
			};
			// var video = ['http://movie.ks.js.cn/flv/other/1_0.mp4->video/mp4', 'http://www.ckplayer.com/webm/0.webm->video/webm', 'http://www.ckplayer.com/webm/0.ogv->video/ogg'];
			// CKobject.embed('ckplayer/ckplayer.swf', scope.id, scope.id + '_name', '600', '400', false, flashvars, video)
			// var video = [resourceUrl + scope.src + '->video/mp4'];
			var video = [resourceUrl + scope.src + '->video/arm'];

			var support = ['all'];
			CKobject.embedHTML5(scope.id, scope.id + '_name', 600, 400, video, flashvars, support);
		}
	}
});

// <div audio ></div>
app.directive('xdAudio', function () {
	return {
		restrict: 'A',
		scope: {
			xdAudio: '@',
		},
		template: '<object width="200" height="15" classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab">' +
			'<param name="src" value="{{xdAudio}}">' +
			'<param name="controller" value="true">' +
			'<param name="type" value="video/quicktime">' +
			'<param name="autoplay" value="false">' +
			'<param name="target" value="myself">' +
			'<param name="bgcolor" value="transparent">' +
			'<param name="wmode" value="opaque">' +
			'<param name="pluginspage" value="http://www.apple.com/quicktime/download/index.html">' +
			'<embed src="{{xdAudio}}" width="300" height="50" wmode="opaque"  controller="true" autoplay="false" align="middle" bgcolor="transparent" target="myself" type="video/quicktime" pluginspage="http://www.apple.com/quicktime/download/index.html"></embed>' +
			'</object>',
		replace: true
	}
});

app.directive('paCenter', function () {
	return {
		restrict: 'A',
		link: function (scope, element, attr) {
			element.parent().css({
				position: 'relative'
			});
			var h = element.parent().height(),
				w = element.parent().width();
			element.css({
				position: 'absolute',
				top: h / 2 + 'px',
				left: w / 2 + 'px',
				'margin-top': -element.height() / 2 + 'px'
			});
		}
	}
});
//登出
//<div logout></div>
app.directive('logout', [
	'$window',
	'$http',
	function ($window, $http) {
		return {
			restrict: 'A',
			scope: {},
			template: '<a href="javascript:;" ng-click="logout()"><i class="fa fa-power-off"></i> 退出</a>',
			replace: true,
			link: function (scope, element, attr) {
				scope.logout = function () {
					$http({
						method: 'post',
						url: '/User/logout'
					}).success(function (r) {
						if (r.ret === '0') {
							$window.location.href = '/Login';
						}
					})
				}
			}
		}
	}
]);
//<div breadcrumb title-obj="titleObj"></div>
app.directive('breadcrumb', [
	function () {
		return {
			restrict: 'A',
			scope: {
				titleObj: '='
			},
			transclude: true,
			template: '<ul class="page-breadcrumb breadcrumb">' +
				'<li class="btn-group">' +
				'<div>' +
				'<ul class="pull-right" style="list-style-type:none" ng-transclude>' +
				//'<li><a href="#/" class="btn btn-danger">返回</a></li>' +
				'</ul>' +
				'</div>' +
				'</li>' +
				'<li>' +
				'<i class="fa {{titleObj.icon}}"></i>&nbsp;' +
				'<a href="javascript:;">{{titleObj.parent}}</a>&nbsp;<i class="fa fa-angle-right"></i>&nbsp;' +
				'</li>' +
				'<li>' +
				'<a href="javascript:;">{{titleObj.sub}}</a>' +
				'</li>' +
				'</ul>',
			replace: true,
		}
	}
]);

//自定义系统消息指令
app.directive('systemmsg',function(userCenterService){
    	return  {
    		restrict: 'E',
    		transclude: true,
    		template:"<a class='dropdown-toggle' data-close-others='true' data-hover='dropdown' data-toggle='dropdown' href='' style='padding-bottom:10px;'>"
	                 +"<em class='clip-bubble-3' style='border-left: 1px solid #5c5c5c;padding-left: 15px; border-right: 1px solid #5c5c5c; padding-right: 15px;'></em>"
	                 +"<span class='badge'>4</span>"
	                 +"</a>"
	                 +"<ul class='dropdown-menu posts' style='position: absolute; z-index: 100000000000000'>"
	                 +"<li><span class='dropdown-menu-title'> 您有{{message.newMsgCount}}则信息</span></li>"
	                 +"<li>"
	                 +"<div class='drop-down-wrapper ps-container'>"
	                 +"<ul>"
	                 +"<li ng-repeat='item in message.messages'>"
	                 +"<a href='"+baseUrl+"/user/index#/message/'>"
	                 +"<div class='clearfix'>"
	                 +"<div class='thread-image'>"
	                 +"<img alt='' src='"+baseUrl+"/images/index/avatar-2.jpg'>"
	                 +"</div>"
	                 +"<div class='thread-content'>"
	                 +"<span class='author'>{{item.subject}}</span>"
	                 +"<span class='preview'>{{item.body|substr:10}}</span>"
	                 +"<span class='time'>{{item.sent_time|fdate}}</span>"
	                 +"</div>"
	                 +"</div>"
	                 +"</a>"
	                 +"</li>"
	                 +"</ul>"
	                 +"<div class='ps-scrollbar-x-rail' style='width: 270px; display: none; left: 0px; bottom: 3px;'><div class='ps-scrollbar-x' style='left: 0px; width: 0px;'>"
	                 +"</div></div><div class='ps-scrollbar-y-rail' style='top: 0px; height: 250px; display: none; right: 3px;'><div class='ps-scrollbar-y' style='top: 0px; height: 0px;'>"
	                 +"</div></div></div>"
	                 +"</li>"
	                 +"<li class=view-all'>" 
	                 +"<a href='"+baseUrl+"/user/index#/message/'> 浏览全部信息 <i class='fa fa-arrow-circle-o-right'></i>"
	                 +"</a>"
	                 +"</li>"
	                 +"</ul>",
    		link:function(scope, element, attr){
    			//获取系统信息
    			scope.getMessageList = function(data) {
    				userCenterService.getSystemMessageList(data).success(function(r) {
						if (r.status<400) {
							scope.message=r;
						}
					});
				};
				scope.getMessageList({
					page: 0,
					pageSize:20
				});
    		}
    	}
    }                     
);

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *+ Http angularjs request service public method
 *+==========================================================================+
 *+@autho: fangzhigang
 *+==========================================================================+
 *+@date: 2015-11-28
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
		},//Publish user demand
		publishDemand:function(data){
			return commonRequestObj.request('/user/publishDemand','post',data);
		},
		//get designer for index
		getIndexDesigner:function(){
			return commonRequestObj.request('/user/getIndexDesigner','post',null);
		}
	};
	return index;
});
/**
 * Get user data requests
 */
app.service('userService',function(commonRequestObj){
	var user={
		 //login 
	     loginResponse:function(data){
			  return commonRequestObj.request('/login/loging', 'post',data);
	     },
	     //register
	     registeResponse:function(data){
			  return commonRequestObj.request('/login/registe','post',data);
	     },
	     //captcha
	     captchaResponse:function(data){
	    	 return commonRequestObj.request('/login/getCaptcha','post',data);
	     },	
	     //Verify phone
	     verifyPhoneResponse:function(data){
	    	 return commonRequestObj.request('/login/verifyPhone','post',data);
	     },	     
	     //remember password
	     addCookie:function(data){
			  return commonRequestObj.request('/login/addCookie','post',data);
	     },
	     getCookie:function(data){
			  return commonRequestObj.request('/login/getCookie','post',data);
	     },
	};
	return user;
});
/**
 *get caseBase data  requests
 */
app.service('caseService',function(commonRequestObj){
	var cases={
		 //get case data list 
		getCaseList:function(data){
			  return commonRequestObj.request('/caseBase/getCaseList', 'post',data);
	     },
	     //Obtain details of ID based on case library 
	     getCaseDetail:function(data){
			  return commonRequestObj.request('/caseBase/getCaseListDetail','post',data);
	     },
	     //Create case library 
	     createCase:function(data){
			  return commonRequestObj.request('/caseBase/createCase','post',data);
	     },
	     //edit case library
	     editCase:function(data){
			  return commonRequestObj.request('/caseBase/editCase','post',data);
	     },
	     //delete case library
	     deleteCase:function(data){
			  return commonRequestObj.request('/caseBase/deleteCase','post',data);
	     },
	     //Designers to obtain their own case library 
	     myCaseList:function(data){
			  return commonRequestObj.request('/caseBase/myCaseList','post',data);
	     },
	     searchCase:function(data){
			  return commonRequestObj.request('/caseBase/searchCase','post',data);
	     },
	     // same myCaseList , not give header X-Token
	     myCaseList2:function(data){
			  return commonRequestObj.request('/caseBase/myCaseList2','post',data);
	     },
	};
	return cases;
});
/**
 *get designer data  requests
 */
app.service('designerService',function(commonRequestObj){
	var designer={
		 //get designer data list 
		getDesignerList:function(data){
			  return commonRequestObj.request('/designer/getDesignerList', 'post',data);
	     },
	     //get designer details  data list
	     getDesignerDetail:function(data){
			  return commonRequestObj.request('/designer/getDesignerListDetail','post',data);
	     },
	     
	     getDesignerCity:function(data){
	    	 return commonRequestObj.request('/designer/getDesignerCity','post',data);
	     },

	     getDesignerSpace:function(data){
	    	 return commonRequestObj.request('/designer/getDesignerSpace','post',data);
	     },

	     getDesignerCost:function(data){
	    	 return commonRequestObj.request('/designer/getDesignerCost','post',data);
	     },
	     //Obtain designer information according to the designer
	     getDesignerInfo:function(data){
	    	 return commonRequestObj.request('/designer/designerInfo','post',data);
	     },
	     //update designer detail info
		 updateDesignerDetail:function(data){
			return commonRequestObj.request('/designer/updateDesignerDetail','post',data);
		 },
		 getDesignerCaseList:function(data){
			return commonRequestObj.request('/designer/getDesignerCaseList','post',data);
		 },
		 designerRefuseCase:function(data){
			 return commonRequestObj.request('/designer/designerRefuseCase','post',data);
		 },
		 //Theme designer switch 
		 skinPeeler:function(data){
			 return commonRequestObj.request('/designer/skinPeeler','post',data);
		 }
	};
	return designer;
});
/**
 * userCenter service
 */
app.service('userCenterService',function(commonRequestObj){
	var userCeter={
			//Get personal data
			getMemberMessage:function(data){
				return commonRequestObj.request('/user/getMemberMessage','post',data);
			},
			//Editor personal data
			editMemberMessage:function(data){
				return commonRequestObj.request('/user/editMemberMessage','post',data);
			},
			//Publish user demand
			publishDemand:function(data){
				return commonRequestObj.request('/user/publishDemand','post',data);
			},
			authSubmit:function(data){
				return commonRequestObj.request('/user/authSubmit','post',data);
			},
			//designer map deport add case
			designerMapDeportAdd:function(data){
				return commonRequestObj.request('/user/designerMapDeportAdd','post',data);
			},
			
			getMemberDemandList:function(data){
				return commonRequestObj.request('/myOrder/getmybiddetail','post',data);
			},
			getSession:function(data){
				return commonRequestObj.request('/user/getSession','post',data);
			},
			/*getSystemNotificationList:function(data){
				return commonRequestObj.request('/user/getSystemNoticeList','post',data);
			},*/
			getSystemNotificationList:function(data){
				return commonRequestObj.request('/user/userprofile','post',data);
			},
			//designer user center real name authentication
			DesignerAuthentication:function(data){

				return commonRequestObj.request('/user/DesignerAuthentication','post',data);
			},
			//get photo info
			uploadimage:function(data){
				return commonRequestObj.request('/user/photoUpload','post',data);
			},
			modifyDemand:function(data){
				return commonRequestObj.request('/myOrder/modifyDemand','post',data);
			},
			terminateDemand:function(data){
				return commonRequestObj.request('/myOrder/terminateDemand','post',data);
			},
			designerCaseModify:function(data){
				return commonRequestObj.request('/user/designerCaseModify','post',data);
			},
			getDesignerCaseDetail:function(data){
				return commonRequestObj.request('/user/getDesignerCaseDetail','post',data);
			},
			getPaypalFirst:function(data){
				return commonRequestObj.request('/user/getPaypalFirst','post',data);
			},
			getPaypalLast:function(data){
				return commonRequestObj.request('/user/getPaypalLast','post',data);
			},
			getPaypalReturn:function(data){
				return commonRequestObj.request('/user/getPaypalReturn','post',data);
			},
			againSubmit:function(data){
				return commonRequestObj.request('/user/againSubmit','post',data);
			},
			uploadAvatar:function(data){
				return commonRequestObje.request('/user/uploadAvatar','post',data);
			},
			//message
			getSystemMessageList:function(data){
				return commonRequestObj.request('/message/getSystemMessageList','post',data);
			},
			deleteSystemMessage:function(data){
				return commonRequestObj.request('/message/deleteSystemMessage','post',data);
			}
	};
	return userCeter;
});

/**
 * get markHall Needs data request
 */
app.service('markHallService',function(commonRequestObj){
	var markHall={
			//Designer demand hall list
			getDesigneMarkNeeds:function(data){
				return commonRequestObj.request('/mark/getDesigneMarkNeeds','post',data);
			},
			mark:function(data){
				return commonRequestObj.request('/mark/designeMark','post',data);
			},
			searchNeeds:function(data){
				return commonRequestObj.request('/mark/searchNeeds','post',data);
			}
	};
	return markHall;
});

/**
 * get order data request
 */
app.service('orderService',function(commonRequestObj){
	//Rejection Designer
	var order={
		deleteOrder:function(data){
			return commonRequestObj.request('/myOrder/deleteOrder','post',data)
		},
		//Get the designer's home improvement order data 
		getDesignersOrderlist:function(data){
			return commonRequestObj.request('/myOrder/getDesignersOrderlist','post',data);
		},
		////Get beishu order data 
		getBeishuOrderlist:function(data){
			return commonRequestObj.request('/myOrder/getBeishuOrderlist','post',data);
		},
		//get designer mark list
		getmybidlist:function(data){
			return commonRequestObj.request('/myOrder/getmybidlist','post',data);
		},
		//get designer mark detail
		getmybiddetail:function(data){
			return commonRequestObj.request('/myOrder/getmybiddetail','post',data);
		},
		//Get my home improvement order list 
		getMyOrederList:function(data){
			return commonRequestObj.request('/myOrder/myNeedsList','post',data);
		},
		//Details of orders to obtain orders based on orders of ID
		getMyOrederDetail:function(data){
			return commonRequestObj.request('/myOrder/myOrderDetail','post',data);
		},
		//get list of all the decoration needs of consumers
		getMemberNeeds:function(data){
			return commonRequestObj.request('/myOrder/getMemberNeeds','post',data);
		},
		//Consumers view for own needs to list should be the target should be the designer
		orderDetailDesignerList:function(data){
			return commonRequestObj.request('/myOrder/orderDetailDesignerList','post',data);
		},
		//Custom designer 
		customDesigner:function(data){
			return commonRequestObj.request('/myOrder/customDesigner','post',data);
		},
		//select ta volume room
		selectTa:function(data){
			return commonRequestObj.request('/myOrder/selectTa','post',data);
		},
		//Designers reject consumers real 
		refused:function(data){
			return commonRequestObj.request('/myOrder/refused','post',data);
		},
		//Designers confirm the volume of housing
		confirm:function(data){
			return commonRequestObj.request('/myOrder/confirm','post',data);
		},
		//Designers create contracts
		createContract:function(data){
			return commonRequestObj.request('/myOrder/createContract','post',data);
		},
		//Create upload delivery information 
		createDelivery:function(data){
			return commonRequestObj.request('/myOrder/deliveryresultsCreate','post',data);
		},
		//designer stop mark
		stopmark:function(data){
			return commonRequestObj.request('/myOrder/stopmark','post',data);
		},
		//Alipay.com payment
		getAlipayUrl:function(data){
			return commonRequestObj.request('/myOrder/aliPay','post',data);
		},
		//Get the contract number    
		getContractNumber:function(data){
			return commonRequestObj.request('/myOrder/getContractNumber','post',data);
		},
		getURLDecoder:function(data){
			return commonRequestObj.request('/myOrder/getURLDecoder','post',data);
		}
	};
	return order;
});


/**
 * 3d scheme
 */
app.service('schemeService',function(commonRequestObj){
	var scheme={
		//Get a list of 3D programs 
		getSchemeList:function(data){
			return commonRequestObj.request('/3Dscheme/getSchemeList','post',data)
		},
		//Get your own design 
		mySchemelist:function(data){
			return commonRequestObj.request('/3Dscheme/mySchemelist','post',data);
		},
		//According to the requirements of ID acquisition design
		schemeDetaillist:function(data){
			return commonRequestObj.request('/3Dscheme/schemeDetaillist','post',data);
		},
		//Enter the HS from the 3D design tool design
		get3DAssetid:function(data){
			return commonRequestObj.request('/3Dscheme/get3DAssetid','post',data);
		},
		//Upload files to 3D Asset
		uploadFile3DAsset:function(data){
			return commonRequestObj.request('/3Dscheme/uploadFile3DAsset','post',data);
		},
		//Upload files to 3D Asset
		get3DAssetFile:function(data){
			return commonRequestObj.request('/3Dscheme/get3DAssetFile','post',data);
		},
		//Upload delivery
		designDelivery:function(data){
			return commonRequestObj.request('/3Dscheme/designDelivery','post',data);
		},
		//View delivery 
		viewDelivery:function(data){
			return commonRequestObj.request('/3Dscheme/viewDelivery','post',data);
		},
		//View delivery 
		getHsPrints:function(data){
			return commonRequestObj.request('/3Dscheme/getHsPrints','post',data);
		},
		//Visitors get the designer's wild program
		getDesigner3dsheme:function(data){
			return commonRequestObj.request('/3Dscheme/getDesigner3dsheme','post',data);
		}
	};
	return scheme;
});

/**
 * get member info
 */
app.service('memberService',function(commonRequestObj){
	var member={
			//get member phone from member info
			getMemberInfo:function(){
				return commonRequestObj.request('/member/memberInfo','post',null);
			},
			//get member realname info
			getMemberRealnameInfo:function(data){
				return commonRequestObj.request('/member/memberRealnameInfo','post',data);
			},
			//According to the members of ID to obtain user information 
			getMemberIdInfo:function(data){
				return commonRequestObj.request('/member/getMemberIdInfo','post',data);
			}
			
	};
	return member;
});


/**
 * get member info
 */
app.service('paymentService',function(commonRequestObj){
	var payment={
			//get designer money info
			getMyMoneyInfo:function(data){
				return commonRequestObj.request('/pay/myMoneyInfo','post',data);
			},
			//get withdrawal record list 
			withdrawalRecordInfo:function(data){
				return commonRequestObj.request('/pay/withdrawalRecordInfo','post',data);
			},
			//get Transaction record list
			transactionRecordInfo:function(data){
				return commonRequestObj.request('/pay/transactionRecordInfo','post',data);
			},
			//submit disigner bankCard info
			submitDesignerBankCardInfo:function(data){
				return commonRequestObj.request('/pay/submitDesignerBankCardInfo','post',data);
			}
			
	};
	return payment;
});
/**
 * get message
 */
app.service('messageService',function(userCenterService){
		function getNewCount(messages){
			var count=0;
			messages.forEach(function(item){
				if(item.read_time=="")
				{
					count++;
				}			
			});
			return count;
		}
		
		function getOptions() {
			var op = {
				page : 0,
				pageSize : 10,
				status : '',
				messageType:"2"
			}
			return op;
		}
			
		function getMessage(){
			var message={
				messages:[],
				newMsgCount:0
			};
			userCenterService.getSystemMessageList(getOptions()).success(function(r){
				if(r.status < 400)
				{
					message.messages=r.messages;					
					message.newMsgCount=getNewCount(message.messages);//new messages
				}
			});
			return message;
		}
		return getMessage();
	
});
/**
 * get im
 */
app.service('imService',function(commonRequestObj){
	var im={
			//get designer money info
			getRoomlist:function(data){
				return commonRequestObj.request('/im/roomlist','post',data);
			},
			retrieveMessages:function(data){
				return commonRequestObj.request('/im/retrieveMessages','post',data);
			},
			sendMessage:function(data){
				return commonRequestObj.request('/im/sendMessage','post',data);
			},
			replyMessage:function(data){
				return commonRequestObj.request('/im/replyMessage','post',data);
			},
			putMessage:function(data){
				return commonRequestObj.request('/im/putMessage','post',data);
			},
			getWebSocketUrl:function(data){
				return commonRequestObj.request('/im/getWebSocketUrl','post',data);
			},
			markAMessage:function(data){
				return commonRequestObj.request('/im/markAMessage','post',data);
			}
			
	};
	return im;
});
app.factory('fileReader', ["$q", "$log", function($q, $log){
    var onLoad = function(reader, deferred, scope) {
        return function () {
            scope.$apply(function () {
                deferred.resolve(reader.result);
            });
        };
    };

    var onError = function (reader, deferred, scope) {
        return function () {
            scope.$apply(function () {
                deferred.reject(reader.result);
            });
        };
    };

    var getReader = function(deferred, scope) {
        var reader = new FileReader();
        reader.onload = onLoad(reader, deferred, scope);
        reader.onerror = onError(reader, deferred, scope);
        return reader;
    };

    var readAsDataURL = function (file, scope) {
        var deferred = $q.defer();
        var reader = getReader(deferred, scope);         
        reader.readAsDataURL(file);
        return deferred.promise;
    };

    return {
        readAsDataUrl: readAsDataURL  
    };
}]);
app.service('fileUpload', ['$http', function ($http) {
    this.uploadFileToUrl = function(url,data){
        var fd = new FormData();
        fd.append('file', data.file);
        fd.append('content_type', "IMAGE");
       /* for(var p in data){
        	if(data.hasOwnProperty(p)){
        		fd.append(p,data[p]);
        	}        	
        }
        return $http.post(baseUrl+url, fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })*/
        var fd = new FormData();
        angular.forEach(data, function(val, key) {
          fd.append(key, val);
        });
        var args = {
          method: 'POST',
          url: baseUrl+url,
          data: fd,
          headers: {'Content-Type': undefined},
          transformRequest: angular.identity
        };
        return $http(args);
    }
}]);




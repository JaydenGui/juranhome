/*++++++++++++++++++++++++++++++++++++++++++++
 * IM  module
 * ============================================
 * @author sunhuaixing
 * ============================================
 * @date 2016-3-18
 *+++++++++++++++++++++++++++++++++++++++++++++*/
var app = angular.module('app', ['appService', 'helper','websocketService','audioPlayer']);
app.config(['$locationProvider', function($locationProvider) {
    $locationProvider.html5Mode(true);
}]);

//app.run(function() {
//	if (navigator.appVersion.indexOf('MSIE') != -1) {
//		document.write('本程序不支持IE浏览器。');
//	}
//});
/**
 * define constant value for send message way
 */
app.constant('send_way',{'enter_way':1,'ctr_enter_way':2});

/*app.controller('sendImageModalCtr',function($scope,$modalInstance,$log){ //	
    $scope.cancel = function(){
        $modalInstance.dismiss('cancel'); // 退出
    }
});
app.controller('showPreviewModalCtr',function($scope,$modalInstance,$log,imageSrc,upLoadMedia){ //	
	$scope.imageSrc=imageSrc;
	$scope.upLoadMedia=upLoadMedia;
    $scope.cancel = function(){
        $modalInstance.dismiss('cancel'); // 退出
    }
});*/

//seo controller
app.controller('seoCtrl', function($scope) {
	$scope.title="设计家在线设计平台及时通信";
	$scope.keywords="设计家在线设计平台及时通信";
	$scope.description="设计家在线设计平台及时通信";
});
//body controller
app.controller('ctrl', function($scope,$filter,$location,imService,page,send_way,sWSocket,player,fileReader,fileUpload){
	
	$scope.page = page.init();
	$scope.myRoomList=[];
	$scope.messages=[];	
	$scope.member_id="";
	$scope.current_thread_id="";
	$scope.current_thread=null;
	$scope.send_msg="";
	$scope.send_way=send_way.enter_way;
	$scope.socketUrl="";
	$scope.message_media_type="TEXT";
	$scope.recipient_ids ="";
	$scope.player = player;
	$scope.send_image_btn_enabled = true;
	$scope.roomOptions={page:0,pageSize:10};
	$scope.messageOptions={page:0,pageSize:20,hasMore:true,retCount:0};
	$scope.imageMessageOptions={page:0,pageSize:20};
	
	if ($location.search().recipient_ids) {  
	    $scope.recipient_ids = $location.search().recipient_ids;  
	    sendMessage();
    }
	else{
		getList(getOptions());
	}
	
	getSocketUrl({});
	/**
	 * Get the chat room list
	 */
	function getList(data){
		imService.getRoomlist(data).success(function(r) {
				$scope.threads=r.threads;
				$scope.member_id=r.member_id;
				$scope.conf = {
				    currentPage:r.offset+1,
				    totalItems:r.count,
				    itemsPerPage:10,
				};
				if($scope.current_thread_id==""){
					$scope.current_thread_id=$scope.threads[0].thread_id;
				}				
				$scope.current_thread=getCurrentThreadById($scope.current_thread_id);
				//if not new chat
				$scope.retrieveMessages($scope.current_thread_id,0);
		});
	}
	/**
	 * change page
	 */
	$scope.page.set_val('go_page', function(page) {
			var data = getOptions();
			data.page =data.pageSize*(page-1);
			getCaseList(data);
	 });
	
	function getOptions() {
		var op = {
			page:0,
			pageSize:10,
		}
		return op;
	}
	/**
	 * get the socket url
	 */
	function getSocketUrl(data){
		imService.getWebSocketUrl(data).success(function(r) {
				if(r){
					$scope.socketUrl=r.url;
					sWSocket.newWebSocket($scope.socketUrl);
					sWSocket.onMessage(callback);
				}
		});
	}
	/**
	 * socket message callback function
	 */
	function callback (evendata){  
        console.log("callback:",evendata); 
        evendata.forEach(function(item){
        	dealMessage(item);
        });
        //reOrder the thread list
        $scope.threads.sort(function(a,b){
        	var t1=a.latest_message.sent_time;
        	var t2=b.latest_message.sent_time;
        	var d1=new Date(t1);
        	var d2=new Date(t2);
        	return d2-d1;
        });
    }
	/**
	 * deal the socket message
	 */
	function dealMessage(message){
		$scope.threads.forEach(function(thread){
			if(thread.thread_id==message.thread_id){	
				try{
					message.body=JSON.parse(message.body);
				}
				catch(e){
					
				}
				thread.total_message_count++;
				thread.latest_message=message;
				if(thread.thread_id==$scope.current_thread_id){
					$scope.messages.push(message);
					$scope.$apply();
					if(message.message_media_type!="AUDIO" && message.read_time==""){
						markAMessage(message.message_id);//Mark a message as read
					}					
				}
				else{
					thread.unread_message_count++;
				}
			}
		});
	}
	/**
	 * Mark a thread messages as read
	 */
	function putMessage(thread_id){
		var data={
				thread_id:thread_id
		}
		imService.putMessage(data).success(function(r) {
			if(r.status=="HTTP/1.1 204 No Content"){
				resetThreadMsgCount(thread_id);
			}
		});
	}
	/**
	 * Mark a message as read
	 */
	function markAMessage(message_id){
		var data={
				message_id:message_id
		}
		imService.markAMessage(data).success(function(r) {
			if(r.status=="HTTP/1.1 204 No Content"){
				//resetThreadMsgCount(thread_id);
			}
		});
	}
	
	/**
	 * Send a new message to a member or multiple members. This API can be used to initiate both private messaging and group conversation (CHAT).
	 */
	function sendMessage (){
		var data={
				subject:"欢迎",
				body:"欢迎来到居然之家",
				recipient_ids:$scope.recipient_ids,
				//command:$scope.message_media_type
		}
		imService.sendMessage(data).success(function(r) {
			if(r.status=="HTTP/1.1 201 Created"){
//				var len=$scope.threads.length;
//				for(var i=0;i<len;i++){
//					//if thread has exist to get the tread messages
//					if(thread.thread_id==r.thread_id){
//						$scope.retrieveMessages(r.thread_id,0);
//						break;
//					}
//				}
//				//if thread does't not exist , add this thread to roomlist and to get the tread messages
//				if(i==len){
//					var nthread={
//						thread_id:r.thread_id,
//						created_date:(new Date()).toUTCString().replace("GMT",""),
//						unread_message_count:0,
//						total_message_count:0,
//						subject:"newmsg",
//						mailbox:"CHAT"
//					}
//					$scope.threads.unshift(nthread);
//					$scope.retrieveMessages(r.thread_id,0);
//				}
				//after create thread success to get the roomlist
				$scope.current_thread_id=r.thread_id;
				getList(getOptions());
				
			}
				
		});
	}
	/**
	 * Get messages for a thread
	 */
	$scope.retrieveMessages=function (thread_id,page){
		var data={
				thread_id:thread_id,
				page:page,
				pageSize:$scope.messageOptions.pageSize
		}
		//$scope.messageOptions.page=page;
		//
		imService.retrieveMessages(data).success(function(r) {
			if(r.status=="HTTP/1.1 200 OK"){
				$scope.current_thread_id=thread_id;//change current thread id
				$scope.current_thread=getCurrentThreadById($scope.current_thread_id);
				
				var len=r.messages.length;
				$scope.messageOptions.retCount=len;
				if(len==0){
					$scope.messageOptions.hasMore=false;
					return;
				}
				else if(len<$scope.messageOptions.pageSize){
					$scope.messageOptions.hasMore=false;
				}
				else{
					$scope.messageOptions.hasMore=true;
				}
				for(var i=0;i<len;i++){
					try{
						if(r.messages[i].message_media_type!="AUDIO" && r.messages[i].read_time==""){
							markAMessage(r.messages[i].message_id);//Mark a message as read
						}						
						r.messages[i].body=JSON.parse(r.messages[i].body);
					}
					catch(e){
						
					}
				}	
				$scope.messages=$scope.messages.concat(r.messages);
				$scope.messages.reverse();
				/*$scope.conf = {
				    currentPage:r.offset+1,
				    totalItems:r.count,
				    itemsPerPage:20,
				};*/
				//
				//putMessage(thread_id);
			}				
		});
	}
	$scope.changeRoom=function(thread_id,page){
		$scope.messages=[];
		$scope.retrieveMessages(thread_id,page);
	}
	/**
	 * on scroll to top load more message
	 */
	$scope.scrollToTop=function(){
		$scope.messageOptions.page=$scope.messages.length;//this page is offset
		console.log("=======================================================================scroll==================================");
		$scope.retrieveMessages($scope.current_thread_id,$scope.messageOptions.page);
	}
	/**
	 * get current thread by thread id
	 */
	function getCurrentThreadById(thread_id){
		var len=$scope.threads.length;
		for(var i=0;i<len;i++){
			if($scope.threads[i].thread_id==thread_id){
				return $scope.threads[i];
			}
		}
		return null;
	}
	/**
	 * reset current thread message count
	 */
	function resetThreadMsgCount(thread_id){
		var thread=getCurrentThreadById(thread_id);
		thread.unread_message_count=0;
	}
	/**
	 * Reply to a private message or a group conversation (CHAT).
	 */
	$scope.replyMessage=function (){
		if($scope.send_msg.length==0)return;
		var data={
				thread_id:$scope.current_thread_id,
				body:encodeURIComponent($scope.send_msg),
				//command:$scope.message_media_type
		}
		imService.replyMessage(data).success(function(r) {
			if(r.status=="HTTP/1.1 201 Created"){
				$scope.send_msg="";
			}
				
		});
	}
	/**
	 * play the audio message
	 */
	$scope.playAudio=function(message){
		var url=message.body.file_url+"M4A.m4a";
		$scope.player.play(url);
		//
		if(message.read_time==""){
			markAMessage(message.message_id);//Mark a message as read
		}		
	}
	/**
	 * show send select image window
	 */
	$scope.showSendWindow = function(){  //打开模态 
		 $(function () { $('#sendimage').modal({
		      keyboard: true
		   })});
    }
	/**
	 * show preview image window
	 */
	$scope.showPreviewWindow = function(size){  //打开模态 
		$(function () { $('#preview').modal({
		      keyboard: true
		   })});
		$scope.send_image_btn_enabled = true;
    }
	/**
	 * get the image file data
	 */
	$scope.getFile = function () {
        fileReader.readAsDataUrl($scope.file, $scope)
                      .then(function(result) {
                          $scope.imageSrc = result;
                          $('#sendimage').modal('hide');
                          $scope.showPreviewWindow();
                      });
    };
	/**
	 * Send media in chat conversation
	 */
	$scope.upLoadMedia=function (){
		if(!$scope.imageSrc)return;
		$scope.send_image_btn_enabled = false;
		var data={
				thread_id:$scope.current_thread_id,
				content_type:"IMAGE",
				file: $scope.file
		}
		/*imService.upLoadMedia(data).success(function(r) {
			if(r.status=="HTTP/1.1 201 Created"){
				
			}
			currentShowModal.dismiss();	
		});*/
		
		fileUpload.uploadFileToUrl('/im/upLoadMedia',data).success(function(r) {
			if(r.status=="200"){
				
			}
			$('#preview').modal('hide');
		});
	}
	$scope.cancel = function(id){
        $("#"+id).modal('hide'); // 退出
    }
	/**
	 * use enter key to send message
	 */
	$scope.onKeyUp=function(event){
		if($scope.send_way==send_way.enter_way){
			if(event.ctrlKey && event.keyCode==13){
				$scope.send_msg=$scope.send_msg+"\n";
			}else if(!event.ctrlKey && event.keyCode==13){
				$scope.replyMessage();
			}
		}else{
			if(event.ctrlKey && event.keyCode==13){
				$scope.replyMessage();
			}else if(!event.ctrlKey && event.keyCode==13){
				$scope.send_msg=$scope.send_msg+"\n";
			}
		}
	}
	/**
	 * change send message way
	 */
	$scope.changeWay=function(value){
		if(value=="enter"){
			$scope.send_way=send_way.enter_way;
		}else{
			$scope.send_way=send_way.ctr_enter_way;
		}
	}
	var currying = function(fn) {
		var counter=0;
	    var args = [].slice.call(arguments, 1);
	    return function() {
	        var newArgs = args.concat([].slice.call(arguments));
	        args=[];
	        counter++;
	        if(counter==$scope.messages.length){
	        	args.push("0");
	        	counter=0;
	        }
	        else{
	        	args.push(newArgs[newArgs.length-1]);
	        }
	        
	        return fn.apply(null, newArgs);
	    };
	};

	/**
	 * judge last message date is not same to this message date
	 */
	$scope.isNotSameDay=currying(function(){
		 var args = [].slice.call(arguments);
     	 var d1=new Date(args[0]);
     	 var d2=new Date(args[1]);
		 if(d1.toDateString()==d2.toDateString()){
			 return false;
		 }
		 else{
			 return true;
		 }
	},$scope.messages.length>0?$scope.messages[0]:"0");
	
});
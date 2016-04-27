/**
Basic Chat UX controller
**/
var Chat= (function() {
	var Server;
	var connected=false;
	var member=null;
	var selectedThreadId=null;//id of currently selected thread

	var XAFC = 'PA1ONA';//CHANGE THIS PER ENVIRONMENT
	var APP_ID=96;
	var messageHash={};
	//urls
	var BASE_URL_FRN_ALPHA='ws://54.243.202.234:9300/api/v2/connect';
	var BASE_URL_CURIE_ALPHA='https://alpha-api.acg.autodesk.com/api/v2';
	var XAFC_ALPHA='PA1ONA';

	var BASE_URL_FRN_BETA='ws://api.beta.squidplatform.com:9300/api/v2/connect';
	var BASE_URL_CURIE_BETA='https://beta-api.acg.autodesk.com/api/v2';
	var XAFC_BETA='PA1ONB';

	//D64229FA-CEB0-4091-853E-1E214C27ACC8
	//end urls

	var init=function(){
	var local=getQueryVariable('env');
		if(local!=false&&local.toUpperCase()==='ALPHA'){
	            log("Setting url's to alpha mode");
	            BASE_URL=BASE_URL_FRN_ALPHA;
	            FAYE_URL=FAYE_URL_CURIE_ALPHA;
	            XAFC=XAFC_ALPHA;
	     }

	     else{
	     	log("Setting url's to beta mode");
			BASE_URL_FRN=BASE_URL_FRN_BETA;
			BASE_URL_CURIE=BASE_URL_CURIE_BETA;
			XAFC=XAFC_BETA;
		}
	}

	/**
    *parse query params to check if running in local mode
    */

    var getQueryVariable=function(variable)
    {
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
    }

	var log=function(data){
        console.log('\\n');
        console.log(data);
        var txt = $(".log");
        txt.val( txt.val() + "\n"+data);
        txt.scrollTop(txt[0].scrollHeight);
    };

    /**
    * get member info and cache it for future api calls
    */

    var getMemberInfo=function(memberSession){

    	var api_url = BASE_URL_CURIE + "/members";
        log("Sending POST request to: "+api_url);
        jQuery.ajax({
             type: 'GET',
             url: api_url,
             beforeSend: function(xhr){
	                xhr.setRequestHeader("X-AFC", XAFC);
	                xhr.setRequestHeader("X-SESSION", memberSession);
	                xhr.setRequestHeader("Accept", "application/json");
	            },
             success: function(data){
                var json_str=JSON.stringify(data);
                log("Server response:"+json_str);
                member_resp=data;
             },
             error: function(error){
                var json_str=JSON.stringify(error);
                log("Server Error:"+json_str);
             },
             async:   false
        }); 
        return member_resp;
    }

    /** 
    * connect to server
    **/

    var connect=function(){
    	if(connected){
    		log("already connected, refresh page to disconnect first");
    	}
        log("Connecting...");
        	var supportedDeviceTypes = ['IOS','ANDROID','WIN'];

			var memberSession = $('.session-id').val();
			var memberDeviceType = 'WIN'
			var memberDeviceId = memberSession;//do this for web only!!! need real device id for mobile apps for Push fallback
			var memberAppId =APP_ID;
			var memberId=null;

			if (!memberSession || memberSession.length == 0){
				alert('Member session is required');
				return false;
			}

			member=getMemberInfo(memberSession);
			

			if (!member.member || !member.member.id|| member.member.id.length == 0 || !$.isNumeric(member.member.id)){
				alert('Member id is required and must be a numeric value');
				return false;
			}
			else{
				member=member.member;
				memberId=member.id;
				member.session=memberSession;//lets put this on member for future use
			}
			

			log('Connecting...');
			
			//create a instance
			//parameter: 
			//appId
			//messageVersion: This is used to register web device for the user on MP. Usually it is "v1"
			//tenantId: For applications who use MP API, this is "123D". For applications who only use ADA, this is the tenantId
			//member id
			//session id for MP user. For ADA user, please pass empty string
			// 20704130 E1338EC8-78F5-43D2-B5A3-2CA8478083FB e8a626f8ace169452f9c31ffa1629d2fefeb563066d67eee604514a12e88b956
			Server = new NotificationServer(memberAppId,
											'v1',
											'123D', 
											memberId, 
											memberSession,
											memberDeviceType.toUpperCase(),
											memberDeviceId,BASE_URL_FRN
										   );
			
			$('#message').keypress(function(e) {
				if (e.keyCode == 13 && this.value) {
					log('You: ' + this.value);
					send(this.value);

					$(this).val('');
				}
			});

			Server.registerOnConnectedCallBack(function(message) {
				log("Connected!");// Let the user know they are connected
				
				setMemberConnected(true);
				
				//Add by Blair 2015-12-24 ==================================================================================== Start
				//sendNew();
				//Add by Blair 2015-12-24 ==================================================================================== End
			});

			Server.registerOnMessageCallBack(function(message) {//must-have callBack for message
				log("notification message");
				log("Current time = " + (new Date()).getTime());
				log(message);
				var parsedMessage=parseMessageWS(message);
				addChatThread(parsedMessage);
				//add every message to cache so we dont have to go back each time we switch threads
				addToMessageCache(parsedMessage);
			});
			
			Server.registerOnCloseCallBack(function() {
				log("Disconnected by server");
				setMemberConnected(false);
			});
			
			Server.registerOnValidateErrorCallBack(function(message) {
				// message = MISSING_MEMBER_ID, MISSING_SESSION_ID, MISSING_APP_ID,
				// MISSING_TENANT_ID, MISSING_MESSAGE_VERSION,MISSING_ON_MESSAGE_CALL_BACK,MISSING_ON_CLOSE_CALL_BACK
				// MESSAGE_VERSION_INVALID, SESSION_INVALID
				log("validateError");
				log(message);
				setMemberConnected(false);
			});
			
			Server.registerOnConnectErrorCallBack(function(message) {
				log("connectError: " + message);
				setMemberConnected(false);
				// If message = SERVER_BUSY, the server has too many connect requests at one time and is reach throttling limit.
				// Please try again later.
				// If message = ERROR_INPUT, user should not send any message to
				// server, hence the server disconnect the user.
			});
			
			//callback when register web as the user's device on MP. message="REGISTRATION_FAILURE: {message returned when calling PUT /DEVICE in MP}"
			Server.registerOnRegisterFailCallBack(function(message) {
				log(message);
				setMemberConnected(false);
			});
			
			Server.start();
    };


    /**
     Set the conneciton display label based on conneciton state
    **/

    var setMemberConnected=function(isConnected){
    	if(isConnected){
    		connected=true;
    		$(".member-info").html("Connected id:"+member.id+", name:"+member.name);
    		$(".connection-required").prop('disabled', false);
			
			//Add by Blair 2015-12-24 ==================================================================================== Start
			$("#ClientID").val(member.id);
			$("#ClientName").val(member.name);
			//alert("ClientID ==> " + $("#ClientID").val());
			$("title").html($("title").html() + " ( " + member.name + " -- " + member.id + ")");
			//Add by Blair 2015-12-24 ==================================================================================== End
    	}
    	else{
    		isConnected=false;
    		$(".member-info").html("Disconnected");
    		$(".connection-required").prop('disabled', true);
    	}
    }

    var parseMessageWS=function(message){
    	message=jQuery.parseJSON(message);
    	message=message[0];
    	var parsedMessage={};
    	var data=message.data.split(",");
    	parsedMessage.message_id=data[0];
    	parsedMessage.thread_id=data[1];
    	parsedMessage.chat_subject=data[2];
    	parsedMessage.chat_sender=message.args.split(",")[0];
    	parsedMessage.chat_message=message.args.split(",")[1];
    	return parsedMessage;

    }

    /**
    * add a new thread to list menu if not already present
    **/
    var addChatThread=function(message){
    	//first check if thread is aleady in list
    	
   
    	var thread_id=message.thread_id;
    	var chat_subject=message.chat_subject;
    	var chat_sender=message.chat_sender;
    	var chat_message=message.chat_message;

    	var chatItem=$(".chat-list").find("#"+thread_id);
    	//if not add it to the list
    	if(!chatItem||chatItem.length==0){
    		chatItem="<a class=\"chat-item list-group-item\" id=\"" +thread_id+ "\">" + chat_subject +"("+thread_id+")</a>";
    		$(".chat-list").append(chatItem);
    		$("#"+thread_id).click(switchThread);
    	}
    	var selectedItem=$(".chat-list").find(".active");
    	if(!selectedItem||selectedItem.length==0){
    		setSelectedThread(thread_id,true);
    	}
    	if(selectedThreadId==thread_id){
    		showMessage(message);
    		/**
    		VERY IMPORTANT: Always mark the displayed message as read so it doesn't come back when querying for unread messages on the thread
    		**/
    		markAsRead(message.message_id,false);
    	}
    	else{
    		updateDeselectedThread(message);
    	}

    }

    /**
    *switch the selected thread to a new thread on the list menu 
    */
    var switchThread=function(event){
    	var target=event.target;
    	var thread_id=target.id;
    	var currentSelected=selectedThreadId;
    	setSelectedThread(currentSelected,false);
    	selectedThreadId=thread_id;
    	setSelectedThread(selectedThreadId,true);
    	clearMessages();//clear existing pane
    	var messages=messageHash[thread_id];
    	if(messages&&messages.length>0){
    		for(var i=0;i<messages.length;i++){
    			showMessage(messages[i]);
    		}
    	}
    	/**
    	now mark the whole thread as read
    	THIS IS VERY IMPORTANT!! otherwise these messages will come back when queried for "unread in future"
    	**/
    	markAsRead(selectedThreadId,true);
    	

    }


    /**
    *set the thread for this message as selected
    **/
    var setSelectedThread=function(thread_id, isSelected){
    	//if there is no selected item, make this thread the selected item
    	//otherwise update the unread message count for the thread item 
    	//and push this message into the has for the thread to be loaded when thread is clicked
		
		if(isSelected){
			selectedThreadId=thread_id;
			$(".chat-list").find("#"+selectedThreadId).addClass("active");
			$(".chat-list").find("#badge_"+thread_id).remove();
		}
		else{
			$(".chat-list").find("#"+selectedThreadId).removeClass("active");
		}
		$(".thread-selected-required").prop('disabled', false);
			
    	updateRecipientListSection(selectedThreadId);
    }

 	/**
 		if a thread is not selected then update its unread count using badges
 	**/
  var updateDeselectedThread=function(message){
    	var thread_id=message.thread_id;
    	var badge=$("#badge_"+thread_id);
		if(!badge||badge.length==0){
			$(".chat-list").find("#"+thread_id).append("<span id='badge_"+thread_id+"' class='badge'>1</badge>")
		}
		else{
			var val=$("#badge_"+thread_id).html();
			$("#badge_"+thread_id).html(parseInt(val)+1);
			
		}
		
    }


    /**
    	Update the thread recipient metadata, used when a thread is selected
    **/
    var updateRecipientListSection=function(thread_id){
    	var api_url = BASE_URL_CURIE + "/members/"+member.id+"/threads/"+thread_id;
    

        log("Sending GET request to: "+api_url);
        
        jQuery.ajax({
             type: 'GET',
             url: api_url,
             beforeSend: function(xhr){
	                xhr.setRequestHeader("X-AFC", XAFC);
	                xhr.setRequestHeader("X-SESSION", member.session);
	                xhr.setRequestHeader("Accept", "application/json");
	            },
             success: function(data,textStatus,xhr){
                log("Server response:"+xhr.status);
                var json_str=JSON.stringify(data);
                log("Server Data:"+json_str);
                if(selectedThreadId==data.thread_id){//just in case thread switched already
	                var group=data.recipients;
	                group.push(data.sender)
	                var list="<h5>";
	                for (var i=0;i<group.length;i++){
	                	var currentMember=group[i];
	                	if(currentMember.id==member.id){
	                		continue;
	                	}
	                	list=list+(currentMember.name+ "("+currentMember.id+"),  ");
	                }
	                list=list+"<h5>";
	                $(".recipient-list").html(list);
	                //TODO: TEMPORARILY COMMENT THIS OUT UNTIL REDIS IS SETUP CORRECTLY ON BETA
	                //setThreadRecipientsOnlineStatus(group,selectedThreadId);
            	}
              
             },
             error: function(error){
                var json_str=JSON.stringify(error);
                log("Server Error:"+json_str);

             },
        }); 
        return true;
    }




    /**
    Set online status for members
    **/

    var setThreadRecipientsOnlineStatus=function(group, threadId){
    	var api_url = BASE_URL_CURIE + "/members/online/?app_id=96&recipient_ids=";
    	var memberHash={};
    	for (var i=0;i<group.length;i++){
    		api_url=api_url+group[i].id;
    		memberHash[group[i].id]=group[i];
    		if(i<group.length-1){
    			api_url=api_url+",";
    		}
    	}
        log("Sending GET request to: "+api_url);
        
        jQuery.ajax({
             type: 'GET',
             url: api_url,
             beforeSend: function(xhr){
	                xhr.setRequestHeader("X-AFC", XAFC);
	                xhr.setRequestHeader("X-SESSION", member.session);
	                xhr.setRequestHeader("Accept", "application/json");
	            },
             success: function(data,textStatus,xhr){
                log("Server response:"+xhr.status);
                var json_str=JSON.stringify(data);
                log("Server Data:"+json_str);
                if(selectedThreadId==threadId){//just in case thread switched already
	                var group=data.member_chat_status;
	                var list="<h5>";
	                for (var i=0;i<group.length;i++){
	                	var currentMember=memberHash[group[i].member_id];
	                	if(currentMember.id==member.id){
	                		continue;
	                	}
	                	var statusLabel=group[i].online_status?"Online":"Offline";
	                	list=list+(currentMember.name+ "("+currentMember.id+"):"+statusLabel+",");
	                }
	                list=list+"<h5>";
	                $(".recipient-list").html(list);
	          
            	}
              
             },
             error: function(error){
                var json_str=JSON.stringify(error);
                log("Server Error:"+json_str);

             },
        }); 
        return true;
    }


    /**
    	show message 
    **/
    var showMessage=function(message){
		/*================================================================================================================
    	var txt = $(".chat-comment");
    	txt.val( txt.val() + "\n"+message.chat_sender +":");
    	txt.val( txt.val() + "\n"+message.chat_message);
    	txt.scrollTop(txt[0].scrollHeight);	
		================================================================================================================*/
		//Add by Blair 2015-12-24 ==================================================================================== Start
		var messageTab = "<div class='";
		messageTab += $("#ClientName").val() == message.chat_sender ? "self" : "other";
		messageTab += "' >";
		messageTab += "<img src='img/photo.jpg' alt=''/>";
		messageTab += "<div class='massages'>";
		messageTab += "<div class='tip'></div>";
		messageTab += "<p>" + message.chat_sender + "</p>";
		messageTab += "<span class='time'> " + message.chat_message + " </span>";
		messageTab += "</div>";
		var txt = $(".ChatBoaard");
    	//txt.html( txt.html() + "\n"+message.chat_sender +":");
    	//txt.html( txt.html() + "\n"+message.chat_message);
		txt.html(txt.html() + messageTab);
		txt.scrollTop(txt[0].scrollHeight);	
		//Add by Blair 2015-12-24 ==================================================================================== End
    }

    /**
    *clear all messages from message display panel
    **/
    var clearMessages=function(){
    	var txt = $(".chat-comment");
    	txt.val("");
    }

    var addToMessageCache=function(message){
    	var thread_id=message.thread_id;
    	//save to message hash for later display
    	if(!messageHash[thread_id]){
    			messageHash[thread_id]=[];
    	}
    	messageHash[thread_id].push(message);
    }

    /**
    mark a message or thread as read
    */
    var markAsRead=function(id,isThread){

    	var api_url = BASE_URL_CURIE + "/members/"+member.id+"/messages";
    	var params={
    		id:member.id,
    		
    		action:'read',
    	};
    	if(isThread){
    		params.thread_id=id;
    	}
    	else{
    		params.message_id=id;
    	}
    	params=jQuery.param(params);

        log("Sending PUT request to: "+api_url);
        log("With data:"+params);
        jQuery.ajax({
             type: 'PUT',
             url: api_url,
             data : params,
             beforeSend: function(xhr){
	                xhr.setRequestHeader("X-AFC", XAFC);
	                xhr.setRequestHeader("X-SESSION", member.session);
	                xhr.setRequestHeader("Accept", "application/json");
	            },
             success: function(data,textStatus,xhr){
                log("Server response:"+xhr.status);
              
             },
             error: function(error){
                var json_str=JSON.stringify(error);
                log("Server Error:"+json_str);
             },
        }); 
        return true;
    }


    /**
    * get member info
    */

    var sendNew=function(){
		//alert("sendNew");
    	if(!connected){
    		log("Not connected. Create connection first!");
    		return false;
    	}
		
		/*==========================================================================================================
    	var recipient_id_input=$('.new-chat-recipients').val();
    	var subject_input= $('.new-chat-subject').val();
    	var chat_message=$('.new-chat-message').val();
		============================================================================================================*/
		//Add by Blair 2015-12-24 ==================================================================================== Start
    	var recipient_id_input="20707258";
    	var subject_input="Chat Subject";
    	var chat_message="Chat Message";
		//Add by Blair 2015-12-24 ==================================================================================== End
    	if(!recipient_id_input||recipient_id_input.length==0){
    		alert("recipient_ids must be a comma seperated list");
    	}
    	if(!subject_input||subject_input.length==0){
    		alert("Subject is required");
    	}
    	if(!chat_message||chat_message.length==0){
    		alert("Chat message is required");
    	}
    	var api_url = BASE_URL_CURIE + "/members/"+member.id+"/messages";
    	var params=jQuery.param({
    		recipient_ids:recipient_id_input,
    		subject:subject_input,
    		mailbox:'CHAT',
    		body:chat_message,
    		app_id:APP_ID
    	})
        log("Sending POST request to: "+api_url);
        log("With data:"+params);
        jQuery.ajax({
             type: 'POST',
             url: api_url,
             data : params,
             beforeSend: function(xhr){
	                xhr.setRequestHeader("X-AFC", XAFC);
	                xhr.setRequestHeader("X-SESSION", member.session);
	                xhr.setRequestHeader("Accept", "application/json");
	            },
             success: function(data){
                var json_str=JSON.stringify(data);
                log("Server response:"+json_str);
             },
             error: function(error){
                var json_str=JSON.stringify(error);
                log("Server Error:"+json_str);
             },
             async:   false
        }); 
        return true;
    }

    var sendReply=function(){

    	if(!connected){
    		log("Not connected. Create connection first!");
    		return false;
    	}
    	if(!selectedThreadId||selectedThreadId.length==0){
    		log("no selected thread!");
    		return false;
    	}
    	
    	//var chat_message=$('.send-text').val();
		//Add by Blair 2015-12-24 ==================================================================================== Start
    	var chat_message=$('.msg-input').val();
		//Add by Blair 2015-12-24 ==================================================================================== End
    	if(!chat_message||chat_message.length==0){
    		log("enter some text to send!!");
    		return false;
    	}
    	
    	var api_url = BASE_URL_CURIE + "/members/"+member.id+"/messages/reply";
    	var params=jQuery.param({
    		mailbox:'CHAT',
    		body:chat_message,
    		thread_id:selectedThreadId
    		//subject:"dummysubject" //to be removed by api team
    	})
        log("Sending POST request to: "+api_url);
        log("With data:"+params);
        jQuery.ajax({
             type: 'POST',
             url: api_url,
             data : params,
             beforeSend: function(xhr){
	                xhr.setRequestHeader("X-AFC", XAFC);
	                xhr.setRequestHeader("X-SESSION", member.session);
	                xhr.setRequestHeader("Accept", "application/json");
	            },
             success: function(data){
                var json_str=JSON.stringify(data);
                log("Server response:"+json_str);
                member_resp=data;
             },
             error: function(error){
                var json_str=JSON.stringify(error);
                log("Server Error:"+json_str);
             },
             async:   false
        }); 
        //$('.send-text').val("");
		//Add by Blair 2015-12-24 ==================================================================================== Start
    	$('.msg-input').val('');
		//Add by Blair 2015-12-24 ==================================================================================== End
        return true;

    }

    /**
    *set thread id in the modal dialog
    */
    var startAddRecipient=function(){
    	if(selectedThreadId==null){
    		return false;
    	}
    	$(".add-recipient-title").html("Add Recipient for:"+selectedThreadId);
    }
    /**
    * call add recipient request
    **/
    var addRecipient=function(){
    	if(!connected){
    		log("Not connected. Create connection first!");
    		return false;
    	}
    	var recipient_id_input=$('.add-chat-recipients').val();
    	
    	if(!recipient_id_input||recipient_id_input.length==0){
    		alert("recipient_ids must be a comma seperated list");
    	}
    	//{member_id}/recipients?thread_id,recipient_ids
    	var api_url = BASE_URL_CURIE + "/members/"+member.id+"/recipients";
    	var currentThread=selectedThreadId;
    	var params=jQuery.param({
    		recipient_ids:recipient_id_input,
    		thread_id:selectedThreadId
    	
    	})
        log("Sending POST request to: "+api_url);
        log("With data:"+params);
        jQuery.ajax({
             type: 'POST',
             url: api_url,
             data : params,
             beforeSend: function(xhr){
	                xhr.setRequestHeader("X-AFC", XAFC);
	                xhr.setRequestHeader("X-SESSION", member.session);
	                xhr.setRequestHeader("Accept", "application/json");
	            },
             success: function(data){
             	var json_str=JSON.stringify(data);
                log("Server response:"+json_str);
                updateRecipientListSection(currentThread);
             },
             error: function(error,textStatus,xhr){
                var json_str=JSON.stringify(error);
                log("Server Error:"+json_str);
                log("Server response:"+xhr.status);
             }
        }); 
        return true;

    }

    // Public API
    return {
    	init:init,
        connect: connect,
        sendNew:sendNew,
        sendReply:sendReply,
        startAddRecipient:startAddRecipient,
        addRecipient:addRecipient
        
    };

})();


$( document ).ready( function() {

	Chat.init();
    
    $(".connect-button").click(Chat.connect);
    $(".new-chat-create-button").click(Chat.sendNew);
    //$(".send-reply-button").click(Chat.sendReply);
	//Add by Blair 2015-12-24 ==================================================================================== Start
	$(".msg-input-submit").click(Chat.sendReply);
	//Add by Blair 2015-12-24 ==================================================================================== End
    $(".add-recipient-start-button").click(Chat.startAddRecipient);
    $(".add-recipient-button").click(Chat.addRecipient);

    $(".connection-required").prop('disabled', true);
    $(".thread-selected-required").prop('disabled', true);
    


});
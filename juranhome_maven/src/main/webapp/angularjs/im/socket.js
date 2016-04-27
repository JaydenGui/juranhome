/************************************************************* 
******************Angular Websocket Service****************** 
******************author:sunhuaixing****************************** 
******************created:2014-04-01**************************/  
angular.module('websocketService', [])  
    .service('sWSocket', ['$timeout', function ($timeout) {  
        var self = this;  
        var callbackPool = []; //onMessage分类处理函数  
        var delayPool = []; //延迟处理请求  
        var registerPool = [];//已注册的方法  
        var data = {};  
        var ws = null;  
        var connected = false;  
        var url="";
        var onMessageCallBack=null;
  
        self.newWebSocket = function (wsURL) {  
        	url=wsURL;
        	ws = new WebSocket(wsURL);  
        	ws.onopen = onOpen;
        	ws.onmessage = onMessage;  
        	ws.onclose = onclose;  
        	ws.onerror = onError;  
            return ws;  
        }
  
        //ws = newWebSocket();  
        /**
         * on socket open
         */
        function onOpen(event) {  
            ws.readyState = true;                           
        }  
        /**
         * on socket close
         */
        function onclose(event) {  
            ws.readyState = false;  
            
            $timeout(function () {  
                console.log('Reconnecting to server...')  
                self.newWebSocket(url);  
            }, 3000);  
        }  
        /**
         * on socket message
         */
        function onMessage(evnt) {  
            //这里处理接收数据  
        	if(evnt.data!="SERVER_BUSY" && evnt.data!="SUCCESS"){
        		try{
        			var evenData = JSON.parse(evnt.data);  
	                 console.log("Received data from websocket: ", evenData);
	                 //执行回调函数  
	                 //传回后端实时推送的数据  
	                 onMessageCallBack(evenData);
        		}catch(e){
        			console.log("on parse json error!",e);
        		}       		 
        	}             
        }  
        /**
         * on socket error
         */
        function onError(evnt) {  
            ws.readyState = false;  
            console.log('ERROR: ', evnt);  
            $timeout(function () {  
                console.log('Reconnecting to server...')  
                self.newWebSocket(url);  
            }, 3000);  
        }  
        /**
         * add message callback function
         */
        self.onMessage=function(callbackFun){
        	onMessageCallBack=callbackFun;
        }
         
  
         
        return self;  
    }]); 
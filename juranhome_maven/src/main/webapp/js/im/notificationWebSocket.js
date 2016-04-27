var NotificationServer = function(appId, messageVersion, tenantId, memberId,
		sessionId, deviceType, deviceId,base_url) {
	var callbacks = {};

	var conn;
	var baseUrl = base_url; //url to connect to
	//var baseUrl = 'ws://127.0.0.1:9300';
	var ws_appId = appId;
	var ws_messageVersion = messageVersion;
	var ws_tenantId = tenantId;
	var ws_memberId = memberId;
	var ws_sessionId = sessionId;
	var ws_system = 'MP';
	var ws_device_type = deviceType; // change this to device that you want to test as 
	var ws_device_id = deviceId;
	var ws_url = '';
	var ws_hasError = false;

	//callBacks
	var onMessageCallBack = null;
	var onCloseCallBack = null;
	var onValidateErrorCallBack = null;
	var onConnectErrorCallBack = null;
	var onConnectedCallBack = null;
	var onRegisterFailCallBack = null;
	
	
	this.bind = function(event_name, callback) {
		callbacks[event_name] = callbacks[event_name] || [];
		callbacks[event_name].push(callback);
		return this; // chainable
	};

	this.send = function(event_name, event_data) {
		this.conn.send(event_data);
		return this;
	};

	this.start = function() {
		this.prepareCallBacks();
		this.validate(ws_memberId, ws_sessionId, ws_appId, ws_tenantId);
		if (!ws_hasError) {
			this.connect(ws_memberId, ws_sessionId);
		}
		ws_hasError = false;
	}

	this.validate = function(memberId, sessionId, appId, tenantId) {
		if (!memberId) {
			dispatch('validateError', 'MISSING_MEMBER_ID');
			ws_hasError = true;
		}
		if (!sessionId) {
			dispatch('validateError', 'MISSING_SESSION_ID');
			ws_hasError = true;
		}
		if (!appId) {
			dispatch('validateError', 'MISSING_APP_ID');
			ws_hasError = true;
		}
		if (!tenantId) {
			dispatch('validateError', 'MISSING_TENANT_ID');
			ws_hasError = true;
		}
		if (!ws_messageVersion) {
			dispatch('validateError', 'MISSING_MESSAGE_VERSION');
			ws_hasError = true;
		} else if (ws_messageVersion != 'v1') {
			dispatch('validateError', 'MESSAGE_VERSION_INVALID');
			ws_hasError = true;
		}
		if (tenantId == '123D') {
			ws_system = 'MP';
		} else {
			ws_system = 'ADA';
		}
		if (onMessageCallBack == null) {
			dispatch('validateError', 'MISSING_ON_MESSAGE_CALL_BACK');
			ws_hasError = true;
		}
		if (onCloseCallBack == null) {
			dispatch('validateError', 'MISSING_ON_CLOSE_CALL_BACK');
			ws_hasError = true;
		}
	}

	this.connect = function(memberId, sessionId) {
		var ws_url = baseUrl.concat('?sessionId=', sessionId, 
									'&memberId=', memberId, 
									'&appId=', ws_appId,
									'&deviceType=', ws_device_type,
									'&deviceId=', ws_device_id,
									'&messageVersion=', ws_messageVersion
									);
		// ws_url ='ws://127.0.0.1:9300?sessionId=93E2AC5E-A214-4C33-9420-9C7BE49C324A&memberId=20704112&appId=19&system=MP&messageVersion=V1'
		if (typeof (MozWebSocket) == 'function')
			this.conn = new MozWebSocket(ws_url);
		else
			this.conn = new WebSocket(ws_url);

		// dispatch to the right handlers
		this.conn.onmessage = function(evt) {
			if (evt.data == "SESSION_INVALID") {
				dispatch('validateError', evt.data);
			} else if (evt.data.indexOf("REGISTRATION_FAILURE") >-1 ) {
				dispatch('registerFail', evt.data);
			} else if (evt.data == "ERROR_INPUT") {
				dispatch('connectError', evt.data);
			} else if (evt.data == "SERVER_BUSY") {
				dispatch('connectError', evt.data);
			} else if (evt.data == "SUCCESS") {
				dispatch('success', null); // connect with server successfully
			} else {
				dispatch('message', evt.data);
			}

		};

		this.conn.onclose = function() {
			dispatch('close', null)
		}
		this.conn.onopen = function() {
			dispatch('open', null)
		}

	};

	this.disconnect = function() {
		this.conn.close();
	};

	var dispatch = function(event_name, message) {
		var chain = callbacks[event_name];
		if (typeof chain == 'undefined')
			return; // no callbacks for this event
		for ( var i = 0; i < chain.length; i++) {
			chain[i](message)
		}
	}

	this.prepareCallBacks = function() {
		this.bind('close', function() {
			if (onCloseCallBack != null) {
				onCloseCallBack();
			}
		});

		this.bind('validateError', function(message) {
			if (onValidateErrorCallBack != null) {
				onValidateErrorCallBack(message);
			}
		});

		this.bind('connectError', function(message) {
			if (onConnectErrorCallBack != null) {
				onConnectErrorCallBack(message);
			}
		});

		this.bind('success', function() {
			if (onConnectedCallBack != null) {
				onConnectedCallBack();
			}
		});

		this.bind('message', function(message) {
			if (onMessageCallBack != null) {
				onMessageCallBack(message);
			}
		});

		this.bind('registerFail', function(message) {
			if (onRegisterFailCallBack != null) {
				onRegisterFailCallBack(message);
			}
		});

	}

	//callBack APIs
	this.registerOnMessageCallBack = function(callback) {
		onMessageCallBack=callback;
	}
	this.registerOnCloseCallBack = function(callback) {
		onCloseCallBack=callback;
	}
	this.registerOnValidateErrorCallBack = function(callback) {
		onValidateErrorCallBack=callback;
	}
	this.registerOnConnectErrorCallBack = function(callback) {
		onConnectErrorCallBack=callback;
	}
	this.registerOnConnectedCallBack = function(callback) {
		onConnectedCallBack=callback;
	}
	this.registerOnRegisterFailCallBack = function(callback) {
		onRegisterFailCallBack=callback;
	}
	
};

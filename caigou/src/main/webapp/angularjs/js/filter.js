/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *+ Custom angular filter
 *+==========================================================================+
 *+@autho: zhigang.fang
 *+==========================================================================+
 *+@date: 2016-05-10 10:29
 *+==========================================================================+*/
'use strict';
/*Word length limit filter*/
app.filter('limit', function() {
    return function(input, num) {
        if (!input) {
            return;
        }
        var len = input.length;
        if (len > num) {
            return input.substr(0, num) + '…';
        } else {
            return input;
        }
    }
});
/*Interception of a string to get the file name */
app.filter('split', function() {
    return function(input, src) {
        var tmp = input.split(src);
        return tmp[tmp.length - 1];
    }
});
/*Remove the last end bit of the string */
app.filter('division', function() {
    return function(input, end) {
        var tmp = input.substr(0, input.length - end);
        console.log(tmp);
        return tmp;
    }
})
app.filter('offset', function() {
    return function(input, start) {
        start = parseInt(start, 10);
        return input.slice(start);
    }
});
//Get the parameter of the URL address
app.filter('getQueryString', function($location) {
    return function(item) {
    	
        sValue=$location.absUrl().match(new RegExp("[\/\]"+item+"/([^\/]*)(\/?)","i"));
        return sValue?sValue[1]:sValue;
    }
});
//Verify not null 
app.filter('VerifyPhone', function() {
    return function(str) {
        if(number){
            return true;
        }else{
        	return false;
        }
    }
});

//Verify phone number 
app.filter('VerifyPhone', function() {
    return function(number) {
    	var isPhone = /^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
        if(number){
        	if(isPhone.test(number)){
        		return true;
        	}else{
        		return false;
        	}
        }else{
        	return false;
        }
    }
});

app.filter('VerifyPsaaword', function() {
    return function(str) {
    	var isPassword =/(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]{6,}/;
        if(isPassword.test(str)){
        	return true;
        }else{
        	return false;
        }
    }
});


//案例库风格替换
app.filter('replaceStyle', function() {
    return function(str) {
        if(str=='Japan'){
        	return '日式';
        }else if(str=='korea'){
        	return '韩式';
        }else if(str=='Mashup'){
        	return '混搭';
        }else if(str=='european'){
        	return '欧式';
        }else if(str=='chinese'){
        	return '中式';
        }else if(str=='neoclassical'){
        	return '新古典';
        }else if(str=='ASAN'){
        	return '东南亚';
        }else if(str=='US'){
        	return '美式';
        }else if(str=='country'){
        	return '田园';
        }else if(str=='countryside'){
        	return '田园';
        }else if(str=='modern'){
        	return '现代';
        }else if(str=='mediterranean'){
        	return "地中海"
        }else if(str=='newClassical'){
        	return "新古典"
        }else if(str=='mashup'){
        	return "混搭"
        }else if(str=='america'){
        	return "美式"
        }else if(str=='other'){
        	return '其它';
        }else{
        	return str;
        }
    }
});

//替换户型
app.filter('replaceRoomType', function() {
    return function(str) {
        if(str=='one'){
        	return '一室';
        }else if(str=='two'){
        	return '二室';
        }else if(str=='three'){
        	return '三室';
        }else if(str=='four'){
        	return '四室';
        }else if(str=='five'){
        	return '五室';
        }else if(str=='loft'){
        	return 'LOFT';
        }else if(str=='multiple'){
        	return '复式';
        }else if(str=='US'){
        	return '美式';
        }else if(str=='villa'){
        	return '别墅';
        }else {
        	return '其它';
        }
    }
});
//替换厅
app.filter('replaceBedRoom', function() {
    return function(str) {
        if(str=='one'){
        	return '一厅';
        }else if(str=='two'){
        	return '二厅';
        }else if(str=='three'){
        	return '三厅';
        }else if(str=='four'){
        	return '四厅';
        }else if(str=='five'){
        	return '五厅';
        }else if(str=='other'){
        	return '其它';
        }else{
        	return str;
        }
    }
});

//替换卫
app.filter('replaceRestRoom', function() {
    return function(str) {
        if(str=="one"){
        	return '一卫';
        }else if(str=='two'){
        	return '二卫';
        }else if(str=='three'){
        	return '三卫';
        }else if(str=='four'){
        	return '四卫';
        }else if(str=='five'){
        	return '五卫';
        }else if(str=='other'){
        	return '其它';
        }else{
        	return str;
        }
    }
});

//替換area
app.filter('replaceArea',function(){
	return function(str){
		if(str=='one'){
			return '60平米以下';
		}else if(str=='two'){
			return '60-80平米';
		}else if(str=='three'){
			return '80-120平米';
		}else if(str=='five'){
			return '120平米以上';
		}else{
			return str;
		}
	}
});


//替換房屋類型
app.filter('replaceHouseType',function(){
	return function(str){
		if(str=='house'){
			return '住宅空间';
		}else if(str=='catering'){
			return '餐饮空间';
		}else if(str=='office'){
			return '办公空间';
		}else if(str=='hotel'){
			return '酒店空间';
		}else if(str=='business'){
			return '商业展示';
		}else if(str=='entertainment'){
			return '娱乐空间';
		}else if(str=='leisure'){
			return '休闲场所';
		}else if(str=='culture'){
			return '文化空间';
		}else if(str=='healthcare'){
			return '医疗机构';
		}else if(str=='sale'){
			return '售楼中心';
		}else if(str=='finace'){
			return '金融场所';
		}else if(str=='sport'){
			return '运动场所';
		}else if(str=='education'){
			return '教育机构';
		}else if(str=='other'){
			return '其他';
		}else{
			return '其他';
		}
	}
});

//datetime filter
app.filter('replaceDate',function(){
	return function(str){
		var now=$filter('date')(str, 'yyyy-MM-dd');
		alert(now);
		return ;
	}
});
//decode the encoded html
app.filter('htmlDecode',function(){
	return function(str){
		var s="";
	    if(str.length ==0) return "";
	    s = str.replace(/&amp;/g, "&");
	    s = s.replace(/&lt;/g, "<");
	    s = s.replace(/&gt;/g, ">");
	    s = s.replace(/&nbsp;/g, " ");
	    s = s.replace(/&#39;/g, "\'");
	    s = s.replace(/&quot;/g, "\"");
	    s = s.replace(/<br>/g, "\n");
	    return s; 
	}
});
//cut string filter
app.filter('getContent',function(){
	return function(str,type){
		var temp="";
		var retStr=str;
		try{
			temp=JSON.parse(str);
		}
		catch(e){
			
		}
		if(temp instanceof Object){
			if(type=="designer"){
				retStr=temp.for_designer;
			}
			else{
				retStr=temp.for_consumer;
			}
		}
		return retStr;
	}
});
//cut string filter
app.filter('substr',function(){
	return function(str,len){
		len=len||70;
		var mystr=str;
		if(str.length>len)
		{
			mystr=str.substr(0,len)+"...";
		}		
		return mystr;
	}
});

//format data filter
app.filter('fdate',function(){
	return function(strTime){		
		var date = new Date(strTime);
	    var now=new Date();
	    var interval=(now-date)/1000;
	    var returnStr=strTime;
	    if(interval<60){
	    	returnStr="刚刚";
	    }else if(interval<600){
	    	returnStr=Math.floor(finterval/60)+"分钟前";
	    }else if(now.getDate()-date.getDate()==0){
	    	returnStr=date.getHours()+":"+date.getMinutes()+(date.getHours() < 12 ? 'AM' : 'PM');
    	}else if(now.getFullYear()-date.getFullYear()==0){
    		returnStr=date.getMonth()+1+"-"+date.getDate();
    	}else{
    		returnStr=date.getFullYear()+"-"+date.getMonth()+1+"-"+date.getDate();
    	}
	    
		return returnStr;
	}
});
//format data filter
app.filter('formatdate',function(){
	return function(strTime,fmt){	
		var date = new Date(strTime);
		var o = {
	        "M+": date.getMonth() + 1, //月份 
	        "d+": date.getDate(), //日 
	        "h+": date.getHours(), //小时 
	        "m+": date.getMinutes(), //分 
	        "s+": date.getSeconds(), //秒 
	        "q+": Math.floor((date.getMonth() + 3) / 3), //季度 
	        "S": date.getMilliseconds() //毫秒 
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
});

//Replace null character wear
app.filter('replaceNull',function(){
	return function(str){
		if(str=='null'){
			return "";
		}else{
			return str;
		}
	}
});


//Determine the type of delivery document
app.filter('deliveryFileUrl',function(){
	return function(str){
		if(str!=null&&str!=undefined){
		    var strArry= new Array();
		    strArry=str.split(".");
		    var arryLength=strArry.length-1;
		    var fileType=strArry[arryLength];
		    if(fileType=='doc'||fileType=='docx'){
		    	return baseUrl+"/images/userCenter/imgWord.png";
		    }else if(fileType=='xls'||fileType=='xlsx'){
		    	return baseUrl+"/images/userCenter/imgExcel.png";
		    }else if(fileType=='pdf'){
		    	return baseUrl+"/images/userCenter/imgPdf.png";
		    }else{
		       return str;
		    }
		}else{
			return "";
		}
	}
});

//Determine the type of delivery document
app.filter('deliveryFileType',function(){
	return function(str){
		if(str!=null&&str!='undefined'){
		    var strArry= new Array();
		    strArry=str.split(".");
		    var arryLength=strArry.length-1;
		    var fileType=strArry[arryLength];
		    
		    if(fileType=='doc'||fileType=='docx'){
		    	return true;
		    }else if(fileType=='xls'||fileType=='xlsx'){
		    	return true;
		    }else if(fileType=='pdf'){
		    	return  true;
		    }else{
		        return false;
		    }
		}else{
			return "";
		}
	}
});

//Determine the type of delivery document
app.filter('deliveryFileBom',function(){
	return function(str){
		if(str!=null||str!=undefined){
		    var strArry= new Array();
		    strArry=str.split(".");
		    var arryLength=strArry.length-1;
		    var fileType=strArry[arryLength];
		    
		    if(fileType=='doc'||fileType=='docx'){
		    	return false;
		    }else if(fileType=='xls'||fileType=='xlsx'){
		    	return false;
		    }else if(fileType=='pdf'){
		    	return  false;
		    }else{
		        return true;
		    }
		}else{
			return "";
		}
	}
});

//decode url string
app.filter('decodeURIComponent', function() {
	return window.decodeURIComponent;
});

//UTF date time string convert to local date time value
app.filter('str2date', function() {
	return function(str){
		var d=new Date(str);
		var utc = d.getTime(); 
		var localOffset = d.getTimezoneOffset() * 60000;
		var localTime=utc- localOffset
		return localTime;
	}
});

//
app.filter('replaceNone',function(){
	return function(str){
		if(str == "none"){
			return '';
		}
		else{
			return str;
		}
		
	}
});

//Mapping code into Chinese
app.filter('code2name',function(){
	return function(code){
		var map={
			'invite_measure':'邀请量房',
			'decline_measure':'消费者拒绝设计师',
			'confirm_measure':'设计师同意量房',
			'decline_invite_measure':'设计师拒绝量房',
			'pay_for_measure':'支付量房费',
			'open_3d_design':'打开3d工具',
			'author_send_contract':'设计师发送合同',
			'deliver_measure_file':'上传量房交付物',
			'pay_for_first_fee':'支付设计首款',
			'open_3d_design':'打开3d工具',
			'pay_for_last_fee':'支付尾款',
			'open_3d_design':'打开3d工具',
			'deliver_design_results':'上传支付交付物',
			'review_design_results':'编辑交付物'
		};
		return map[code];
	}
});

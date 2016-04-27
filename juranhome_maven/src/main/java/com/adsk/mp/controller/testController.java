package com.adsk.mp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.SessionUtil;

@Controller
@RequestMapping(value="/test")
public class testController {
	
	@RequestMapping(value="/index")
	   public String test2(){
		   System.out.println("ddddddd");
		   return "template/index/indexbody";
	}
	 
   @RequestMapping(value="/indexs")
   public  String  test() {
	   System.out.println("ewewee");
	   return "template/index/indexbody";
   }	
   
   @SuppressWarnings({ "rawtypes", "static-access" })
   @RequestMapping(value="/getUser",method=RequestMethod.POST)
   @ResponseBody
   public Map getList(HttpServletRequest request,HttpServletResponse response) throws Exception {
	  
	   String name=request.getParameter("name");
	   Integer sex=Integer.parseInt(request.getParameter("sex"));
	   System.out.println(name+"-----"+sex);
	    
	   /* List<String> list=new ArrayList<String>();
	    list.add("1");
	    list.add("2");
	    list.add("3");*/
	   
	   HTTPApiCURL api=new HTTPApiCURL();
	   String urlString="http://www.runoob.com/try/angularjs/data/Customers_JSON.php";
	   String method="GET";
	   String param="";
	   Map map=api.ApiCURL(request,urlString, method, param);
	   
	   
	   //測試session
	   
	   SessionUtil session=new SessionUtil();
	   //session.createSession(request,"user",jsonString);
	   System.out.println("session "+session.getSession(request,"user"));
	   
	   //測試cookie
	   
//	   CookieUtil cookie=new CookieUtil();
//	   
//	   cookie.addCookie("fangzhigang", "12345678",true, request, response);
//	   
//	    String username = "";
//	    String password = "";
	     
	   /* Cookie[] cookies = request.getCookies();
	    for(Cookie cookieS:cookies){
	        if("username".equals(cookieS.getName())){
	            //解密 //可以自己设定解密规则,见EncryptionCode中的encryptionRules
	            username = new String(EncryptionCoder.decryptBASE64(URLDecoder.decode(cookieS.getValue(),"utf-8")));
	        }
	        if("password".equals(cookieS.getName())){
	            //解密
	            password = new String(EncryptionCoder.decryptBASE64(URLDecoder.decode(cookieS.getValue(),"utf-8")));
	        }
	    }*/
	   
	 //  System.out.println("cookies: username:"+username+" password:"+password);
	    
	  
	   //System.out.println(modelMap.values());
	   
	    return map;
   }
}

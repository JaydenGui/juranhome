/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *+ Remember passwords  Tools 
 *+========================================================+
 *+@Author Fangzhigang
 *+========================================================+
 *+@Date 2015-12-18
 *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.commons;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CookieUtil {
	 private static final int MAXTIME = 60*60*24*7;  //Longest cookie keep a week 
	 
     /**
      * Automatically fill in user name password 
      * @param username String
      * @param password String
      * @param checkbox boolean
      */
	 public  void addCookie(String username,String password,Boolean checkbox,HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
	        String path =request.getContextPath()+"/";
	           
	        //对用户名,密码进行加密
	        try {
	            //可以自己设定加密规则,见EncryptionCode中的encryptionRules
	            username =EncryptionCoder.encryptBASE64(username.getBytes());
	            password = EncryptionCoder.encryptBASE64(password.getBytes());
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	         
	        //创建cookie
	        Cookie usernameCookie = new Cookie("username",URLEncoder.encode(username,"utf-8"));
	        Cookie passwordCookie = new Cookie("password",URLEncoder.encode(password,"utf-8"));
	        Cookie autologinCookie = new Cookie("autoLogin",URLEncoder.encode(checkbox.toString(),"utf-8"));
	        //设置cookie路径
	        usernameCookie.setPath(path);
	        passwordCookie.setPath(path);
	        autologinCookie.setPath(path);
	         
	        if(!checkbox){   
	        	//复选框没有勾上,不保存账号密码
	            usernameCookie.setMaxAge(0);
	            passwordCookie.setMaxAge(0);
	            autologinCookie.setMaxAge(0);
	        }else{                 
	        	//保存账户密码,设置时长
	            usernameCookie.setMaxAge(MAXTIME);
	            passwordCookie.setMaxAge(MAXTIME);
	            autologinCookie.setMaxAge(MAXTIME);
	        }
	         
	        //添加cookie
	        response.addCookie(usernameCookie);
	        response.addCookie(passwordCookie);
	        response.addCookie(autologinCookie);
	    }
	 
	 /**
		 * getMemberCookie
		 * @return
		 */
		public Map<String, Object> getMemberCookie(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException, Exception{
			
			 String username = "";
			 String password = "";
			 String autoLogin="";
			     
			    Cookie[] cookies = request.getCookies();
			    for(Cookie cookieS:cookies){
			        if("username".equals(cookieS.getName())){
			            //解密 //可以自己设定解密规则,见EncryptionCode中的encryptionRules
			            username = new String(EncryptionCoder.decryptBASE64(URLDecoder.decode(cookieS.getValue(),"utf-8")));
			        }
			        if("password".equals(cookieS.getName())){
			            //解密
			            password = new String(EncryptionCoder.decryptBASE64(URLDecoder.decode(cookieS.getValue(),"utf-8")));
			        }
			        if("autoLogin".equals(cookieS.getName())){
			        	autoLogin=new String(URLDecoder.decode(cookieS.getValue(),"utf-8"));
			        }
			    }
			 String[] array = {username,password,autoLogin};
			 Map<String, Object> modelMap = new HashMap<String, Object>();   
		     modelMap.put("data",array);  
		     
			 return modelMap;
		}
		/**
		 * delete cookie
		 */
		public static  void deleteCookie(HttpServletRequest request,HttpServletResponse response){
			 String path =request.getContextPath()+"/";
			Cookie[] cookies = request.getCookies();
			try {
				for (int i = 0; i < cookies.length; i++) {
					//System.out.println(cookies[i].getName() + ":"+ cookies[i].getValue());
					Cookie cookie = new Cookie(cookies[i].getName(), null);
					cookie.setMaxAge(0);
					cookie.setPath(path);//根据你创建cookie的路径进行填写
					response.addCookie(cookie);
				}
			} catch (Exception e) {
				System.out.println("删除Cookies发生异常！");
			}
		}
		
		public  void addCookie(String status,HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
	        String path =request.getContextPath()+"/";
	        //创建cookie
	        Cookie statusCookie = new Cookie("status",status);
	        //设置cookie路径
	        statusCookie.setPath(path);
	        statusCookie.setMaxAge(5);
	        //添加cookie
	        response.addCookie(statusCookie);
	    }
		
		public void deleteCookie(String cookieName){
			Cookie statusCookie = new Cookie("status",null);
			statusCookie.setMaxAge(0);
		}
}

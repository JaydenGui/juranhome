/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * session operation class
 * ========================================================+
 * @author ：Fangzhigang
 * ========================================================+
 * @date ：2015-12-16
 * ++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.commons;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class SessionUtil{
	/**
	 * Create Session
	 * @param sessionName  String
	 * @param sessionValue Object 
	 */
    public void createSession(HttpServletRequest request,String sessionName,Object sessionValue){
    	
       HttpSession	 session=request.getSession(); //Create session object 
       session.setMaxInactiveInterval(300*600);   //Set session expiration time 30 minutes 
       session.setAttribute(sessionName,sessionValue);
    }
    
    /**
     * Get Session
     * @param sesionName  String
     * @return  Object    Object
     */
    public Map getSession(HttpServletRequest request,String sesionName){
    	HttpSession	 session=request.getSession();
    	return   (Map)session.getAttribute(sesionName);
    }
    
    /**
     * Delete Session 
     * @param sessionName  String
     */
    public void delSession(HttpServletRequest request,String sessionName){
    	HttpSession	 session=request.getSession();
    	session.removeAttribute(sessionName);
    }
    
    /**
     * Determine whether the session has expired
     * @param request
     * @param response
     * @return boolean
     */
    public static boolean judgeSession(HttpServletRequest request,HttpServletResponse response){
		SessionUtil session =new SessionUtil();
		Object obj=session.getSession(request, "users");
		if(obj!=null&&obj.equals("")){
			return true;
		}else{
			return false;
		}
	}
  
}

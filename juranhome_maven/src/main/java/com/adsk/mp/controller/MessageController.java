package com.adsk.mp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.GsonUtil;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.SessionUtil;
import com.adsk.mp.commons.SystemUtil;

@Controller
@RequestMapping(value="/message")
public class MessageController {
	
	@SuppressWarnings({"rawtypes","unchecked"})
	@RequestMapping(value="/getSystemMessageList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> getSystemMessageList(HttpServletRequest request,HttpServletResponse response){
		SessionUtil session=new SessionUtil();
		
		Map mapResult=null;
		if(session.getSession(request, "users")!=null){
			String memberId=session.getSession(request, "users").get("id").toString();
			
			int page=Integer.parseInt(request.getParameter("page"));
			int pageSize=Integer.parseInt(request.getParameter("pageSize"));
			String messageType=request.getParameter("messageType");
			mapResult=HTTPApiCURL.getMethed(request,Api.MESSAGE_URL_NEW(memberId, page, pageSize),"GET","");
			
		}
		else
		{
			mapResult=new HashMap<String,Object>();			
		}
		if(mapResult==null)
		{
			mapResult=new HashMap<String,Object>();	
		}
		SystemUtil.sysStr("myCaseList mapResult:", mapResult.toString());
		return mapResult;
	}
	
	@SuppressWarnings({"rawtypes","unchecked", "null"})
	@RequestMapping(value="/deleteSystemMessage",method=RequestMethod.POST)
	@ResponseBody
	public Map deleteSystemMessage(HttpServletRequest request,HttpServletResponse response){
		SessionUtil session=new SessionUtil();
		Map mapResult=null;
		if(session.getSession(request, "users")!=null){
			String memberId=session.getSession(request, "users").get("id").toString();
			
			String ids=request.getParameter("ids");
			
			if(ids!=null && !"".equals(ids))
			{
				mapResult=HTTPApiCURL.DELETE(request, Api.MESSAGE_DELETE_URL(memberId, ids), "DELETE","");	
			}
			
		}
		else
		{
			mapResult=new HashMap<String,Object>();
			
		}
		SystemUtil.sysStr("myCaseList mapResult:", mapResult.toString());
		return mapResult;
	}
}

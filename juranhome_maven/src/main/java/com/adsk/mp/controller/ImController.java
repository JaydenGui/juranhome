package com.adsk.mp.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.AssetsDemo;
import com.adsk.mp.commons.GsonUtil;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.MyFileUpload;
import com.adsk.mp.commons.SessionUtil;

@Controller
@RequestMapping(value="/im")
public class ImController {
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="index")
    public String index(){
    	return "template/im/index";
    }
	
	/**
	 * Get the chat room list
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/roomlist",method=RequestMethod.POST)
	@ResponseBody
	public Map roomlist(HttpServletRequest request){
		
		SessionUtil session=new SessionUtil();
		String  member_id=session.getSession(request, "users").get("id").toString();
		
		int page=Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page =0;
		}
		
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<=0){
			pageSize=Api.PAGESIZE;
		}
		Map map=HTTPApiCURL.getMethed(request,Api.THREADSROOLIST(member_id, page, pageSize));
		map.put("member_id", member_id);
		
		return map;
	}
	
	/**
	 * Get messages for a thread
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/retrieveMessages",method=RequestMethod.POST)
	@ResponseBody
	public Map retrieveMessages(HttpServletRequest request){
		
		SessionUtil session=new SessionUtil();
		String  member_id=session.getSession(request, "users").get("id").toString();
		
		String thread_id=request.getParameter("thread_id");
		int page=Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page =0;
		}
		
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<=0){
			pageSize=Api.PAGESIZE;
		}
		Map map=HTTPApiCURL.getMethed(request,Api.RETRIEVE_MESSAGES(member_id,thread_id, page, pageSize));
		
		return map;
	}
	/**
	 * Mark message as read of a thread
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/putMessage",method=RequestMethod.POST)
	@ResponseBody
	public Map putMessage(HttpServletRequest request){
		
		SessionUtil session=new SessionUtil();
		String  member_id=session.getSession(request, "users").get("id").toString();
		
		String thread_id=request.getParameter("thread_id");
		
		Map map=HTTPApiCURL.putMethed(request,Api.PUT_MESSAGE(member_id,thread_id));
		
		return map;
	}
	/**
	 * Mark a message as read
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/markAMessage",method=RequestMethod.POST)
	@ResponseBody
	public Map markAMessage(HttpServletRequest request){
		
		SessionUtil session=new SessionUtil();
		String  member_id=session.getSession(request, "users").get("id").toString();
		
		String message_id=request.getParameter("message_id");
		
		Map map=HTTPApiCURL.putMethed(request,Api.MARK_A_MESSAGE(member_id,message_id));
		
		return map;
	}
	/**
	 * Send a new message to a member or multiple members. This API can be used to initiate both private messaging and group conversation (CHAT).
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/sendMessage",method=RequestMethod.POST)
	@ResponseBody
	public Map sendMessage(HttpServletRequest request){
		
		SessionUtil session=new SessionUtil();
		String  member_id=session.getSession(request, "users").get("id").toString();
		
		String subject=request.getParameter("subject");
		String body=request.getParameter("body");
		String recipient_ids=request.getParameter("recipient_ids");
		//String command=request.getParameter("command");
		Map<String, String> params=new HashMap<String, String>();
		Map map=HTTPApiCURL.postMethed(request,Api.SEND_MESSAGE(member_id,subject,body,recipient_ids),params);
		
		return map;
	}
	/**
	 * Reply to a private message or a group conversation (CHAT).
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/replyMessage",method=RequestMethod.POST)
	@ResponseBody
	public Map replyMessage(HttpServletRequest request){
		
		SessionUtil session=new SessionUtil();
		String  member_id=session.getSession(request, "users").get("id").toString();
		
		String thread_id=request.getParameter("thread_id");
		String body=request.getParameter("body");
		//String command=request.getParameter("command");
		Map<String, String> params=new HashMap<String, String>();
		Map map=HTTPApiCURL.postMethed(request,Api.REPLY_MESSAGE(member_id,thread_id,body),params);
		System.out.println(Api.REPLY_MESSAGE(member_id,thread_id,body));
		return map;
	}
	/**
	 * get the websocket url address.
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/getWebSocketUrl",method=RequestMethod.POST)
	@ResponseBody
	public Map getWebSocketUrl(HttpServletRequest request){
		
		SessionUtil session=new SessionUtil();
		Map user=session.getSession(request, "users");
		String  member_id=user.get("id").toString();
		String  session_id=user.get("xsession").toString();
		
		String url=Api.RECEIVE_MESSAGE(session_id, member_id);
		System.out.println(url);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("url", url);
		return map;
	}
	/**
	 * Send media in chat conversation
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/upLoadMedia",method=RequestMethod.POST)
	@ResponseBody
	public Map upLoadMedia(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		/*SessionUtil session=new SessionUtil();
		Map user=session.getSession(request, "users");
		String  member_id=user.get("id").toString();
		String thread_id=request.getParameter("thread_id");
		String content_type=request.getParameter("content_type");
		String file=request.getParameter("file");
		
		String server=HTTPApiCURL.getMethed(request,Api.GET_UPLOAD_SERVER()).get("server").toString();
		
		String url=Api.UPLOAD_MEDIA_URL(server,member_id);
		Map<String, String> params=new HashMap<String, String>();
		params.put("thread_id", thread_id);
		params.put("content_type", content_type);
		params.put("file", file);
		
		Map map=HTTPApiCURL.postMethed(request,url,params);
		System.out.println(url);
		return map;*/
		SessionUtil session=new SessionUtil();
		Map user=session.getSession(request, "users");
		String  member_id=user.get("id").toString();
		
		
		MyFileUpload mfu = new MyFileUpload();
		Map map = mfu.process(request, response);
		String thread_id=(String)map.get("thread_id");
		String content_type=(String)map.get("content_type");
		System.out.println("map.Data() : " + map.toString());
		String xsession = session.getSession(request, "users").get("xsession").toString();
		AssetsDemo ast = new AssetsDemo();
		Map resultFile = new HashMap();
		try {
			String file = ast.uploadChatFile(map.get("FilePath1").toString(),Api.UPLOAD_MEDIA_URL(member_id,content_type,thread_id), xsession);
			resultFile = GsonUtil.formJson(file);
			resultFile.put("status",200);
		} catch (Exception e) {
			resultFile = null;
		}
		// System.out.println("getPhotoInfo resultFile :
		// "+resultFile.toString());

		return resultFile;
	}
	
}

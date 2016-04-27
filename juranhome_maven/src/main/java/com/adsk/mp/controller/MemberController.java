/*++++++++++++++++++++++++++++++++++++++++++++
 * Member Center  Controller
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2015-11-27
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.SessionUtil;
import com.adsk.mp.commons.SystemUtil;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	/**
	 * get member info
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/memberInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map getMemberInfo(HttpServletRequest request){
		SessionUtil session=new SessionUtil();
		String member_id=session.getSession(request, "users").get("id").toString();
		SystemUtil.sysStr("getMemberInfo url", Api.MEMBERS(member_id));
		Map map=HTTPApiCURL.getMethed(request, Api.MEMBERS(member_id), "GET", "");
		SystemUtil.sysStr("getMemberInfo map", map.toString());
		return map;
	}
	/**
	 * get member real name authentication info
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/memberRealnameInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map getMemberRealnameInfo(HttpServletRequest request){
		SessionUtil session=new SessionUtil();
		String member_id = null;
		if(session.getSession(request, "users")!=null){
			member_id=session.getSession(request, "users").get("id").toString();
		}
		
		
		String designeid=request.getParameter("designer_id");
		
		
		System.out.println("///////:"+designeid);
		
		if(!designeid.equals("0")){
			member_id=designeid;
		}
		SystemUtil.sysStr("getMemberRealnameInfo url:", Api.MEMBERREALNAME(member_id));
		Map map=HTTPApiCURL.getMethed(request, Api.MEMBERREALNAME(member_id), "GET", "");
		SystemUtil.sysStr("getMemberRealnameInfo map", map.toString());
		return map;
	}

	//According to the members of ID to obtain user information 
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="getMemberIdInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map getMemberIdInfo(HttpServletRequest request){
	    String member_id=request.getParameter("member_id");
	    
	    Map map=HTTPApiCURL.getMethed(request, Api.MEMBERS(member_id), "GET", "");
	    
	    return map;
	}
}

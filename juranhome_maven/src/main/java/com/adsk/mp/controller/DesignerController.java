/*++++++++++++++++++++++++++++++++++++++++++++
 * Designer Controller
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2015-12-03
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.protocol.HttpRequestHandlerRegistry;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.SessionUtil;
import com.adsk.mp.commons.SystemUtil;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value = "/designer")
public class DesignerController {
	
	@SuppressWarnings("unused")
	private Logger logger = Logger.getLogger(this.getClass());
	/**
	 * Return designer page method
	 */
	@RequestMapping("/index")
	public String index() {
		return "template/designer/index";
	}

	/**
	 * Return designer list_black page method
	 */
	@RequestMapping("/body")
	public String body() {
		System.out.println("ooooooo");
		return "template/designer/list_black";
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @return map
	 * get user query condition list
	 */
	@SuppressWarnings({ "rawtypes", "unchecked"})
	@RequestMapping(value = "/getDesignerList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(HttpServletRequest request, HttpServletResponse response) {

		/*String cityName = request.getParameter("cityName");
		String spaceName = request.getParameter("spaceName");
		String costName = request.getParameter("costName");*/
		int page =Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page=1;
		}
		
	
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<0){
			pageSize=Api.PAGESIZE;
		}
		
		System.out.println("/////:"+Api.DESIGNERS(page,pageSize));
		Map map =HTTPApiCURL.getMethed(request,Api.DESIGNERS(page, pageSize),"GET","");
		
		
		System.err.println("+++++++"+map);
		return map;
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @return map
	 * get user query condition designer detail
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getDesignerListDetail", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getDetail(HttpServletRequest request, HttpServletResponse response) {

		SessionUtil session=new SessionUtil();
		String designerId=session.getSession(request, "users").get("id").toString();
		SystemUtil.sysStr("getDesignerDetail URL", Api.DESIGNERDETAIL(designerId));
		Map map=HTTPApiCURL.getMethed(request,Api.DESIGNERDETAIL(designerId),"GET","");
		//Map map=HTTPApiCURL.getMethed(request,"http://192.168.2.143:8081/v1/api/designers/"+designerId+"/home","GET","");
		SystemUtil.sysStr("getDesignerDetail map", map.toString());
		return map;
	}
	
	//Obtain designer information according to the designer
	@SuppressWarnings({"rawtypes" })
	@RequestMapping(value="/designerInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map designerInfo(HttpServletRequest request){
		
		String designer_id=request.getParameter("designer_id");
		String uid=request.getParameter("hs_uid");
		
		System.err.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!:"+uid);
		
       if(designer_id == null ||designer_id.equals("0")||uid==null){
		SessionUtil  session=new SessionUtil();
			designer_id=session.getSession(request, "users").get("id").toString();
			uid="";
		}
		Map mapResult=HTTPApiCURL.getMethed(request,Api.DESIGNERDETAIL(designer_id ),"GET",uid);
		
		System.err.println("+++++++++++++++++++++++++++"+mapResult.toString());
		
		return mapResult;

	}
	
	
	/**
	 * update designer detail
	 * @param request
	 * @return
	 */
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/updateDesignerDetail", method = RequestMethod.POST)
	@ResponseBody
	public Map updateDesignerDetail(HttpServletRequest request){
		SessionUtil session=new SessionUtil();
		String designer_id=session.getSession(request, "users").get("id").toString();
		String style=request.getParameter("style");
		JSONObject json=new JSONObject();
		json.put("introduction", request.getParameter("introduction"));
		json.put("personal_honour", request.getParameter("personal_honour"));
		json.put("experience", request.getParameter("experience"));
		json.put("measurement_price", request.getParameter("measurement_price"));
		json.put("design_price_min", request.getParameter("design_price_min"));
		json.put("design_price_max", request.getParameter("design_price_max"));
		json.put("diy_count", request.getParameter("diy_count"));
		json.put("case_count", request.getParameter("case_count"));
		json.put("theme_pic", request.getParameter("theme_pic"));
		json.put("style_long_names", style);
		SystemUtil.sysStr("updateDesignerDetail url", Api.DESIGNERDETAIL(designer_id));
		SystemUtil.sysStr("updateDesignerDetail json", json.toJSONString());
		
		Map map=HTTPApiCURL.ApiCURL(request,Api.DESIGNERDETAIL(designer_id), "PUT",json.toJSONString());
		SystemUtil.sysStr("updateDesignerDetail map", map.toString());
		return map;
	}
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/getDesignerCaseList")
	@ResponseBody
	public Map getDesignerCaseList(HttpServletRequest request){
		SessionUtil session=new SessionUtil();
		String designer_id=session.getSession(request, "users").get("id").toString();
		int limit;
		int offset;
		
		if(request.getParameter("pageSize") == null){
			
			limit = Api.PAGESIZE;
		}
		else{
			limit=Integer.parseInt(request.getParameter("pageSize").toString() );
		}
	    if(request.getParameter("page") == null){
	    	offset=0;
	    }
	    else{
	    	offset=Integer.parseInt(request.getParameter("page").toString());
	    }
		 String method = "GET";
		 Map map=HTTPApiCURL.getMethed(request,Api.DESIGNER_CASE_LIST(designer_id, limit, offset), method,"");
		 System.out.println("UserController's getDesignerCaseList map : "+map.toString());
		 return map;
	}
	
	
	/**
	 * Theme designer switch 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/skinPeeler",method=RequestMethod.POST)
	@ResponseBody
	public Map skinPeeler(HttpServletRequest request){
		
		SessionUtil session=new SessionUtil();
		String designer_id=session.getSession(request, "users").get("id").toString();
		
		String pic_index=request.getParameter("pic_index");
		
		JsonObject parameter=new JsonObject();
		parameter.addProperty("theme_pic", pic_index);
		Map map=HTTPApiCURL.ApiCURL(request, Api.DESIGNERDETAILPIC(designer_id),"PUT",parameter.toString());
		
		return map;
	}
}

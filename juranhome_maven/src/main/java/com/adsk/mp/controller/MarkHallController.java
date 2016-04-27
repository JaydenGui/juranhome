/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * designer mark hall controller
 * ==========================================================+
 * @author bozhang
 * ==========================================================+
 * @date：2016-1-16 
 * =========================================================*/

package com.adsk.mp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping(value = "/mark")
public class MarkHallController {
	
	@RequestMapping(value = "/index")
	public String index() {
		return "template/markHall/index";
	}
    /**
     * 
     * @return
     */
	@RequestMapping(value="/category")
    public String category(){
    	return "template/markHall/category";
    }	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/caselist/caseid/{id}/designeid/{designeid}")
    public String list(){
    	return "template/markHall/caseDetail";
    }
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/diyDetail")
    public String diyDetail(){
    	return "template/markHall/diyDetail";
    }
	
	@RequestMapping(value="/main")
    public String main(){
    	return "template/markHall/designerMain";
    }
	
	@RequestMapping(value="/main/id/{id}/uid/{uid}")
    public String designermain(){
    	return "template/markHall/designerMain";
    }
	
	@RequestMapping(value="/portfolio")
	public String portfolio(){
		return "template/markHall/portfolio";
	}
	
	/**
	 * designer Case list
	 * @return
	 */
	@RequestMapping(value="/designerCaselist")
	public String designerCaselist(){
		return "template/markHall/caselist";
	}
	
	/**
	 * add Case
	 * @return
	 */
	@RequestMapping(value="/addCase")
	public String addCase(){
		return "template/markHall/addCase";
	}
	/**
	 *  edit case
	 * @return
	 */
	@RequestMapping(value="/addCase/caseid/{caseid}/status/{status}")
	public String editCase(){
		return "template/markHall/addCase";
	}
	
	/**
	 * Edit the designer information
	 * @return
	 */
	@RequestMapping(value="/designeredit")
	public String designeredit(){
		return "template/markHall/designeredit";
	}
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/getDesigneMarkNeeds", method = RequestMethod.POST)
	@ResponseBody
	public Map getDesigneMarkNeeds(HttpServletRequest request, HttpServletResponse response) {
		Map map = null;
		int page =Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page=1;
		}
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<0){
			pageSize=Api.PAGESIZE;
		}
		SystemUtil.sysStr("getDesigneMarkNeeds",Api.NEEDDATILE(null,page,pageSize));
		map = HTTPApiCURL.getMethed(request,Api.NEEDDATILE(null,page,pageSize), "GET","");
		SystemUtil.sysStr("map", map.toString());
		return map;
	}
	/**
	 * designer mark
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/designeMark", method = RequestMethod.POST)
	@ResponseBody
	public Map DesigneMark(HttpServletRequest request, HttpServletResponse response) {
		Map map = null;
		JsonObject json=new JsonObject();
		SessionUtil session=new SessionUtil();
		String need_id=request.getParameter("needs_id");
		String markDeckaration=request.getParameter("markDeckaration");
		if(markDeckaration.trim().length()>0){
			json.addProperty("declaration", markDeckaration);
		}else{
			json.addProperty("declaration", "");
		}
		SystemUtil.sysStr("markDeckaration", markDeckaration);
		String designer_id=session.getSession(request, "users").get("id").toString();
		SystemUtil.sysStr("DesigneMark", Api.DESIGNERNEEDS(need_id,designer_id));
		map = HTTPApiCURL.ApiCURL(request,Api.DESIGNERNEEDS(need_id,designer_id), "POST", json.toString());
		SystemUtil.sysStr("map", map.toString());
		return map;
	}
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/searchNeeds", method = RequestMethod.POST)
	@ResponseBody
	public Map searchNeeds(HttpServletRequest request){
		System.out.println("---------------searchNeeds--------------");
		
		Integer page=Integer.parseInt(request.getParameter("page"));
		if(page<0){
			page=1;
		}
		
		Integer pageSize=Integer.parseInt(request.getParameter("pageSize"));
		if(pageSize<0){
		    pageSize=12;
	    }
		String custom_string_form = "";
		String custom_string_style = "";
		String custom_string_area = "";
		if(request.getParameter("layouts") != null && !request.getParameter("layouts").equals("")){
			custom_string_form += "&custom_string_form="+request.getParameter("layouts");
		}
		if(request.getParameter("styles") != null && !request.getParameter("styles").equals("")){
			custom_string_style += "&custom_string_style="+request.getParameter("styles");
		}
		if(request.getParameter("spaces") != null && !request.getParameter("spaces").equals("")){
			custom_string_area += "&custom_string_area="+request.getParameter("spaces");
		}
		System.out.println("request.getParameter ====>"+custom_string_form+" , "+custom_string_style+" , "+custom_string_area);
		Map result = HTTPApiCURL.getMethed(request,Api.SEARCHNEEDS(page, pageSize)+custom_string_form+custom_string_style+custom_string_area,"GET","");
		System.out.println("searchNeeds result : "+result.toString());
		return result;
	}
}

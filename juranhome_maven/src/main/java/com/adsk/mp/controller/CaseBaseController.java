/*++++++++++++++++++++++++++++++++++++++++++++
 * Case Base  Controller
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2015-11-27
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.AssetsDemo;
import com.adsk.mp.commons.GsonUtil;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.SessionUtil;
import com.adsk.mp.commons.SystemUtil;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value="/caseBase")
public class CaseBaseController {
	/**
	 *Return to the case library 
	 */
	@RequestMapping(value="/index")
    public String index(){
    	return "template/casebase/index";
    }
	/**
	 * Returns the contents of the case library 
	 */
	@RequestMapping("/body")
	public String body(){
		return "template/casebase/case_list";
	}
	
	@RequestMapping(value = "/footer")
	public String footer() {
		return "template/footer/aboutus";
	}
	/**
	 * Release requirements 
	 * @return
	 */
	@RequestMapping(value="addCase")
	public String  careatCase(){
		return "template/casebase/addCase";
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/casedetail/caseid/{caseid}/uid/{uid}")
	public String casedetail(){
		return "template/casebase/caseDetails";
	}
	/**
	 * 
	 */
	@RequestMapping(value="/index/keyWord/{keyWord}")
    public String indexSearch(){
    	return "template/casebase/index";
    }
	
	/**
	 * Case library data list 
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/getCaseList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getList(HttpServletRequest request,HttpServletResponse response){
		
	   Integer page=Integer.parseInt(request.getParameter("page"));
	   if(page<0){
		   page=1;
	   }
	   Integer pageSize=Integer.parseInt(request.getParameter("pageSize"));
	   if(pageSize<0){
		   pageSize=Api.PAGESIZE;
	   }
	   /*Integer color=Integer.parseInt(request.getParameter("colors")); 
	   Integer space=Integer.parseInt(request.getParameter("spaces"));
	   Integer layout=Integer.parseInt(request.getParameter("layouts"));
	   Integer style=Integer.parseInt(request.getParameter("styles"));*/
	   System.out.println(Api.CASELIST(page, pageSize));
	   Map map=HTTPApiCURL.getMethed(request, Api.CASELIST(page, pageSize),"GET","");
	   System.out.println("getList map"+map.toString());
	   return map;
	}
	
	/**
	 * Obtain details of ID based on case library 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/getCaseListDetail",method=RequestMethod.POST)
	@ResponseBody
    public Map getCaseListDetail(HttpServletRequest request){
    	String case_id=request.getParameter("case_id");
    	Map mapResult=HTTPApiCURL.getMethed(request,Api.DELETECASE(case_id,""), "GET","");
    	
    	return mapResult;
    }
	
	/**
	 * Add case library 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/createCase",method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("rawtypes")
	public Map createCase(HttpServletRequest request){
		
		String caseName=request.getParameter("caseName");
		String province=request.getParameter("province");
		String city=request.getParameter("city");
		String district=request.getParameter("district");
		String room=request.getParameter("room");
		String hall=request.getParameter("hall");
		String wei=request.getParameter("wei");
		String area=request.getParameter("area");
		String style=request.getParameter("style");
		String price=request.getParameter("price");
		String color=request.getParameter("color");
		String  designConcept=request.getParameter("designConcept");
		
		
		JsonObject param=new JsonObject();
		param.addProperty("caseName",caseName);
		param.addProperty("province",province);
		param.addProperty("city",city);
		param.addProperty("district",district);
		param.addProperty("room",room);
		param.addProperty("hall",hall);
		param.addProperty("wei",wei);
		param.addProperty("area",area);
		param.addProperty("style",style);
		param.addProperty("price",price);
		param.addProperty("color",color);
		param.addProperty("designConcept",designConcept);
		
		SessionUtil session=new SessionUtil();
		String   designer_id=session.getSession(request, "users").get("id").toString();
		
		Map mapResult=HTTPApiCURL.ApiCURL(request, "","PSOT", param.toString());
		return mapResult;
	}
	
	/**
	 * edit case library 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/editCase",method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("rawtypes")
	public Map editCase(HttpServletRequest request){
		
		String caseName=request.getParameter("caseName");
		String province=request.getParameter("province");
		String city=request.getParameter("city");
		String district=request.getParameter("district");
		String room=request.getParameter("room");
		String hall=request.getParameter("hall");
		String wei=request.getParameter("wei");
		String area=request.getParameter("area");
		String style=request.getParameter("style");
		String price=request.getParameter("price");
		String color=request.getParameter("color");
		String  designConcept=request.getParameter("designConcept");
		
		
		JsonObject param=new JsonObject();
		param.addProperty("caseName",caseName);
		param.addProperty("province",province);
		param.addProperty("city",city);
		param.addProperty("district",district);
		param.addProperty("room",room);
		param.addProperty("hall",hall);
		param.addProperty("wei",wei);
		param.addProperty("area",area);
		param.addProperty("style",style);
		param.addProperty("price",price);
		param.addProperty("color",color);
		param.addProperty("designConcept",designConcept);
		
		SessionUtil session=new SessionUtil();
		String   designer_id=session.getSession(request, "users").get("id").toString();
		
		Map mapResult=HTTPApiCURL.ApiCURL(request, "","PSOT", param.toString());
		return mapResult;
	}
	
	/**
	 * Delete my case library 
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteCase",method=RequestMethod.POST)
	@SuppressWarnings("rawtypes")
	public Map deleteCase(HttpServletRequest request){
		
		String case_id=request.getParameter("case_id");
		SessionUtil session=new SessionUtil();
		String   designer_id=session.getSession(request, "users").get("id").toString();
		
		Map mapResult=HTTPApiCURL.DELETE(request,"", "","");
		return mapResult;
	}
	
	/**
	 * Get your own case library list 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/myCaseList",method=RequestMethod.POST)
	@ResponseBody
	public  Map myCaseList(HttpServletRequest request){
		
		
		Integer page=Integer.parseInt(request.getParameter("page"));
		if(page<0){
			page=1;
		}
		
		Integer pageSize=Integer.parseInt(request.getParameter("pageSize"));
		if(pageSize<0){
		    pageSize=Api.PAGESIZE;
	    }

		Map mapResult;
		String  designer_id;
		if(Integer.parseInt(request.getParameter("designe_id"))==0){
			SessionUtil session=new SessionUtil();
			designer_id=session.getSession(request, "users").get("id").toString();
		}else{
			designer_id=request.getParameter("designe_id").toString();
		}
		SystemUtil.sysStr("myCaseList else url:", Api.DESIGNERADDIDCASE(page, pageSize, designer_id));
		mapResult=HTTPApiCURL.getNoReferenceMethed(request,Api.DESIGNERADDIDCASE(page, pageSize, designer_id));
		SystemUtil.sysStr("myCaseList mapResult:", mapResult.toString());
		return mapResult;
	}
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/searchCase",method=RequestMethod.POST)
	@ResponseBody
	public Map searchCase(HttpServletRequest request){
		System.out.println("---------------searchCase--------------");
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
		String custom_string_keywords = "";
		if(request.getParameter("layouts") != null && !request.getParameter("layouts").equals("")){
			custom_string_form += "&custom_string_form="+request.getParameter("layouts");
		}
		if(request.getParameter("styles") != null && !request.getParameter("styles").equals("")){
			custom_string_style += "&custom_string_style="+request.getParameter("styles");
		}
		if(request.getParameter("spaces") != null && !request.getParameter("spaces").equals("")){
			custom_string_area += "&custom_string_area="+request.getParameter("spaces");
		}
		if(request.getParameter("keyWord") != null && !request.getParameter("keyWord").equals("")){
			custom_string_keywords += "&custom_string_keywords="+request.getParameter("keyWord");
		}
		System.out.println("request.getParameter ====>"+custom_string_form+" , "+custom_string_style+" , "+custom_string_area+" , "+custom_string_keywords);
		Map result = HTTPApiCURL.getMethed(request,Api.SEARCHCASE(page, pageSize)+custom_string_form+custom_string_style+custom_string_area+custom_string_keywords,"GET","");
		System.out.println("searchCase result : "+result.toString());
		return result;
	}
	/**
	 * Get your own case library list
	 * not give header X-Token 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/myCaseList2",method=RequestMethod.POST)
	@ResponseBody
	public Map myCaseList2(HttpServletRequest request) throws ClientProtocolException, IOException{
		Integer page=Integer.parseInt(request.getParameter("page"));
		if(page<0){
			page=1;
		}
		
		Integer pageSize=Integer.parseInt(request.getParameter("pageSize"));
		if(pageSize<0){
		    pageSize=Api.PAGESIZE;
	    }
		AssetsDemo ast = new AssetsDemo();
		String apiResult = "";
		String   designer_id=request.getParameter("designe_id");
		String url = Api.DESIGNERADDIDCASE(page, pageSize, designer_id);
		Request req = Request.Get(url);
		Response result = ast.RequestHttpExecute(req);
		apiResult = ast.HandleHttpResponse("result", result);
		System.out.println("apiResult ===> "+apiResult);
		Map resultMap = GsonUtil.formJson(apiResult);
		System.out.println("myCaseList2 resultMap ===> "+resultMap.toString());
		return resultMap;
	}
	
}

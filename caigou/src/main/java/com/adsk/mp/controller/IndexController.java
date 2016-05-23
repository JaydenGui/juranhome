/*++++++++++++++++++++++++++++++++++++++++++++
 * index Controller
 * ============================================
 * @author zhigang.fang
 * ============================================
 * @date 2016-05-10 13:48
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.adsk.mp.commons.HTTPApiCURL;
import com.google.gson.JsonObject;

@Controller
public class IndexController{
	
   @SuppressWarnings({"rawtypes" })
@RequestMapping("/")
   public String index(HttpServletRequest request) {
	   
	  // Map map=HTTPApiCURL.getRequestMethed(request,"http://192.168.2.222:6091/design-app/v1/api/cases/search?limit=12&offset=0&sort_by=date&sort_order=desc&taxonomy_id=01");
	   
	   JsonObject p=new JsonObject();
	   p.addProperty("theme_pic","1");
       
	   
	   Map<String,String> mapp=new HashMap<String,String>();
	   
	   mapp.put("theme_pic","1");
	   
	   Map map=HTTPApiCURL.postRequestMethed(request,"http://192.168.2.222:6091/member-app/v1/api/designers/20735639/theme",mapp);
	   
	   System.err.println(map);
	   
	  return "/index/index";
   }
}

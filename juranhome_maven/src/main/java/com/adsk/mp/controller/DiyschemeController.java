/*++++++++++++++++++++++++++++++++++++++++++++
 *Biyscheme   Controller
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2015-11-27
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.AssetsDemo;
import com.adsk.mp.commons.CookieUtil;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.MyFileUpload;
import com.adsk.mp.commons.SessionUtil;
import com.adsk.mp.commons.StrUtils;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value="/3Dscheme")
public class DiyschemeController {
	
	/**
	 * Back to my 3D page
	 * @return
	 */
	@RequestMapping(value="/my3DScheme")
    public String index(){
    	return "template/userCenter/my3DScheme";
    }
	
	/**
	 * Open the 3D tools 
	 * @return
	 */
	@RequestMapping(value="/create3D")
	 public String create3D(){
	     return "template/3DScheme/index";
	 }
	
	/**
	 * Share the 3D Scheme 
	 * @return
	 */
	@RequestMapping(value="/Share/provider/{provider}/hs_design_id/{hs_design_id}")
	 public String share3D(){
		System.out.println("--------------------------------------------- 3D Share ----------------------------------------------------");
	     return "template/3DScheme/ShareScheme";
	 }
     
	@RequestMapping(value="/open3D/acs_asset_id/{acs_asset_id}/acs_project_id/{acs_project_id}/")
	public String open3D(){
		return "template/3DScheme/index";
	}
	
	
	@RequestMapping(value="/creates3D/acs_project_id/{acs_project_id}/")
	public String creates3D(){
		return "template/3DScheme/index";
	}
	
	@RequestMapping(value="/open3Dscheme/hs_design_id/{hs_design_id}/acs_asset_id/{acs_asset_id}/acs_project_id/{acs_project_id}/")
	public String open3Dscheme(){
		return "template/3DScheme/index";
	}
	/**
	 * 3DschemeShare
	 * @return
	 */
	@RequestMapping(value="/open3Dscheme/hs_design_id/{hs_design_id}")
	public String open3DschemeShare(){
		return "template/3DScheme/index";
	}
	/**
	 * return 3Dscheme  detail
	 * @return
	 */
	@RequestMapping(value="/my3DschemeDetail/needsid/{id}/assetid/{assetid}")
	   public String myHomeStylerDetail(){
		   return "template/userCenter/my3DDetail";
	 }
	/**
	 * Get a list of 3D programs 
	 * @param request
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@ResponseBody
	@RequestMapping(value="/getSchemeList",method=RequestMethod.POST)
	public Map getDiyList(HttpServletRequest request){
		
		int page=Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page=0;
		}
		
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<0){
			pageSize=Api.PAGESIZE;
		}
		
		SessionUtil session=new SessionUtil();
		String   designer_id=session.getSession(request, "users").get("id").toString();
		String status=request.getParameter("status");
		
		/**
		 * Status is equal to bound for the design is bound 
		 * Status is equal to unbound for the design of unbound 
		 */
		String urlStr;
		if(status.equals("bound")){
			urlStr=Api.BOUND3DSCHEME(page, pageSize, designer_id);
		}else{
			urlStr=Api.UNBOUND3DSCHEME(page, pageSize, designer_id);
		}
		
		Map mapResult=HTTPApiCURL.getMethed(request,urlStr,"GET","");
		mapResult.put("type", status);
		
		return mapResult;
	}
	
	
	/**
	 * Consumers back to their 3D
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/mySchemelist",method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("rawtypes")
	public Map mySchemelist(HttpServletRequest request){
		
		SessionUtil session=new SessionUtil();
		String   member_id=session.getSession(request, "users").get("id").toString();
		
		int page=Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page=0;
		}
		
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<0){
			pageSize=Api.PAGESIZE;
		}
		
		Map mapResult=HTTPApiCURL.getMethed(request,Api.MEMBER3D(member_id, page, pageSize), "GET","");
		
		return mapResult;
	}

    /**
     * According to the requirements of ID acquisition design
     * @param request
     * @return
     */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/schemeDetaillist")
	@ResponseBody
	public Map schemeDetaillist(HttpServletRequest request){
		
		String needs_id=request.getParameter("needs_id");
		SessionUtil session=new SessionUtil();
		String   designer_id=session.getSession(request, "users").get("id").toString();
		
		Map mapResult=HTTPApiCURL.getMethed(request,"","GET","");
		return mapResult;
	}
	
	/**
	 * Enter the HS from the 3D design tool design
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@ResponseBody
	@RequestMapping(value="/get3DAssetid",method=RequestMethod.POST)
	public Map get3DAssetid(HttpServletRequest request){
		
		String needs_id=request.getParameter("needs_id");
		SessionUtil session=new SessionUtil();
		String   designer_id=session.getSession(request, "users").get("id").toString();
		
		
		JsonObject parameter=new JsonObject();
		parameter.addProperty("needs_id",needs_id);
		parameter.addProperty("designer_id",designer_id);
		
		Map mapResult=HTTPApiCURL.ApiCURL(request,Api.GETASSETID(needs_id, designer_id),"POST","");
		
		System.err.println("================="+mapResult.toString());
		return mapResult;
	}
	
	/**
	 * Upload files to 3D Asset
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/uploadFile3DAsset",method=RequestMethod.POST)
	public String  uploadFile3DAsset(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		
		CookieUtil cookieUtil=new CookieUtil();
		cookieUtil.deleteCookie("status");
		
		SessionUtil session=new SessionUtil();
		String   designer_id=session.getSession(request, "users").get("id").toString();
		
		
		
		MyFileUpload mfu = new MyFileUpload();
		Map<String ,Object> maps = mfu.processMulti(request, response);
	    
		
		String needs_id=((List<String>)maps.get("needs_id")).get(0);
		String asset_id=((List<String>)maps.get("asset_id")).get(0);
		
		String xsession = session.getSession(request, "users").get("xsession").toString();
		AssetsDemo ast = new AssetsDemo();
		JsonArray jArray = new JsonArray();
		
		System.err.println("+++++++++++++++++++++++++++++"+maps.toString());
		String designpageUploadList = maps.get("bp_list") != null ? maps.get("bp_list").toString() : "";
		String designstuffUploadList = maps.get("bom_list") != null ? maps.get("bom_list").toString() : "";

		System.err.println("designpageUploadList -----------------------------------------------------> "+designpageUploadList);
		System.err.println("designstuffUploadList ----------------------------------------------------> "+designstuffUploadList);
		try {
			
			List<String> designstuff = (List<String>) maps.get("designstuff");
			List<String> designpage = (List<String>) maps.get("designpage");
			
			
			System.err.println("*******designpage**********"+designpage.toString());
			System.err.println("********designstuff*********"+designstuff.toString());
			
			if(designstuff.size()>0 && !designstuff.toString().equals("[null]")){
				System.out.println("designstuff.size() ==============> "+designstuff.size());
				for(int i=0;i<designstuff.size();i++){
					System.out.println("designstuff.get(i) =============================> "+designstuff.get(i));
					String FileName = designstuff.get(i).indexOf("\\") > -1 ? designstuff.get(i).substring(designstuff.get(i).lastIndexOf("\\") + 1) : designstuff.get(i).substring(designstuff.get(i).lastIndexOf("/") + 1);
					System.out.println("designstuff Upload File ==============================================================> " + FileName);
					
					if(designstuffUploadList.indexOf("," + FileName + ",") > -1){
						System.out.println("Uploading ==============================================================> " + designstuff.get(i));
						String file = ast.uploadFile(designstuff.get(i), xsession);
						
						Map splitMap = StrUtils.fileUploadSplit(file);
						Map gMap = MyFileUpload.AssetFileUploadResponse(file);
						
						String uploadFileID = splitMap.get("file_id").toString();
						String uploadFileName = splitMap.get("file_name").toString();
					
						JsonObject jsonObject=new JsonObject();
						
		        		//file_ids+=splitMap.get("file_id").toString()+",";	
		        		
		        		
						jsonObject.addProperty("id", uploadFileID);
						jsonObject.addProperty("name", uploadFileName);
						jsonObject.addProperty("source","1");
						jsonObject.addProperty("extended_data","files");	
						
						jsonObject.addProperty("type",2);
						jsonObject.addProperty("status", "0");
						
						jsonObject.addProperty("link",gMap.get("public_url").toString());
						
						jArray.add(jsonObject);
					}
				}
			}
			else{
				System.out.println("WHY designstuff ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			}
			
			if(designpage.size()>0 && !designpage.toString().equals("[null]")){
				System.out.println("designpage.size() ==============> "+designpage.size());
				for(int i=0;i<designpage.size();i++){
					String FileName = designpage.get(i).indexOf("\\") > -1 ? designpage.get(i).substring(designpage.get(i).lastIndexOf("\\") + 1) : designpage.get(i).substring(designpage.get(i).lastIndexOf("/") + 1);
					System.out.println("designpage Upload File ==============================================================> " + FileName);
					
					if(designpageUploadList.indexOf("," + FileName + ",") > -1){
						System.out.println("Uploading ==============================================================> " + designpage.get(i));
						String file = ast.uploadFile(designpage.get(i), xsession);
						
						Map splitMap = StrUtils.fileUploadSplit(file);
						Map gMap = MyFileUpload.AssetFileUploadResponse(file);
						
						String uploadFileID = splitMap.get("file_id").toString();
						String uploadFileName = splitMap.get("file_name").toString();
					
						JsonObject jsonObject=new JsonObject();
						
		        		//file_ids+=splitMap.get("file_id").toString()+",";	
		        		
						jsonObject.addProperty("id", splitMap.get("file_id").toString());
						jsonObject.addProperty("name", splitMap.get("file_name").toString());
						jsonObject.addProperty("source","1");
						jsonObject.addProperty("extended_data","files");	
						
						jsonObject.addProperty("type",3);
						jsonObject.addProperty("status", "0");
						
						jsonObject.addProperty("link",gMap.get("public_url").toString());
						
						jArray.add(jsonObject);
					}
				}
			}
			else{
				System.out.println("WHY designpage ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			}
		
		} catch (Exception e) {
			
		}
		
		JSONObject jsonFiles = new JSONObject();
		jsonFiles.put("design_file",jArray);
			
		System.err.println("--------------------------"+jArray.toString());
		Map mapResult=HTTPApiCURL.ApiCURL(request,Api.UPLOADFILESTOASSET(asset_id,designer_id),"POST",jsonFiles.toString());
		
		cookieUtil.addCookie(mapResult.get("status").toString(), request, response);
		return "redirect:/3Dscheme/my3DschemeDetail/needsid/"+needs_id+"/assetid/"+asset_id;
	} 
	
	/**
	 * Get the 3D Asset file list
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/get3DAssetFile")
	@ResponseBody
	public Map get3DAssetFile(HttpServletRequest request){
		String needs_id=request.getParameter("needs_id");
		String asset_id=request.getParameter("asset_id");
		SessionUtil session=new SessionUtil();
		String   designer_id=session.getSession(request, "users").get("id").toString();
		
		Map map=HTTPApiCURL.getMethed(request,Api.GET3DASSETLIST(asset_id, designer_id, needs_id),"GET","");
		return map;
	}
	
	/**
	 * Upload delivery
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/designDelivery")
	@ResponseBody
	@SuppressWarnings("rawtypes")
	public Map designDelivery(HttpServletRequest request){
		String  fell_ids=request.getParameter("fell_ids");
		String type=request.getParameter("type");
		
		String needs_id=request.getParameter("needs_id");
	    String asset_id=request.getParameter("asset_id");
	    
	    //String hs_designer_id=request.getParameter("hs_designer_id");
	    SessionUtil session=new SessionUtil();
	    
	    String designer_id=session.getSession(request,"users").get("id").toString();
	    
	    fell_ids+=asset_id;
	    
	    System.err.println("------------------------------:"+Api.ASSETPROJECTANDBINDING(asset_id, needs_id, designer_id,fell_ids, type));
	    
	    Map map=HTTPApiCURL.ApiCURL(request,Api.ASSETPROJECTANDBINDING(asset_id, needs_id, designer_id,fell_ids, type),"POST","");
		
		System.err.println("==================================:"+map.toString());
		return map;
	}
	/**
	 * View delivery 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@ResponseBody
	@RequestMapping(value="/viewDelivery")
	public Map viewhsDelivery(HttpServletRequest request){
		String needs_id=request.getParameter("needs_id");
		String designer_id =request.getParameter("designer_id");
		
		if(designer_id==null||designer_id.length()<=0){
			SessionUtil session=new SessionUtil();
		    designer_id=session.getSession(request,"users").get("id").toString();
		}
	  Map map=HTTPApiCURL.getMethed(request,Api.VIEWDELIVERY(needs_id, designer_id),"GET","");
	  
	  return map;
	}
	
	/**
	 * Get a list of files for the 3D program
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/getHsPrints",method=RequestMethod.POST)
	@ResponseBody
	public Map getHsPrints(HttpServletRequest request){
		String asset_id=request.getParameter("asset_id");
		String needs_id=request.getParameter("needs_id");
		Map map=HTTPApiCURL.getMethed(request, Api.GETHSPRINTS(asset_id,needs_id),"GET","");
		return map;
	}
	
	/**
	 * Visitors get the designer's wild program
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getDesigner3dsheme",method=RequestMethod.POST)
	@ResponseBody
	@SuppressWarnings("rawtypes")
	public Map getDesigner3dsheme(HttpServletRequest request){
		
		String designer_id =request.getParameter("designer_id");
		if(designer_id==null||designer_id.length()<=0){
			SessionUtil session=new SessionUtil();
		    designer_id=session.getSession(request,"users").get("id").toString();
		}
		
		int page=Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page=0;
		}
		
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<0){
			pageSize=Api.PAGESIZE;
		}

		Map map=HTTPApiCURL.getNoReferenceMethed(request,Api.MEMBERSELECT3DSHEME(page, pageSize, designer_id));
		
		return map;
	}
}

/*+++++++++++++++++++++++++++++++++++++++++++++
 * Register/Sign in  Controller
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2015-11-27
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.io.FilenameUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.AssetsDemo;
import com.adsk.mp.commons.GsonUtil;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.MyFileUpload;
import com.adsk.mp.commons.PropUtil;
import com.adsk.mp.commons.SessionUtil;
import com.adsk.mp.commons.StrUtils;
import com.adsk.mp.commons.SystemUtil;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
@RequestMapping(value = "/user")
public class UserController {

	private Logger logger = Logger.getLogger(getClass());

	@RequestMapping(value = "/index")
	/**
	 * return to user center
	 * 
	 * @return to user center
	 */
	public String index() {
		return "template/userCenter/index";
	}

	/**
	 * return to Personal Center
	 * 
	 * @return
	 */
	@RequestMapping(value = "/pCenter")
	public String personalCenter() {
		return "template/userCenter/pcenter";
	}

	/**
	 * security_center
	 * 
	 * @return
	 */
	@RequestMapping(value = "security_center")
	public String security_center() {
		return "template/userCenter/security_center";
	}

	/**
	 * Message center
	 * 
	 * @return
	 */
	@RequestMapping(value = "message")
	public String message() {
		return "template/userCenter/message";
	}

	/**
	 * customer service
	 * 
	 * @return
	 */
	@RequestMapping(value = "complain")
	public String complain() {
		return "template/userCenter/complain";
	}

	/**
	 * Return to diy page
	 * 
	 * @return
	 */
	@RequestMapping(value = "mydiy")
	public String mydiv() {
		return "template/userCenter/mydiy";
	}

	/**
	 * Return to the designer page
	 * 
	 * @return
	 */
	@RequestMapping(value = "/designer")
	public String designer() {
		return "template/userCenter/attentionDesigner";

	}

	/**
	 * Return to mass gallery page
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mapdepot")
	public String mapdepot() {
		return "template/userCenter/mapdepot";
	}

	/* My massive gallery */
	@RequestMapping(value = "/gallery")
	public String gallery() {
		return "template/userCenter/gallery";
	}

	/**
	 * Return to the DIY page
	 * 
	 * @return
	 */
	@RequestMapping(value = "/diyProject")
	public String diyProject() {
		return "template/userCenter/diyProject";
	}

	/**
	 * user profile
	 * 
	 * @return
	 */
	@RequestMapping(value = "/personalinformation")
	public String userprofile() {
		return "template/userCenter/personalinformation";
	}

	/**
	 * designer mypage
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mypage")
	public String mypage() {
		return "template/userCenter/mypage";
	}

	/**
	 * designer mymoney
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mymoney")
	public String mymoney() {
		return "template/userCenter/mymoney";
	}

	/**
	 * designer drawcash
	 * 
	 * @return
	 */
	@RequestMapping(value = "/drawcash")
	public String drawcash() {
		return "template/userCenter/drawcash";
	}

	/**
	 * designer surepayment
	 * 
	 * @return
	 */
	@RequestMapping(value = "/surepayment")
	public String surepayment() {
		return "template/userCenter/surepayment";
	}

	/**
	 * designer withdrawalrecord
	 * 
	 * @return
	 */
	@RequestMapping(value = "/withdrawalrecord")
	public String withdrawalrecord() {
		return "template/userCenter/withdrawalrecord";
	}

	/**
	 * return real-name-authentication
	 * 
	 * @return
	 */
	@RequestMapping(value = "/authentication")
	public String authentication() {
		return "template/userCenter/authentication";
	}

	/**
	 * @param request,
	 *            this method can get member message
	 * @return map
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getMemberMessage", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMemberMsg(HttpServletRequest request) {
		logger.debug("*** into UserController's getMemberMessage method ***");
		System.out.println("*** into MeberController's getMemberMessage method ***");

		String method = "GET";
		SessionUtil session = new SessionUtil();
		Map map=null;
		if(session.getSession(request, "users")!=null)
		{
			String id = session.getSession(request, "users").get("id").toString();
			map = HTTPApiCURL.getMethed(request, Api.MEMBERS(id), method, "");
		}
		else
		{
			map=new HashMap<String,Object>();
		}
		System.out.println("getMemberMsg result : " + map.toString());
		return map;
	}

	/**
	 * @param request,
	 *            this method can editor member message
	 * @return map
	 * @throws IOException
	 * @throws ServletException
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/editMemberMessage", method = RequestMethod.POST)
	@ResponseBody
	public Map editMemberMsg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger.debug("*** into UserController's editMemberMessage method ***");
		JsonObject json = new JsonObject();
		SessionUtil session = new SessionUtil();
		String member_id = session.getSession(request, "users").get("id").toString();
		String yyyy = request.getParameter("yyyy");
		String mm = "";
		System.out.println("月 : "+request.getParameter("mm")+"日 :"+request.getParameter("dd"));
		
		if(request.getParameter("mm") == null){
			mm = null;
		}
		else if(Integer.parseInt(request.getParameter("mm").toString()) < 10) {
			mm = "0" + request.getParameter("mm");
		} else {
			mm = request.getParameter("mm");
		}
		String dd = "";
		if(request.getParameter("dd") == null){
			dd = null;
		}
		else if(Integer.parseInt(request.getParameter("dd").toString()) < 10) {
			dd = "0" + request.getParameter("dd");
		} else {
			dd = request.getParameter("dd");
		}
		json.addProperty("user_name", request.getParameter("hitachi_account"));
		json.addProperty("member_id", member_id);
		json.addProperty("email", request.getParameter("email"));
		json.addProperty("gender", Integer.valueOf(request.getParameter("gender")));
		json.addProperty("province", request.getParameter("province"));
		json.addProperty("city", request.getParameter("city"));
		json.addProperty("district", request.getParameter("district"));
		json.addProperty("province_name", request.getParameter("province_name"));
		json.addProperty("city_name", request.getParameter("city_name"));
		json.addProperty("district_name", request.getParameter("district_name"));
		json.addProperty("nick_name", request.getParameter("nick_name"));
		json.addProperty("mobile_number", request.getParameter("mobile_number"));
		json.addProperty("home_phone", request.getParameter("home_phone"));
		json.addProperty("birthday", yyyy + "-" + mm + "-" + dd);
		json.addProperty("zip_code", request.getParameter("zip_code"));
		logger.debug("editor data : " + json.toString());
		String method = "PUT";
		System.out.println("editMemberMsg json  :" + json.toString());
		Map m = HTTPApiCURL.ApiCURL(request, Api.MEMBERS(member_id), method, json.toString());
		System.out.println("return map.toString : " + m.toString());
		return m;
	}

	/**
	 * @param request,
	 *            this method can publish user's demand
	 * @return map
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/publishDemand", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> publishDemand(HttpServletRequest request) throws Exception {
		logger.debug("*** into UserController's publishDemand method ***");
		JsonObject json = new JsonObject();
		json.addProperty("contacts_name", request.getParameter("contactsname"));
		json.addProperty("house_type", request.getParameter("housetype"));
		json.addProperty("contacts_mobile", request.getParameter("contactsmobile"));
		json.addProperty("house_area", request.getParameter("housearea"));
		json.addProperty("decoration_budget", request.getParameter("decoration_budget"));
		json.addProperty("decoration_style", request.getParameter("decoration_style"));
		json.addProperty("province", request.getParameter("provincename"));
		json.addProperty("city", request.getParameter("cityname"));
		json.addProperty("district", request.getParameter("districtname"));
		json.addProperty("province_name", request.getParameter("province_name"));
		json.addProperty("city_name", request.getParameter("city_name"));
		json.addProperty("district_name", request.getParameter("district_name"));
		json.addProperty("community_name", request.getParameter("community_name"));
		json.addProperty("room", request.getParameter("room"));
		json.addProperty("living_room", request.getParameter("livingroom"));
		json.addProperty("toilet", request.getParameter("toilet"));
		json.addProperty("design_budget", request.getParameter("design_budget"));
		json.addProperty("contacts_mobile", request.getParameter("contactsmobile"));
		json.addProperty("consumer_mobile", request.getParameter("contactsmobile"));
		json.addProperty("consumer_name", request.getParameter("contactsname"));
		json.addProperty("name", "fullflow");
		// if(jArray != null){
		//
		// json.add("images", jArray);
		// }
		logger.debug("json.toString() : \n" + json.toString());
		String method = "POST";
		Map map = HTTPApiCURL.ApiCURL(request, Api.NEEDS(), method, json.toString());
		logger.debug("map.toString() : \n" + map.toString());
		return map;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/authSubmit", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> authSubmit(HttpServletRequest request) {
		logger.debug("*** into UserController's authSubmit method ***");
		JsonObject json = new JsonObject();
		json.addProperty("token", request.getParameter("token"));
		json.addProperty("realname", request.getParameter("realname"));
		json.addProperty("sex", request.getParameter("sex"));
		String birth_y = request.getParameter("birth_y");
		String birth_m = request.getParameter("birth_m");
		String birth_d = request.getParameter("birth_d");
		json.addProperty("birthday", birth_y + birth_m + birth_d);
		json.addProperty("phone", request.getParameter("phone"));
		json.addProperty("idnumber", request.getParameter("idnumber"));
		json.addProperty("upimg", request.getParameter("upimg"));
		json.addProperty("downimg", request.getParameter("downimg"));
		logger.debug("json.toString() : \n" + json.toString());
		String method = "POST";
		Map map = HTTPApiCURL.ApiCURL(request, Api.NEEDS(), method, json.toString());
		logger.debug("map.toString() : \n" + map.toString());
		return map;
	}

	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/designerMapDeportAdd", method = RequestMethod.POST)
	public String designerMapDeportAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("*** into UserController's designerMapDeportAdd method ***");
		try {
			MyFileUpload mfu = new MyFileUpload();
			Map<String, Object> map = mfu.process(request, response);
			System.out.println("map.Data() : " + map.toString());
			AssetsDemo ast = new AssetsDemo();
			JsonObject json = new JsonObject();
			JsonArray jArray = new JsonArray();
			JsonParser jParser = new JsonParser();
			SessionUtil session = new SessionUtil();
			String xsession = session.getSession(request, "users").get("xsession").toString();
			String id = session.getSession(request, "users").get("id").toString();
			System.out.println("Xsession : " + xsession);
			String file = "";
			Map m = new HashMap();
			Map splitMap = new HashMap();
			try {
				Set set = map.entrySet();
				Iterator it = set.iterator();
				int itCount = 0;

				while (it.hasNext()) {

					Entry entry = (Entry) it.next();
					System.out.println("---------------- Entry Key --------------->" + entry.getKey());
					System.out.println("---------------- Entry Value --------------->" + entry.getValue());

					if (entry.getKey().toString().indexOf("FilePath") > -1) {
						file = ast.uploadFile(entry.getValue().toString(), xsession);
						System.out.println("---------------- run acs --------------->" + file);
						json = new JsonObject();
						m = MyFileUpload.AssetFileUploadResponse(file);
						splitMap = StrUtils.fileUploadSplit(file);
						json.addProperty("file_id", splitMap.get("file_id").toString());
						json.addProperty("file_url", m.get("public_url").toString());
						System.out.println("public_url : " + m.get("public_url").toString());
						json.addProperty("file_name", m.get("name").toString());
						json.addProperty("is_primary", itCount == 0 ? true : false);
						jArray.add(json);
						System.out.println("file_id : " + splitMap.get("file_id").toString());
						itCount++;
					}
				}
				
				if (map.get("oldImg_id") != null && !map.get("oldImg_id").toString().equals("")) {
					String[] oldImages = map.get("oldImg_id").toString().split(",");
					System.out.println("oldImg_id ==========> " + Arrays.toString(oldImages));
					for(int i=0; i<oldImages.length; i++){
						json = new JsonObject();
						json.addProperty("file_id", oldImages[i]);
						jArray.add(json);
					}	
				}
				System.out.println("multipart data map : " + m.toString());
				System.out.println("first jArray : " + jArray);
			} catch (Exception e) {
//				e.printStackTrace();
				jArray = null;
			}
			if (jArray != null) {

				json.add("images", jParser.parse(jArray.toString()));
			}
			else{
				jArray = new JsonArray();
				String[] oldImages = map.get("oldImg_id").toString().split(",");
				System.out.println("oldImg_id ==========> " + Arrays.toString(oldImages));
				System.out.println("oldImages.length ===> "+oldImages.length);
				for(int i=0; i<oldImages.length; i++){
					json = new JsonObject();
					json.addProperty("file_id", oldImages[i]);
					jArray.add(json);
				}
				System.out.println("only oldImg_id ======> "+jArray);
				json.add("images", jParser.parse(jArray.toString()));
			}
			String room = map.get("s_house").toString();
			String living_room = map.get("t_house").toString();
			String toilet = map.get("w_house").toString();
			json.addProperty("designer_id", id);
			json.addProperty("title", map.get("pro-name").toString());
			json.addProperty("province", map.get("s_province").toString());
			json.addProperty("city", map.get("s_city").toString());
			json.addProperty("district", map.get("s_county").toString());
			json.addProperty("province_name", map.get("province_name").toString());
			json.addProperty("city_name", map.get("city_name").toString());
			json.addProperty("district_name", map.get("county_name").toString().equals("区") ? "none" : map.get("county_name").toString());
			json.addProperty("community_name", map.get("dwelling-name").toString());
			json.addProperty("room_type", room);
			json.addProperty("bedroom", living_room);
			json.addProperty("restroom", toilet);
			json.addProperty("room_area", map.get("dwelling-area").toString());
			json.addProperty("project_style", map.get("select_style").toString());
			json.addProperty("prj_price", Long.valueOf(map.get("project-price").toString()));
			json.addProperty("house_type", map.get("house-style").toString());
			json.addProperty("description", map.get("case_describe").toString());
			json.addProperty("case_color", "yellow");


			System.out.println("json.toString() : " + json.toString());
			String POST = "POST";
			String PUT = "PUT";
			String status = map.get("status").toString();
			String caseId = map.get("caseId").toString();
			System.out.println("status : " + status + " , caseId : " + caseId);
			int i_status = -1;
			if (status != null && !status.equals("")) {

				i_status = Integer.valueOf(status);
			}
			if (i_status == 2 || i_status == 1) {

				 Map ma = HTTPApiCURL.ApiCURL(request,
				 Api.DESIGNER_CASE_LIST_MODIFY(caseId), PUT, json.toString());
				 System.out.println("designerMapModify result : " +
				 ma.toString());
				 return "redirect:"+PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")+"/mark/designerCaselist/?act=case";
			} else {
				 Map ma = HTTPApiCURL.ApiCURL(request, Api.DESIGNERADDCASE(),
				 POST, json.toString());
				 System.out.println("designerMapDeportAdd result : " +
				 ma.toString());
				 return "redirect:"+PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")+"/mark/designerCaselist/?act=case";
			}

		} catch (Exception e) {
			 return "redirect:"+PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")+"/mark/designerCaselist/?act=caseerr";
		}
	}

	/**
	 * Acquisition system announcement based on selected state
	 * 
	 * @param request
	 * @return
	 */
	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@RequestMapping(value = "/getSystemNoticeList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSystemNoticeList(HttpServletRequest request) {
		String selected = request.getParameter("");
		Map map = HTTPApiCURL.ApiCURL(request, "", "", "");
		return map;

	}

	/**
	 * Get user session
	 * 
	 * @param request
	 * @return
	 */
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "/getSession", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSession(HttpServletRequest request) {

		SessionUtil session = new SessionUtil();
		return session.getSession(request, "users");
	}

	/**
	 * Member real name authentication
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/identification")
	@ResponseBody
	public Map identification() {
		Map map = null;
		return map;
	}

	/**
	 * Get massive database data
	 * 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/getGalleryList")
	@ResponseBody
	public Map getGalleryList(HttpServletRequest request) {

		int page = Integer.parseInt(request.getParameter("page").toString());
		if (page < 0) {
			page = 0;
		}
		int pageSize = Integer.parseInt(request.getParameter("pageSize").toString());
		if (pageSize < 0) {
			pageSize = Api.PAGESIZE;
		}

		String parameter = "?offset=" + page + "&limit=" + pageSize + "&sort_by=id&sort_order=desc";

		Map map = HTTPApiCURL.getMethed(request, Api.DELETECASE(null, parameter), "GET", "");
		return map;
	}

	/**
	 * Get designer upload photo info
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/photoUpload")
	@ResponseBody
	public Map getPhotoInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MyFileUpload mfu = new MyFileUpload();
		Map map = mfu.process(request, response);
		System.out.println("map.Data() : " + map.toString());
		SessionUtil session = new SessionUtil();
		String xsession = session.getSession(request, "users").get("xsession").toString();
		AssetsDemo ast = new AssetsDemo();
		Map resultFile = new HashMap();
		try {
			String file = ast.uploadFile(map.get("FilePath").toString(), xsession);
			resultFile = MyFileUpload.AssetFileUploadResponse(file);
		} catch (Exception e) {
			resultFile = null;
		}
		// System.out.println("getPhotoInfo resultFile :
		// "+resultFile.toString());

		return resultFile;
	}

	/**
	 * Get massive database data
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/DesignerAuthentication")
	public String authentication(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.err.println("---------------------------authentication---------------------------------");
		MyFileUpload mfu = new MyFileUpload();
		Map maps = mfu.process(request, response);
		//System.out.println("map.Data() : " + maps.toString());
		SessionUtil session = new SessionUtil();
		String xsession = session.getSession(request, "users").get("xsession").toString();
		AssetsDemo ast = new AssetsDemo();
		JsonArray jArray = new JsonArray();
		System.err.println("maps:" + maps.toString());
		try {
			for (int i = 1; i < 4; i++) {
				//System.out.println("-------------------count(" + i + ")-----------------");
				String file = ast.uploadFile(maps.get("FilePath" + i).toString(), xsession);
				Map splitMap = MyFileUpload.AssetFileUploadResponse(file);
				//System.out.println("splitMap:" + splitMap.toString());
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("file_id", splitMap.get("file_id").toString());
				jsonObject.addProperty("file_name", splitMap.get("name").toString());
				jsonObject.addProperty("file_url", splitMap.get("public_url").toString());
				jArray.add(jsonObject);
				System.out.println("jArray list ==================> " + jArray);
			}
		} catch (Exception e) {
		}
		String member_id = session.getSession(request, "users").get("id").toString();
		JSONObject json = new JSONObject();
		json.put("real_name", maps.get("lastname"));
		if (maps.get("phone") != null) {
			json.put("mobile_number", maps.get("phone"));
		} else {
			json.put("mobile_number", maps.get("phone3"));
		}
		json.put("certificate_no", maps.get("id-card"));
		if(jArray != null && jArray.size() > 0)
		{
			json.put("photo_front_end", jArray.get(0));
			if(jArray.size() > 1)json.put("photo_back_end", jArray.get(1));
			if(jArray.size() > 2)json.put("photo_in_hand", jArray.get(2));
		}
		json.put("audit_status", "0");
		SystemUtil.sysStr("submit.toString()", maps.get("submitType").toString());
		Map map = null;
		SystemUtil.sysStr("authentication url  if", Api.MEMBERREALNAME(member_id));
		if (Integer.parseInt(maps.get("submitType").toString()) == 1) {
			SystemUtil.sysStr("authentication url  if", Api.MEMBERREALNAME(member_id));
			SystemUtil.sysStr("authentication url  if  json", json.toJSONString());
			map = HTTPApiCURL.ApiCURL(request, Api.MEMBERREALNAME(member_id), "POST", json.toJSONString());
		} else {
			SystemUtil.sysStr("authentication url  else", Api.MEMBERREALNAME(member_id));
			SystemUtil.sysStr("authentication url  else json", json.toJSONString());
			map = HTTPApiCURL.ApiCURL(request, Api.MEMBERREALNAME(member_id), "PUT", json.toJSONString());
		}
		SystemUtil.sysStr("authentication map", map.toString());
			// if(Integer.parseInt(map.get("status").toString())<400){
		return "redirect:" + PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")
				+ "/user/authentication";
			// }else{
			// return "";
			// }
	}

	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/againSubmit", method = RequestMethod.POST)
	@ResponseBody
	public Map againSubmit(HttpServletRequest request, HttpServletResponse response) {
		SessionUtil session = new SessionUtil();
		String member_id = session.getSession(request, "users").get("id").toString();
		SystemUtil.sysStr("againSubmit url", Api.MEMBERAGAINAUTH(member_id));
		Map map = HTTPApiCURL.ApiCURL(request, Api.MEMBERAGAINAUTH(member_id), "PUT", "");
		SystemUtil.sysStr("againSubmit map", map.toString());
		return map;
	}

	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/designerCaseModify", method = RequestMethod.POST)
	public String designerCaseModify(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("*** into UserController's designerCaseModify method ***");
		try {
			MyFileUpload mfu = new MyFileUpload();
			Map map = mfu.process(request, response);
			System.out.println("map.Data() : " + map.toString());
			AssetsDemo ast = new AssetsDemo();
			JsonObject json = new JsonObject();
			JsonArray jArray = new JsonArray();

			SessionUtil session = new SessionUtil();
			String xsession = session.getSession(request, "users").get("xsession").toString();
			String id = session.getSession(request, "users").get("id").toString();
			System.out.println("Xsession : " + xsession);

			try {
				String file = ast.uploadFile(map.get("FilePath").toString(), xsession);
				Map m = StrUtils.fileUploadSplit(file);
				json.addProperty("file_id", m.get("file_id").toString());
				json.addProperty("file_url", m.get("file_url").toString());
				json.addProperty("file_name", m.get("file_name").toString());
				json.addProperty("is_primary", true);
				jArray.add(json);
				System.out.println("first jArray : " + jArray);
			} catch (Exception e) {
				jArray = null;
			}

			json = new JsonObject();
			String room = map.get("mroom").toString();
			String living_room = map.get("mliving_room").toString();
			String toilet = map.get("mtoilet").toString();
			String caseId = map.get("case_id").toString();
			System.out.println("caseId : " + caseId);
			json.addProperty("designer_id", id);
			json.addProperty("title", map.get("mproName").toString());
			json.addProperty("province", map.get("mprovince").toString());
			json.addProperty("city", map.get("mcity").toString());
			json.addProperty("district", map.get("mcounty").toString());
			json.addProperty("community_name", map.get("mhouse-name").toString());
			json.addProperty("room_type", room + "-" + living_room + "-" + toilet);
			json.addProperty("room_area", Long.valueOf(map.get("mdwelling-area").toString()));
			json.addProperty("project_style", map.get("mproject_style").toString());
			json.addProperty("prj_price", Long.valueOf(map.get("mproject-price").toString()));
			json.addProperty("case_color", map.get("mcase_color").toString());
			json.addProperty("description", map.get("mcase_describe").toString());

			if (jArray != null)
				json.add("images", jArray);

			logger.debug("json.toString() : \n" + json.toString());
			String method = "PUT";
			Map ma = HTTPApiCURL.ApiCURL(request, Api.DESIGNER_CASE_LIST_MODIFY(caseId), method, json.toString());
			logger.debug("result designerCaseModify : " + ma.toString());

			return "redirect:" + PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")
					+ "/user/index/#mypage/?act=case";
		} catch (Exception e) {
			return "redirect:" + PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")
					+ "/user/index/#mypage/?act=caseerr";
		}
	}

	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/getDesignerCaseDetail")
	@ResponseBody
	public Map getDesignerCaseDetail(HttpServletRequest request) {
		logger.debug("*** into UserController's getDesignerCaseDetail method ***");
		String case_id = request.getParameter("case_id");
		String status = request.getParameter("status");
		System.out.println("case_id : " + case_id);
		Map ma = HTTPApiCURL.getMethed(request, Api.DESIGNER_CASE_LIST_MODIFY(case_id), "GET", "");
		ma.put("status", status);
		logger.debug("result getDesignerCaseDetail : " + ma.toString());
		return ma;
	}

	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/getPaypalFirst")
	@ResponseBody
	public Map getPaypalFirst(HttpServletRequest request) {
		logger.debug("*** into UserController's getPaypalFirst method ***");
		Long orderId = Long.parseLong(request.getParameter("orderId"));
		Long orderLineId = Long.parseLong(request.getParameter("orderLineId"));
		String channelType = request.getParameter("channelType");
		String paymethod = request.getParameter("paymethod");
		System.out.println("orderId : " + orderId + " ; orderLineId : " + orderLineId + " ; channelType : "
				+ channelType + " ; paymethod : " + paymethod);
		Map map = HTTPApiCURL.getMethed(request, Api.PAY_F(orderId, orderLineId, channelType, paymethod), "GET", "");
		System.out.println("getPaypalFirst reuslt : " + map.toString());
		return map;
	}

	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/getPaypalLast")
	@ResponseBody
	public Map getPaypalLast(HttpServletRequest request) {
		logger.debug("*** into UserController's getPaypalLast method ***");
		Long orderId = Long.parseLong(request.getParameter("orderId"));
		Long orderLineId = Long.parseLong(request.getParameter("orderLineId"));
		String channelType = request.getParameter("channelType");
		String paymethod = request.getParameter("paymethod");

		Map map = HTTPApiCURL.getMethed(request, Api.PAY_L(orderId, orderLineId, channelType, paymethod), "GET", "");
		System.out.println("getPaypalLast reuslt : " + map.toString());
		return map;
	}
	// @SuppressWarnings({ "rawtypes" })
	// @RequestMapping(value = "/getPaypalReturn")
	// public Map getPaypalReturn(HttpServletRequest request ,
	// HttpServletResponse response){
	// logger.debug("*** into UserController's getPaypalReturn method ***");
	// //获取支付宝GET过来反馈信息
	//// Map<String,String> params = new HashMap<String,String>();
	//// Map requestParams = request.getParameterMap();
	//// for (Iterator iter = requestParams.keySet().iterator();
	// iter.hasNext();) {
	//// String name = (String) iter.next();
	//// String[] values = (String[]) requestParams.get(name);
	//// String valueStr = "";
	//// for (int i = 0; i < values.length; i++) {
	//// valueStr = (i == values.length - 1) ? valueStr + values[i]
	//// : valueStr + values[i] + ",";
	//// }
	//// //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
	//// valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
	//// params.put(name, valueStr);
	//// }
	////
	//// //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
	//// //商户订单号
	////
	//// String out_trade_no = new
	// String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	////
	//// //支付宝交易号
	////
	//// String trade_no = new
	// String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
	////
	//// //交易状态
	//// String trade_status = new
	// String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
	////
	//// //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
	////
	//// //计算得出通知验证结果
	//// boolean verify_result = AlipayNotify.verify(params);
	////
	//// if(verify_result){//验证成功
	//// //////////////////////////////////////////////////////////////////////////////////////////
	//// //请在这里加上商户的业务逻辑程序代码
	////
	//// //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
	//// if(trade_status.equals("TRADE_FINISHED") ||
	// trade_status.equals("TRADE_SUCCESS")){
	//// //判断该笔订单是否在商户网站中已经做过处理
	//// //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
	//// //如果有做过处理，不执行商户的业务程序
	//// }
	////
	//// //该页面可做页面美工编辑
	//// out.println("验证成功<br />");
	//// //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
	////
	//// //////////////////////////////////////////////////////////////////////////////////////////
	//// }else{
	//// //该页面可做页面美工编辑
	//// out.println("验证失败");
	//// }
	//
	// }

	/**
	 * @param request,
	 *            this method can get member message
	 * @return map
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getIndexDesigner", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getIndexDesigner(HttpServletRequest request) {
		logger.debug("*** into UserController's getIndexDesigner method ***");
		String method = "GET";
		System.err.println("getIndexDesigner url : " + Api.INDEXDESIGNER());
		Map map = HTTPApiCURL.getMethed(request, Api.INDEXDESIGNER(), method, "");
		System.err.println("getIndexDesigner map : " + map.toString());
		return map;
	}

	/**
	 * upload member Avatar
	 * 
	 * @param request
	 * @param response
	 * @return map
	 * @throws FileUploadException
	 * @throws IOException
	 * @throws ServletException
	 */
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/uploadAvatar")
	public String uploadAvatar(HttpServletRequest request, HttpServletResponse response)
			throws FileUploadException, ServletException, IOException {
		System.out.println(" -------------- userController uploadAvatar -------------- ");
		SessionUtil session = new SessionUtil();
		AssetsDemo asset = new AssetsDemo();
		String FileResult = "";
		String X_Token = session.getSession(request, "users").get("X-Token").toString();
		String url = Api.UPLOADAVATAR();
		try {
			MyFileUpload mfu = new MyFileUpload();
			Map map = mfu.process(request, response);
			System.out.println("map.Data() : " + map.toString());
			String avatar_map = map.get("avatar_data").toString();
			System.out.println("avatar_map : " + avatar_map.toString());
			Map xy = GsonUtil.formJson(avatar_map);
			System.out.println("xy ====> " + xy);
			System.out.println("xy ====> " + xy.get("x"));
			int startX = (int) Math.round(Double.valueOf(xy.get("x").toString()));
			int startx = (int) Math.round(Double.valueOf(xy.get("y").toString()));
			int width = (int) Math.round(Double.valueOf(xy.get("width").toString()));
			int height = (int) Math.round(Double.valueOf(xy.get("height").toString()));
			
			System.out.println(
					"startX : " + startX + ", startx : " + startx + ", width : " + width + ", height : " + height);
			String FilePath = map.get("FilePath1").toString();
			String ext = FilenameUtils.getExtension(FilePath);
			System.out.println("FilePath : "+FilePath);
			System.out.println("ext : "+ext);
			BufferedImage reSizeImg = cut(FilePath, startX, startx, width, height);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(reSizeImg, "png", baos);
			InputStream is = new ByteArrayInputStream(baos.toByteArray());
//			InputStream is = new ByteArrayInputStream(resizePNG(FilePath, ext, width, height, true));
			HttpEntity reqEntity = MultipartEntityBuilder.create().addBinaryBody("file", is)
					.addTextBody("format", "json").addTextBody("software", "96").addTextBody("public", "true").build();
			System.out.println("build reqEntity ==> " + reqEntity);
			Request req = Request.Put(url).body(reqEntity).addHeader("X-Token", X_Token);
			System.out.println("request api ==> " + req);
			Response result = asset.RequestHttpExecute(req);
			System.out.println("response api ==> " + result);
			FileResult = asset.HandleHttpResponse("uploadFile", result);
			System.out.println("return FileResult ==> " + FileResult);
			is.close();
			return "redirect:" + PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")
					+ "/user/personalinformation/?act=success";
		} catch (Exception e) {
			return "redirect:" + PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")
					+ "/user/personalinformation/?act=error";
		}
	}

	// img cut
	public BufferedImage cut(String srcPath, int startX, int startY, int width, int height) throws IOException {
		BufferedImage subImg;
		BufferedImage bufImg = ImageIO.read(new File(srcPath));
		subImg = bufImg.getSubimage(startX, startY, width, height);
		return subImg;

	}
}

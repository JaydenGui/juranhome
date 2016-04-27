/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * user login and register controller
 * ==========================================================+
 * @author fangzhigang
 * ==========================================================+
 * @date：2015-12-11 10:11
 * =========================================================*/
package com.adsk.mp.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.AssetsDemo;
import com.adsk.mp.commons.CookieUtil;
import com.adsk.mp.commons.EncryptionCoder;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.PropUtil;
import com.adsk.mp.commons.SessionUtil;
import com.adsk.mp.commons.SystemUtil;
import com.adsk.mp.commons.ValidatorUtils;
import com.adsk.mp.commons.VerifyPhoneNumberUtil;
import com.google.gson.JsonObject;

/**
 * Return login page method
 */

@Controller
@RequestMapping("/login")
public class LoginController {


	@RequestMapping("/index")
	public String login() {
		return "template/login/login";
	}

	/**
	 * Return register page method
	 */
	@RequestMapping("/register")
	public String register() {
		return "template/login/regsiter";
	}
	
	/**
	 * registration protocol
	 */
	@RequestMapping("/protocol")
	public String protocol() {
		return "template/login/protocol";
	}
	/**
	 * retrievepassword
	 */
	@RequestMapping("/retrievepassword")
	public String retrievepassword() {
		return "template/login/retrievepassword";
	}
	/**
	 * Retrieve password step one
	 */
	@RequestMapping("/steone")
	public String steone() {
		return "template/login/steone";
	}
	/**
	 * Retrieve password step two
	 */
	@RequestMapping("/steptwo")
	public String steptwo() {
		return "template/login/steptwo";
	}
	/**
	 * Retrieve password step three
	 */
	@RequestMapping("/stethree")
	public String stethree() {
		return "template/login/stethree";
	}
	/**
	 * Retrieve password step four
	 */
	@RequestMapping("/stefour")
	public String stefour() {
		return "template/login/stefour";
	}

	/**
	 * todo login
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/loging", method = RequestMethod.POST)
	@ResponseBody
	public Map loginInput(HttpServletRequest request, HttpServletResponse response) {
		
		String phone = request.getParameter("username");
		String password = request.getParameter("password");//EncryptionCoder.encodeMD5String(request.getParameter("password"));
		String type = request.getParameter("type");
		boolean autoLogin = Boolean.parseBoolean(request.getParameter("rememberPwd"));

		JsonObject jsonStr = new JsonObject();
		jsonStr.addProperty("mobile_number",phone);
		jsonStr.addProperty("password",password);
		jsonStr.addProperty("login_type","mobile");

		
		String loginType=null;
		String role=null;
		if(type.equals("1")){
			loginType="member";
			role="user";
		}else{
			loginType="designer";
			role="designer";
		}
		Map map= HTTPApiCURL.ApiCURL(request,Api.MEMBERSLOGIN(loginType), "PUT", jsonStr.toString());
		if (Integer.parseInt(map.get("status").toString())<400) {
			
			DecimalFormat df = new DecimalFormat("#");
			JSONObject json = new JSONObject();
			
			json.put("userName", map.get("last_name"));
			json.put("token", map.get("token"));
			json.put("type", map.get("member_type"));
			json.put("id", df.format(map.get("member_id")));
			json.put("mobile", map.get("mobile_number"));
			json.put("xsession", map.get("xsession"));
			json.put("role", role);
			json.put("ez_token",map.get("ez_token"));
			json.put("hs_guid",map.get("hs_guid"));
			json.put("ez_guid",map.get("hs_guid"));
			json.put("avatar", map.get("avatar"));
			
			// save userdata to session
			SessionUtil session = new SessionUtil();
			session.createSession(request, "users", json);
			SystemUtil.sysStr("loginInput session", session.getSession(request, "users").toString());
			// save to cookie
			if (autoLogin) {
				CookieUtil cook = new CookieUtil();
				try {
					cook.addCookie("tome", password, autoLogin, request, response);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}

		}
		return map;
	}

	/**
	 * todo register
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/registe", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> registerInput(HttpServletRequest request, HttpServletResponse response) {

		String phone = request.getParameter("phone");
		String userName = request.getParameter("userName");
		String userPass = EncryptionCoder.encodeMD5String(request.getParameter("password"));
		String captcha = request.getParameter("captcha");
		String type = request.getParameter("type");
		if (!ValidatorUtils.IsPhone(phone) || !ValidatorUtils.IsPasswLength(request.getParameter("password"))
				|| !ValidatorUtils.IsPassword(request.getParameter("password")) || !ValidatorUtils.IsLength(userName)) {
			return null;
		}
		// todo business logical
		JsonObject json = new JsonObject();
		json.addProperty("mobileNumber", phone);
		json.addProperty("passWord", userPass);
		json.addProperty("verifyCode", captcha);
		json.addProperty("role", type);

		Map map = HTTPApiCURL.ApiCURL(request,Api.MEMBERS(), "POST", json.toString());
		return map;
	}

	/**
	 * getMemberCookie
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getCookie")
	@ResponseBody
	public Map<String, Object> getMemberCookie(HttpServletRequest request, HttpServletResponse response)throws UnsupportedEncodingException, Exception {

		String username = "";
		String password = "";

		Cookie[] cookies = request.getCookies();
		for (Cookie cookieS : cookies) {
			if ("username".equals(cookieS.getName())) {
				// 解密 //可以自己设定解密规则,见EncryptionCode中的encryptionRules
				username = new String(EncryptionCoder.decryptBASE64(URLDecoder.decode(cookieS.getValue(), "utf-8")));
			}
			if ("password".equals(cookieS.getName())) {
				// 解密
				password = new String(EncryptionCoder.decryptBASE64(URLDecoder.decode(cookieS.getValue(), "utf-8")));
			}
		}
		String[] array = { username, password };
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("data", array);

		return modelMap;
	}

	/**
	 * Users remember password creation cookie
	 */
	@RequestMapping(value = "/addCookie", method = RequestMethod.POST)
	public void addCookie(HttpServletRequest request, HttpServletResponse response) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean checkbox = Boolean.parseBoolean(request.getParameter("rememberPwd"));

		CookieUtil cookie = new CookieUtil();
		try {
			cookie.addCookie(username, password, checkbox, request, response);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/addSession", method = RequestMethod.POST)
	public void addUserSession(HttpServletRequest request, HttpServletResponse response) {

		SessionUtil session = new SessionUtil();
		Object userObj = new Object();
		session.createSession(request, "user", userObj);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getCaptcha", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCaptcha(HttpServletRequest request, HttpServletResponse response) {
		String phone = request.getParameter("phone");
		String type = request.getParameter("type");
		Map map = null;
		if (phone.trim() == null && phone.trim().equals("")) {
			return map;
		} else {
			JsonObject json = new JsonObject();
			json.addProperty("mobileNumber", phone);
			json.addProperty("verifyCode", VerifyPhoneNumberUtil.getNum());
			json.addProperty("verifyType", type);
			map = HTTPApiCURL.ApiCURL(request,Api.SMS(), "PUT", json.toString());
			return map;
		}
	}

	/**
	 * Verify the mobile phone number
	 * 
	 * @param request
	 * @param response
	 * @return
	 */

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/verifyPhone", method = RequestMethod.POST)
	@ResponseBody
	public Map verifyPhone(HttpServletRequest request, HttpServletResponse response) {
		String phone = request.getParameter("phone");
		if (!ValidatorUtils.IsPhone(phone)) {
			return null;
		}

		JsonObject json = new JsonObject();
		json.addProperty("mobileNumber", phone);
		Map map = HTTPApiCURL.ApiCURL(request,Api.VERIFYMOBILE(), "GET", json.toString());
		return map;
	}

	/**
	 * user loginout
	 * 
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/loginOut")
	public String loginOut(HttpServletRequest request,HttpServletResponse response) throws ClientProtocolException, IOException {
		System.err.println("-----------------------  logout -------------------");
		String Caller = request.getParameter("caller");
		String Token = request.getParameter("token");
		SessionUtil session = new SessionUtil();
		System.out.println("session ==================> "+request.getSession());
		System.out.println("cookie ==============> "+request.getCookies());
		if(session.getSession(request, "users") != null){
			Cookie[] cookies = request.getCookies();
			try {
				for (int i = 0; i < cookies.length; i++) {
					//System.out.println(cookies[i].getName() + ":"+ cookies[i].getValue());
					Cookie cookie = new Cookie(cookies[i].getName(), null);
					cookie.setMaxAge(0);
					cookie.setPath("/");//根据你创建cookie的路径进行填写
					cookie.setValue("");
					response.addCookie(cookie);
				}
			} catch (Exception e) {
				System.out.println("删除Cookies发生异常！");
			}
			AssetsDemo ast = new AssetsDemo();
			String str_result = "";
			String x_token = session.getSession(request, "users") != null ?session.getSession(request, "users").get("X-Token").toString(): "";
			System.out.println("x_token =====================> "+x_token);
			String url = PropUtil.getProperty("redirectUrl.properties").get("HomeStyler_logout")+x_token;
			Request req = Request.Delete(url);
			Response result = ast.RequestHttpExecute(req);
			str_result = ast.HandleHttpResponse("result", result);
			System.out.println("member home_styler logout =====> "+str_result);
			session.delSession(request, "users");
			System.out.println("Caller ====================================================> " + Caller);
			System.out.println("Token ====================================================> " + Token);
			
			return Caller == null ? "redirect:"+PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")+"/" : "redirect:"+PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")+"/3Dscheme/create3D";
		}
		return Caller == null ? "redirect:"+PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")+"/" : "redirect:"+PropUtil.getProperty("redirectUrl.properties").get("REDIRECT_URL")+"/3Dscheme/create3D";
	}
}

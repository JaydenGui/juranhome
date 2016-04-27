package com.adsk.mp.filter;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;

import com.adsk.mp.commons.EncryptionCoder;
import com.adsk.mp.commons.GsonUtil;
import com.adsk.mp.commons.SessionUtil;

public class LoginFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		SessionUtil session = new SessionUtil();
		Cookie[] cookies = request.getCookies();
		String cookieValues = "";

		try {
			if (null != cookies) {
				for (Cookie cookie : cookies) {
					if(cookie.getName().equals("users")) {
						cookieValues = new String(EncryptionCoder.decryptBASE64(URLDecoder.decode(cookie.getValue(),"UTF-8")));
						break;
					}
				}
				Map map = new HashMap();
				try{
					map = GsonUtil.formJson(cookieValues);
					String userName = map.get("user_name").toString();
					String moblie = map.get("mobile_no").toString();
					String role = map.get("Member_Type").toString();
					String id = map.get("acs_member_id").toString();
					String type = map.get("Member_Type").toString();
					String jwt = map.get("diy_jwt").toString();
					String hs_uid = map.get("hs_uid").toString();
					String x_token = map.get("X-Token").toString();
					map.put("userName", userName);
					map.put("moblie",moblie);
					map.put("role", role);
					map.put("id", id);
					map.put("type", type);
					map.put("diy_jwt",jwt);
					map.put("hs_uid", hs_uid);
					map.put("x_token", x_token);
					session.createSession(request, "users", map);
				}
				catch(Exception e){
//					System.err.println("Gson data error");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		chain.doFilter(request, response);
	}

	public void destroy() {
		// TODO Auto-generated method stub

	}

}

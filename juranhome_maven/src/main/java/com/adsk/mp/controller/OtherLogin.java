/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * user login and register controller
 * ==========================================================+
 * @author fangzhigang
 * ==========================================================+
 * @date：2015-12-11 10:11
 * =========================================================*/
package com.adsk.mp.controller;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.PropUtil;
import com.adsk.mp.commons.SessionUtil;

/**
 * Return login page method
 */

@Controller
public class OtherLogin {
	private Logger logger = Logger.getLogger(getClass());

	/**
	 * todo login
	 * 
	 * @throws JWTVerifyException
	 * @throws IOException
	 * @throws SignatureException
	 * @throws IllegalStateException
	 * @throws NoSuchAlgorithmException
	 * @throws InvalidKeyException
	 */
	@RequestMapping(value = "/3partyLogin", method = RequestMethod.GET)
	@ResponseBody
	public void Login_Step1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SessionUtil session = new SessionUtil();
		logger.info("============================================================ Start 3Party Login ============================================================");
		ShowConsoleMessage("", "Start 3Party Login");		
//		Properties p = PropUtil.getProperty("SSO.properties");
		String MemberType = request.getParameter("MT");
		ShowConsoleMessage("", MemberType);
		while(session.getSession(request, "users")==null);
		System.out.println("Member Type ----------------------------> "+MemberType);
			if("member".equals(MemberType))
			{
				response.sendRedirect("/");
			}
			else
			{
				response.sendRedirect("/mark/index");
			}

		//System.out.println("OtherLogin getSession()----------------------------> "+session.getSession(request,"users"));
		logger.info("============================================================ End 3Party Login ============================================================");
		ShowConsoleMessage("", "End 3Party Login"); 
	}

	
	public void ShowConsoleMessage(String Message, String Value)
	{
		String Resutl_SB = Message;
		for(int i = 0; i < 80 - Message.length() + 1; i++)Resutl_SB += "-";
		Resutl_SB += "> " + Value;
		
		System.out.println(Resutl_SB.toString());
	}
}


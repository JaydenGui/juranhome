package com.adsk.mp.commons;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
/**
 * 
 * @author tungwei
 * this class can get Location IP 
 */
public class IPUtils {


	private static Logger getLogger() {
		return Logger.getLogger(IPUtils.class);
	}

	public static String getLocalIp() {
		try {
		    InetAddress addr = InetAddress.getLocalHost();

		    byte[] ipAddr = addr.getAddress();

		    String s =  (int)(ipAddr[0] & 0x00ff) + "." + (int)(ipAddr[1] & 0x00ff)  + "." +  (int)(ipAddr[2] & 0x00ff)  + "." + (int)(ipAddr[3] & 0x00ff);
		    return s;
		}
		catch(Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	public static boolean isLocalTestIp() {
		if("192.168.2.169".equals(getLocalIp()))
			return true;
		if(getLocalIp().startsWith("192.168.2."))
			return true;

		return false;
	}


	public static String getRemoteIP(HttpServletRequest request) {
//		HttpServletRequest request = WebServletUtils.getRequest();
		
//			System.out.println("+++++++ request ip not null +++++++ ");
//			if(getLogger().isDebugEnabled()) {
//				StringBuffer sb = new StringBuffer();
//				sb.append("== Request Header Start ... \n");
//	
//				java.util.Enumeration enumer = request.getHeaderNames();
//				while(enumer.hasMoreElements()) {
//					String xName = (String)enumer.nextElement();
//					sb.append("[Header]" + xName + " : " + request.getHeader(xName) + "\n");
//				}
//	
//				sb.append("== Request Header End \n");
//				getLogger().debug(sb.toString());
//
//			}

			String ip = request.getHeader("x-forwarded-for");
//			if (ip == null || ip.length() == 0) {
//				ip = request.getRemoteAddr();
//			}

			ip = request.getHeader("x-forwarded-for");
			if (StrUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("Proxy-Client-IP");
			}

			if (StrUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("WL-Proxy-Client-IP");
			}

			if (StrUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("HTTP_CLIENT_IP");
			}
			
			if (StrUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			}
			
			if (StrUtils.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getRemoteAddr();
			}

			return ip;
		
	}

}

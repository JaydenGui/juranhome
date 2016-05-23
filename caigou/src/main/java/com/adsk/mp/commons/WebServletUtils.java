package com.adsk.mp.commons;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author tungwei
 * Request & Response input to ThreadLocal 
 */
public class WebServletUtils {
	private static ThreadLocal req = new ThreadLocal();
	private static ThreadLocal res = new ThreadLocal();
	private static ServletConfig servletConfig = null;
	private static ThreadLocal uploadFiles = new ThreadLocal();
	
	public static void initThreadLocal(HttpServletRequest request, HttpServletResponse response) {
		req.set(request);
		res.set(response);
	}
	
	public static void removeThreadLocal() {
		req.set(null);
		res.set(null);
		uploadFiles.set(null);
	}
	
	public static HttpServletRequest getRequest() {
		return (HttpServletRequest)req.get();
	}

	public static HttpServletResponse getResponse() {
		return (HttpServletResponse)res.get();
	}
	
	public static ServletConfig getServletConfig() {
		return servletConfig;
	}

	public static void setServletConfig(ServletConfig config) { 
		servletConfig = config;
	}
	
	public static void setUploadFiles(UploadFiles u) {
		uploadFiles.set(u);
	}

	public static UploadFiles getUploadFiles() {
		return (UploadFiles)uploadFiles.get();
	}

}

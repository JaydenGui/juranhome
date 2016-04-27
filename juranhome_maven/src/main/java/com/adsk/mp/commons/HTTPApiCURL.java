/*+++++++++++++++++++++++++++++++++++++++++++++
 * API request public class
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2015-11-27
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.commons;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * request remote data public class
 * 
 * @author fanghzigang
 * @date 2015-12-2
 */
public class HTTPApiCURL {
	/**
	 * Request remote data method
	 * 
	 * @param request
	 *            url
	 * @param method
	 * @param param
	 * @return string jsonString
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map ApiCURL(HttpServletRequest request, String urlString, String method, String param) {
	
		BufferedReader reader = null;
		HttpURLConnection connection = null;
		String jsonString = null;
		Map map = null;

		// Get token from sessuion
		SessionUtil session = new SessionUtil();

		try {

			URL url = new URL(urlString);
			connection = (HttpURLConnection) url.openConnection();
			connection.setDoInput(true);
			connection.setDoOutput(true);
			connection.setRequestMethod(method);
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);

			connection.setRequestProperty("Content-Type", "application/json");
			connection.setRequestProperty("Accept-Charset", "utf-8");
			connection.setRequestProperty("contentType", "utf-8");
			connection.setRequestProperty("Charset", "utf-8");
			if (session.getSession(request, "users") != null) {
				
				String token = session.getSession(request, "users").get("token").toString();
				//String xsession = session.getSession(request, "users").get("xsession").toString();
				//String role=session.getSession(request, "users").get("role").toString();
				String acs_token = session.getSession(request, "users").get("ACS-Token").toString();
				String memberType = session.getSession(request, "users").get("Member_Type").toString();
				String hs_uid=session.getSession(request, "users").get("hs_uid").toString();
				String X_Token = session.getSession(request, "users").get("X-Token").toString();
//				String acs_member_id = session.getSession(request, "users").get("acs_member_id").toString();
				connection.setRequestProperty("token", token);
				//connection.setRequestProperty("xsession", xsession);
				connection.setRequestProperty("X-Token", X_Token);
				connection.setRequestProperty("ACS-Token", acs_token);
				connection.setRequestProperty("Member-Type", memberType);
				connection.setRequestProperty("ez_guid", "1C6401BD9FDAF76F6506CF97237AEE5E");
				connection.setRequestProperty("ez_token", "FF5E7FF26768A8C28A292D16FC97E662");
				connection.setRequestProperty("hs_uid", hs_uid);
				connection.setRequestProperty("Authorization", "Basic "+X_Token);
				String id = session.getSession(request, "users").get("id").toString();

				System.err.println("member_id:" + id + "\n"+ "url:" + urlString+"\n"+"hs_uid"+hs_uid+"\n"+"X_Token:"+X_Token+"\n"+"ACS-Token:"+acs_token+"\n"+"Member-Type:"+memberType);
				
			}
			connection.connect();
			DataOutputStream out = new DataOutputStream(connection.getOutputStream());
			String paramString;
			if (param.equals("")) {
				JsonObject obj = new JsonObject();
				paramString = obj.toString();
			} else {
				paramString = param;
			}
			out.write(paramString.getBytes());

			out.flush();
			out.close();
			int status = connection.getResponseCode();
				
			if (status < 400) {
				reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String lines;
				StringBuffer sbf = new StringBuffer();
				while ((lines = reader.readLine()) != null) {
					lines = new String(lines.getBytes(), "utf-8");
					sbf.append(lines);
				}
                
				jsonString = sbf.toString();
				if (jsonString.trim().length() > 0) {
					map = GsonUtil.formJson(jsonString);
					map.put("status", status);
					String str = urlString.substring(urlString.lastIndexOf("/") + 1, urlString.length());
					Map<String, List<String>> mapList = connection.getHeaderFields();
					if (str.equals("member") || str.equals("designer")) {
						
						String getToken = mapList.get("token").toString();
						String getXsession = mapList.get("xsession").toString();
						String token = getToken.substring(1, getToken.length() - 1);
						String xsession = getXsession.substring(1, getXsession.length() - 1);
						
						String ez_token=mapList.get("ez_token").toString().substring(1,mapList.get("ez_token").toString().length()-1);
						String hs_guid=mapList.get("hs_guid").toString().substring(1,mapList.get("hs_guid").toString().length()-1);
						String ez_guid=mapList.get("ez_guid").toString().substring(1,mapList.get("ez_guid").toString().length()-1);
						
						map.put("token", token);
						map.put("xsession", xsession);
						map.put("ez_token", ez_token);
						map.put("hs_guid", hs_guid);
						map.put("ez_guid", ez_guid);
						
						
						System.out.println("header:"+mapList.toString());
					}
				} else {
					map = GsonUtil.formJson("{\"status\":\"" + status + "\"}");
				}
			} else {

				map = GsonUtil.formJson("{\"status\":\"" + status + "\"}");
			}
			return map; // (JSONObject)sbf;

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return map;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return map;
		} finally {

			try {
				if (reader != null) {
					reader.close();
				}
				if (connection != null) {
					// 断开连接
					connection.disconnect();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	public static Map getMethed(HttpServletRequest request, String urlString, String method, String param) {
		
		BufferedReader reader = null;
		HttpURLConnection connection = null;
		String jsonString = null;
		Map map = null;

		// Get token from sessuion
		SessionUtil session = new SessionUtil();

		try {
			URL url = new URL(urlString);
			connection = (HttpURLConnection) url.openConnection();
			connection.setDoInput(true);
			connection.setDoOutput(true);
			connection.setRequestMethod(method);
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestProperty("Content-Type", "application/json");

			if (session.getSession(request, "users") != null) {
				String token = session.getSession(request, "users").get("token").toString();
				//String xsession = session.getSession(request, "users").get("xsession").toString();
				//String role=session.getSession(request, "users").get("role").toString();
				String acs_token = session.getSession(request, "users").get("ACS-Token").toString();
				String memberType = session.getSession(request, "users").get("Member_Type").toString();
				String hs_uid=session.getSession(request, "users").get("hs_uid").toString();
				String X_Token = session.getSession(request, "users").get("X-Token").toString();
//				String acs_member_id = session.getSession(request, "users").get("acs_member_id").toString();
				//connection.setRequestProperty("token", token);
				//connection.setRequestProperty("xsession", xsession);
				connection.setRequestProperty("token", token);
				connection.setRequestProperty("X-Token", X_Token);
				connection.setRequestProperty("ACS-Token", acs_token);
				connection.setRequestProperty("Member-Type", memberType);
				connection.setRequestProperty("ez_guid", "1C6401BD9FDAF76F6506CF97237AEE5E");
				connection.setRequestProperty("ez_token", "FF5E7FF26768A8C28A292D16FC97E662");
				connection.setRequestProperty("Authorization", "Basic "+X_Token);
				String uid;
			
				if(param.trim().length()>5){
				   uid=param;
				}else{
				   uid=hs_uid;
				}
				connection.setRequestProperty("hs_uid",uid);
				String id = session.getSession(request, "users").get("id").toString();

				System.err.println("member_id:" + id + "\n" +"url:" + urlString+"\n"+"hs_uid:"+uid+"\n"+"X-Token:"+X_Token+"\n"+"ACS-Token:"+acs_token+"\n"+"Member-Type:"+memberType);
			}else{
				connection.setRequestProperty("hs_uid",param);
			}
			
			connection.connect();
			String paramString;
			if (param.equals("")) {
				JsonObject obj = new JsonObject();
				paramString = obj.toString();
			} else {
				paramString = param;
			}
			int status = connection.getResponseCode();
						
			if (status < 400) {
				reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String lines;
				StringBuffer sbf = new StringBuffer();
				while ((lines = reader.readLine()) != null) {
					lines = new String(lines.getBytes(), "utf-8");
					sbf.append(lines);
				}
				Gson gson = new Gson();
				jsonString = sbf.toString();
				if (jsonString.trim().length() > 0) {
					map = GsonUtil.formJson(jsonString);
					map.put("status", status);
				} else {
					map = GsonUtil.formJson("{\"status\":\"" + status + "\"}");
				}
			} else {
				map = GsonUtil.formJson("{\"status\":\"" + status + "\"}");
			}
			return map; // (JSONObject)sbf;

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return map;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return map;
		} finally {

			try {
				if (reader != null) {
					reader.close();
				}
				if (connection != null) {
					// 断开连接
					connection.disconnect();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map DELETE(HttpServletRequest request, String urlString,String method, String param) {
		BufferedReader reader = null;
		HttpURLConnection connection = null;
		String jsonString = null;
		Map map = null;
		SessionUtil session=new SessionUtil();

		try {
			URL url = new URL(urlString);
			connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setRequestMethod(method);
			connection.setRequestProperty("Content-Type", "application/json");
			if(session.getSession(request, "users")!=null){
				connection.setRequestProperty("X-Token", session.getSession(request, "users").get("X-Token").toString());
				connection.setRequestProperty("Authorization", "Basic "+session.getSession(request, "users").get("X-Token").toString());
			}
			connection.connect();
			
			int status = connection.getResponseCode();
			System.out.println("connection status : " + status);
			if (status < 400) {
				reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String lines;
				StringBuffer sbf = new StringBuffer();
				while ((lines = reader.readLine()) != null) {
					lines = new String(lines.getBytes(), "utf-8");
					sbf.append(lines);
				}

				jsonString = sbf.toString();
				if("".equals(jsonString)){
					map=new HashMap<String, Object>();
					map.put("status", status);
				}
				else
				{
					map = GsonUtil.formJson(jsonString);
					map.put("status", status);
				}
			} else {
				map = GsonUtil.formJson("{\"status\":\"" + status + "\"}");
			}
			return map; // (JSONObject)sbf;

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return map;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return map;
		} finally {

			try {
				if (reader != null) {
					reader.close();
				}
				if (connection != null) {
					// 断开连接
					connection.disconnect();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
	
	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	public static Map getNoReferenceMethed(HttpServletRequest request, String urlString) {
		
		BufferedReader reader = null;
		HttpURLConnection connection = null;
		String jsonString = null;
		Map map = null;
		
		try {
			URL url = new URL(urlString);
			connection = (HttpURLConnection) url.openConnection();
			connection.setDoInput(true);
			connection.setDoOutput(true);
			connection.setRequestMethod("GET");
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestProperty("Content-Type", "application/json");
            
			System.err.println("url"+urlString);
			
			connection.connect();
			
			int status = connection.getResponseCode();
						
			if (status < 400) {
				reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String lines;
				StringBuffer sbf = new StringBuffer();
				while ((lines = reader.readLine()) != null) {
					lines = new String(lines.getBytes(), "utf-8");
					sbf.append(lines);
				}
				Gson gson = new Gson();
				jsonString = sbf.toString();
				if (jsonString.trim().length() > 0) {
					map = GsonUtil.formJson(jsonString);
					map.put("status", status);
				} else {
					map = GsonUtil.formJson("{\"status\":\"" + status + "\"}");
				}
			} else {
				map = GsonUtil.formJson("{\"status\":\"" + status + "\"}");
			}
			return map; // (JSONObject)sbf;

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return map;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return map;
		} finally {

			try {
				if (reader != null) {
					reader.close();
				}
				if (connection != null) {
					// 断开连接
					connection.disconnect();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
	
	/**
	 * 
	 * @param request
	 * @param urlString
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map getMethed(HttpServletRequest request,String urlString){
		   
		   HttpClient httpClient=HttpClients.createDefault();
		   HttpGet httpGet=new HttpGet(urlString);
		   httpGet.addHeader("X-AFC","HW1ONB");
		   SessionUtil session=new SessionUtil();
		   String x_session=session.getSession(request,"users").get("xsession").toString();
		   httpGet.addHeader("X-Session",x_session);
		   Map map=null;
		   HttpResponse httpResponse=null;
		   try {
				httpResponse = httpClient.execute(httpGet);
				HttpEntity entity = httpResponse.getEntity();
				if (null != entity) {
					 map=GsonUtil.formJson(EntityUtils.toString(entity));
					 map.put("status",httpResponse.getStatusLine().toString());
				}
			} catch (ClientProtocolException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		   return map;
	   }
	/**
	 * 
	 * @param request
	 * @param urlString
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map postMethed(HttpServletRequest request,String urlString, Map<String, String> params){
		   
		   HttpClient httpClient=HttpClients.createDefault();
		   HttpPost httpPost=new HttpPost(urlString);
		   httpPost.addHeader("X-AFC","HW1ONB");
		   SessionUtil session=new SessionUtil();
		   String x_session=session.getSession(request,"users").get("xsession").toString();
		   httpPost.addHeader("X-Session",x_session);
		   
		   List<NameValuePair> nvps = new ArrayList <NameValuePair>();  
	          
	        Set<String> keySet = params.keySet();  
	        for(String key : keySet) {  
	            nvps.add(new BasicNameValuePair(key, params.get(key)));  
	        }
		   
		   Map map=null;
		   HttpResponse httpResponse=null;
		   try {
			    //解析成一个entity对象
			    HttpEntity requestenEntity = new UrlEncodedFormEntity(nvps);
			    httpPost.setEntity(requestenEntity); 
			    
				httpResponse = httpClient.execute(httpPost);
				HttpEntity entity = httpResponse.getEntity();
				if (null != entity) {
					 map=GsonUtil.formJson(EntityUtils.toString(entity));
					 map.put("status",httpResponse.getStatusLine().toString());
				}
			} catch (ClientProtocolException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		   return map;
	   }
	/**
	 * 
	 * @param request
	 * @param urlString
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map putMethed(HttpServletRequest request,String urlString){
		   
		   HttpClient httpClient=HttpClients.createDefault();
		   HttpPut httpPut=new HttpPut(urlString);
		   httpPut.addHeader("X-AFC","HW1ONB");
		   SessionUtil session=new SessionUtil();
		   String x_session=session.getSession(request,"users").get("xsession").toString();
		   httpPut.addHeader("X-Session",x_session);
		   
		   Map map=null;
		   HttpResponse httpResponse=null;
		   try {
			    //解析成一个entity对象
			    HttpEntity requestenEntity = new UrlEncodedFormEntity(new ArrayList());
			    httpPut.setEntity(requestenEntity); 
			    
				httpResponse = httpClient.execute(httpPut);
				HttpEntity entity = httpResponse.getEntity();
				StatusLine statusLine = httpResponse.getStatusLine();
				int statusCode = statusLine.getStatusCode();
				if (null != entity) {
					 map=GsonUtil.formJson(EntityUtils.toString(entity));
					 map.put("status",httpResponse.getStatusLine().toString());
				}
				else if(statusCode==204)
				{
					 map=new HashMap<String, Object>();
					 map.put("status",httpResponse.getStatusLine().toString());
				}
			} catch (ClientProtocolException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		   return map;
	   }
	
}

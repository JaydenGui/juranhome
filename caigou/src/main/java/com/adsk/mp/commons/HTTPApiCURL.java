/*+++++++++++++++++++++++++++++++++++++++++++++
 * API request public class
 * ============================================
 * @author：zhigang。fang
 * ============================================
 * @date : 2016-05-10:17
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.commons;

import java.io.File;
import java.io.IOException;
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
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

public class HTTPApiCURL {
	/**
	 * Get request method
	 * @param request
	 * @param urlString 
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map getRequestMethed(HttpServletRequest request,String urlString){
		   
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
	 * @param params
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static Map postRequestMethed(HttpServletRequest request,String urlString, Map<String, String> params){
		   
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
	
	public static Map upload(String imagesPath,String uploadPath) {  
		
        HttpClient httpclient = HttpClients.createDefault();  
        Map map=null;
		HttpResponse httpResponse=null;
        try {  
            HttpPost httppost = new HttpPost(uploadPath);  
  
            FileBody bin = new FileBody(new File(imagesPath));  
            StringBody comment = new StringBody("A binary file of some kind", ContentType.TEXT_PLAIN);  
  
            HttpEntity reqEntity = MultipartEntityBuilder.create().addPart("bin", bin).addPart("comment", comment).build();  
  
            httppost.setEntity(reqEntity);  
  
            System.out.println("executing request " + httppost.getRequestLine());  
            CloseableHttpResponse response = httpclient.execute(httppost);  
            try {  
                System.out.println(response.getStatusLine());  
                HttpEntity resEntity = response.getEntity();  
                if (resEntity != null) {  
                    System.out.println("Response content length: " + resEntity.getContentLength());  
                }  
                EntityUtils.consume(resEntity);  
            } finally {  
                response.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }
    }  
}

package com.adsk.mp.commons;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.json.stream.JsonParser;
import javax.json.stream.JsonParserFactory;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;


public class AssetsDemo {
	
	public enum HttpVerb{  
		GET,POST,PUT,DELETE  
	}  
	
//	static class Assets{
//		String xsession;
//		public Assets(String xsession){
//			this.xsession = xsession;
//		}
//		public String getXsession() {
//			return xsession;
//		}
//
//		public void setXsession(String xsession) {
//			this.xsession = xsession;
//		}
//		
//	}
	
//	Assets a ;
	String CurrentSession ="6BF72CD7-CDBA-4A9B-8599-6318938F82A5";
	
	private static String StrHttpCreateAsset ="https://beta-api.acgcn.autodesk.com/api/v2/assets?asset_name=New_Project&description=CreateProjectSample&publish=true&media_type_id=53&tags=tags&software=96";
	private static String StrHttpServiceroot ="https://beta-api.acgcn.autodesk.com/api/v2/assets/";
	private static String StrHttpServicerootInquiry ="https://beta-api.acgcn.autodesk.com/api/v2/assets?";
	private static String X_AFC =PropUtil.getProperty("redirectUrl.properties").get("AFC").toString();
	

	
	//[Region] Http help
    
	public Response RequestHttpExecute(Request request) throws ClientProtocolException, IOException
	{
		String  str1=request.toString();    
		System.out.println(str1);
		return request.execute();
	}
	
	public Response SentHttpInqury(String url,HttpVerb Action) throws ClientProtocolException, IOException
	{
		/*Verb	Description
		GET	    Used to select one or more items. Success returns 200 status code with json result item(s) in body.
		POST	Used to create a new item. Success returns 201 status code with newly created json item in body.
		PUT	    Used to update an item. Success returns 200 status code with updated json item in body.
		DELETE	Used to delete an item. Success returns 204 status code with no body.*/
		
		 Response result = null;
		 switch(Action)  
		 {
		 case POST:
			 result = Request.Post(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
				.addHeader("X-AFC",X_AFC)
				.addHeader("X-Session", CurrentSession)
				.execute();
	     break;
	     
		 case GET:
			 result = Request.Get(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
				.addHeader("X-AFC",X_AFC)
				.addHeader("X-Session", CurrentSession)
				.execute();
	     break;
		 case PUT:
			 result = Request.Put(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
				.addHeader("X-AFC",X_AFC)
				.addHeader("X-Session", CurrentSession)
				.execute();
	     break;
		 case DELETE:
			 result = Request.Delete(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
				.addHeader("X-AFC",X_AFC)
				.addHeader("X-Session", CurrentSession)
				.execute();
	     break;
		 }
		 
		 
		 
		 return result;
	}
	
	public String HandleHttpResponse(String CaseName,Response result) throws ClientProtocolException, IOException
	{
		   
		HttpResponse ServiceReturn=result.returnResponse();
		StatusLine Status=ServiceReturn.getStatusLine();
		
		System.out.println("Test Case: "+CaseName);
		System.out.println("Response Code: "+ String.valueOf(Status.getStatusCode()) );
		
	    if (Status.getReasonPhrase().equals("No Content"))
	    {
	    	System.out.println("ReasonPhrase: No Content ");
	    	return null;
	    }
	    
	    System.out.println("Content Start:==================================");
	    byte[] bytes = EntityUtils.toByteArray(ServiceReturn.getEntity());
	    String ContentStr = new String(bytes);
	    
	    if (ContentStr.length()!=0)
	    {
	    	//Content content = result.returnContent();
			System.out.println("ContentStr : "+ContentStr);
			 
			
			JsonParserFactory factory = Json.createParserFactory(null);
			javax.json.stream.JsonParser parser = factory.createParser(new StringReader(ContentStr));
			jsonDataParser(parser);
	    }
		
		System.out.println("Content End:====================================");
		return ContentStr;
	}
    
	public void jsonDataParser(JsonParser parser)  {
        
        while (parser.hasNext()) {
          javax.json.stream.JsonParser.Event event = parser.next();
          switch (event) {
          case START_ARRAY:
          case END_ARRAY:
          case START_OBJECT:
          case END_OBJECT:
          case VALUE_FALSE:
          case VALUE_NULL:
          case VALUE_TRUE:
            System.out.println(event.toString());
            break;
          case KEY_NAME:
            //System.out.print(event.toString() + " " + parser.getString()+ " = ");
            System.out.print(parser.getString() + " " + " = ");
            break;
          case VALUE_STRING:
          case VALUE_NUMBER:
            System.out.println(" " + parser.getString());
            break;
          }
        }

     }
	
	public String Convert2HttpString(String str)
	{
		String out="";
		for(int i = 0; i< str.length(); i++)
        {
           char Caharater=str.charAt(i);
           
           if ((Caharater=='"') || (Caharater=='[')|| (Caharater==']')|| (Caharater=='{')|| (Caharater=='}')
        		   || (Caharater=='<')|| (Caharater=='>')|| (Caharater=='/') || (Caharater==' ') )
        	     out+=esc(Caharater);
           else
                 out+=Caharater;
        }

		return out;
	}
	//brace { }
	public String bra(String str)
	{
		return esc('{')+str+esc('}');
	}
	//square brackets  [ ]
	public String squ(String str)
	{
		return esc('[')+str+esc(']');
	}
	//quote ""
	public String quo(String str)
	{
		return esc('"')+str+esc('"');
	}
	//Escape (char)
    public String esc(char c)
	{   
		
		String str="";
	 
		String hex = Integer.toHexString(c & 0xFF); 
	    str= String.format("%2s",hex);
	
		return "%"+str.toUpperCase();
	}
  //[end]
    
public String DownloadFile(String file,String CurrentSession)throws ClientProtocolException, IOException {
        
        Long uploadId = 0L;
        String server = getDownloadServer();
        CloseableHttpResponse response = null;
        CloseableHttpClient httpClient = HttpClients.createDefault();
        String output = "";
        try {
        	
        	
    	    /*String url =StrHttpServiceroot+AssetId+"/"+Action;
    		
    	    Request request = Request.Delete(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
    				.addHeader("X-AFC",X_AFC)
    				.addHeader("X-Session", CurrentSession);
    		
    		Response result=RequestHttpExecute(request);
    		HandleHttpResponse("Delete an asset link",result);*/
    		
        	/*FileBody file = new FileBody(new File(FILE_NAME));
            String url = "http://" + server + "/api/v2/files/upload";
            
            HttpEntity reqEntity = MultipartEntityBuilder.create()
                    .addPart("file", file).addTextBody("format", "json").addTextBody("software","1001")
                    .build();*/
        	//GEThttps://api.acg.autodesk.com/api/v2/files/download?file_ids=1233233,1333233&asset_id=23244422
        	String url = "http://" + server + "/api/v2/files/download/path?file_ids="+file;
        	System.out.println("@@@@@@@@@@@@@@@@ url :　"+url);
            Request request = Request.Get(url)
            		
    				.addHeader("X-AFC",X_AFC)
    				.addHeader("X-Session", CurrentSession);
            
            
            Response result=RequestHttpExecute(request);
            output = HandleHttpResponse("uploadFile",result);
          
          
           

        } catch (Exception e) {
            e.printStackTrace();
        }
        return output;
    }
    
private static String getDownloadServer() {
    Client client = ClientBuilder.newClient();
    //javax.ws.rs.core.Response response = client.target("http://api.acg.autodesk.com/api/v2/server/upload").request().get();
    javax.ws.rs.core.Response response = client.target("https://beta-api.acgcn.autodesk.com/api/v2/server/download").request().get();
    String responseJson = response.readEntity(String.class);
    ObjectMapper jsonObjectMapper = new ObjectMapper();
    Map<String, String> map = null;
    try {
        map = jsonObjectMapper.readValue(responseJson, new TypeReference<Map<String, String>>() {});
    } catch (IOException e) {
        e.printStackTrace();
    }
    System.out.println("------------ map.toString : "+map.toString());
    return map.get("server");
}
    //[Region]  upload a File
  	
    public static final String FILE_NAME = "F:\\Data Work\\20160126\\juranhome_maven\\src\\main\\webapp\\images\\designer\\team-7.jpg";
    
    public String getFile_Name(String file){
    	return file;
    }
    
    public String uploadFile(String file_name,String CurrentSession)throws ClientProtocolException, IOException {
    	System.err.println("***** asset uploadFile *****");
    	System.err.println("CurrentSession : "+CurrentSession);
        Long uploadId = 0L;
        String server = getUploadDownloadServer();
        SystemUtil.sysStr("server", server);
        CloseableHttpResponse response = null;
        CloseableHttpClient httpClient = HttpClients.createDefault();
        String fileData = "";
        try {
        	
    	    /*String url =StrHttpServiceroot+AssetId+"/"+Action;
    		
    	    Request request = Request.Delete(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
    				.addHeader("X-AFC",X_AFC)
    				.addHeader("X-Session", CurrentSession);
    		
    		Response result=RequestHttpExecute(request);
    		HandleHttpResponse("Delete an asset link",result);*/
    		File file=new File(file_name);
        	//FileBody file = new FileBody(new File(file_name));
            String url = "http://" + server + "/api/v2/files/upload";
            
            HttpEntity reqEntity = MultipartEntityBuilder.create().addBinaryBody("file", file)//.addPart("file", file)
                    .addTextBody("format", "json").addTextBody("software","96").addTextBody("public", "true")
                    .build();
            
            Request request = Request.Post(url).body(reqEntity)
            		
    				.addHeader("X-AFC",X_AFC)
    				.addHeader("X-Session", CurrentSession);
            
            
            Response result=RequestHttpExecute(request);
            fileData = HandleHttpResponse("uploadFile",result);
          
          
           

        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileData;
    }
    public String uploadChatFile(String file_name,String path,String CurrentSession)throws ClientProtocolException, IOException {
    	System.err.println("***** asset uploadFile *****");
    	System.err.println("CurrentSession : "+CurrentSession);
        Long uploadId = 0L;
        String server = getUploadDownloadServer();
        SystemUtil.sysStr("server", server);
        CloseableHttpResponse response = null;
        CloseableHttpClient httpClient = HttpClients.createDefault();
        String fileData = "";
        try {
        	
    	    /*String url =StrHttpServiceroot+AssetId+"/"+Action;
    		
    	    Request request = Request.Delete(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
    				.addHeader("X-AFC",X_AFC)
    				.addHeader("X-Session", CurrentSession);
    		
    		Response result=RequestHttpExecute(request);
    		HandleHttpResponse("Delete an asset link",result);*/
    		File file=new File(file_name);
        	//FileBody file = new FileBody(new File(file_name));
            String url = "http://" + server + path;
            
            HttpEntity reqEntity = MultipartEntityBuilder.create().addBinaryBody("file", file)//.addPart("file", file)
                    .addTextBody("format", "json").addTextBody("software","96").addTextBody("public", "true")
                    .build();
            
            Request request = Request.Post(url).body(reqEntity)
            		
    				.addHeader("X-AFC",X_AFC)
    				.addHeader("X-Session", CurrentSession);
            
            
            Response result=RequestHttpExecute(request);
            fileData = HandleHttpResponse("uploadFile",result);
          
          
           

        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileData;
    }
    private static String getUploadDownloadServer() {
        Client client = ClientBuilder.newClient();
        //javax.ws.rs.core.Response response = client.target("http://api.acg.autodesk.com/api/v2/server/upload").request().get();
        javax.ws.rs.core.Response response = client.target("https://beta-api.acgcn.autodesk.com/api/v2/server/upload").request().get();
        String responseJson = response.readEntity(String.class);
        ObjectMapper jsonObjectMapper = new ObjectMapper();
        Map<String, String> map = null;
        try {
            map = jsonObjectMapper.readValue(responseJson, new TypeReference<Map<String, String>>() {});
        } catch (IOException e) {
            e.printStackTrace();
        }
        return map.get("server");
    }
    private static  void createImage(String filename) {
        int width = 1250;
        int height = 1250;

        // Constructs a BufferedImage of one of the predefined image types.
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        // Create a graphics which can be used to draw into the buffered image
        Graphics2D g2d = bufferedImage.createGraphics();

        // fill all the image with white
        g2d.setColor(Color.white);
        g2d.fillRect(0, 0, width, height);

        // create a circle with black
        g2d.setColor(Color.black);
        g2d.fillOval(0, 0, width, height);

        // create a string with yellow
        g2d.setColor(Color.yellow);
        g2d.drawString("Test File", 50, 120);

        // Disposes of this graphics context and releases any system resources that it is using.
        g2d.dispose();

        // Save as JPEG
        System.out.println("Assets filename : "+filename);
        File file = new File(filename);
        try {
            ImageIO.write(bufferedImage, "jpg", file);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
//    
//    //[end]

}
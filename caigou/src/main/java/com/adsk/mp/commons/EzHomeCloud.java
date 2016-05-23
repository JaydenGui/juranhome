package com.adsk.mp.commons;


import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;

import javax.json.Json;
import javax.json.stream.JsonGenerator;
import javax.json.stream.JsonParser;
import javax.json.stream.JsonParserFactory;

import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;
import org.apache.http.entity.ContentType;
import org.apache.http.util.EntityUtils;

public class EzHomeCloud {
	public enum HttpVerb{  
		GET,POST,PUT,DELETE  
	}  
	
	//static String CurrentSession ="C7203E23-937B-4420-9754-268C0691BBA1";
	static String CurrentSession ="0000-0000-0000-0000-0000";
	private static String StrHttpServiceroot ="http://192.168.2.222:6080/v1/api/";
	private static String X_AFC ="PA1ONB";
	 
		public void Retrieve_CaseList_By_DesignerId() throws ClientProtocolException, IOException
	    {  	
			String url =StrHttpServiceroot+"favorites/members/222/cases?offset=0&limit=10&sort_by=case_id&sort_order=desc";
			
		    Request request = Request.Get(url).addHeader("Accept", "application/json")
					.addHeader("X-AFC",X_AFC)
					.addHeader("token", CurrentSession);
		   
			
			Response result=RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread",result);
	    }
	 
		public void designerLogIn() throws ClientProtocolException, IOException
	    {  	
			String url =StrHttpServiceroot+"favorites/members/222/cases?offset=0&limit=10&sort_by=case_id&sort_order=desc";
			//http://192.168.2.222:6080/v1/api/members/login/designer 
			String Action="members";
			String SubString="/login/designer";
		    Request request = Request.Get(url).addHeader("Accept", "application/json")
					.addHeader("token", CurrentSession);
		   
		    //{"mobile_number":"13030060090","password":"123456789","login_type":"mobile"}
		    String Jsondata="";
			  StringWriter writer = new StringWriter();
			  String temp="";
			  JsonGenerator generator = Json.createGenerator(writer);
			  //generator.writeStartArray();
			    generator.writeStartObject();
			         
			        generator.write("mobile_number", "13030060090"); 
			        generator.write( "password", "123456789"); 
			        generator.write("login_type", "mobile"); 
			        
			        
			    generator.writeEnd();
			 
			  generator.flush();
			 
			 
		       
			  Jsondata=writer.toString();
			 // StringEntity entity = new StringEntity(writer.toString()); 
		
		    request.bodyString(Jsondata,ContentType.APPLICATION_JSON);
		    
		    
			Response result=RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread",result);
	    }
		public void Customer_Publish_Need(String name) throws ClientProtocolException, IOException
	    {  	
			String Action="needs";
			String url =StrHttpServiceroot+Action;
			//org.apache.http.client.fluent.Request 
		    Request request = Request.Post(url)
					.addHeader("token", CurrentSession);
            
		      String Jsondata="";
			  StringWriter writer = new StringWriter();
			  String temp="";
			  JsonGenerator generator = Json.createGenerator(writer);
			  //generator.writeStartArray();
			    generator.writeStartObject();
			         
			        generator.write("contacts_name", name); 
			        generator.write( "house_type", "新房"); 
			        generator.write("contacts_mobile", "13521452366"); 
			        generator.write("house_area", "90"); 
			        generator.write("renovation_budget", "30000"); 
			        generator.write("renovation_style", "田园"); 
			        generator.write("province", "北京"); 
			        generator.write("city", name); 
			        generator.write("district", "朝阳区"); 
			        generator.write("neighbourhoods", "天乐园"); 
			        generator.write("room", "1"); 
			        generator.write("living_room", "1"); 
			        generator.write("toilet", "1"); 
			        generator.write("img_url", "xxxx.jpg"); 
			        generator.write("img_name", "户型图");
			        
			    generator.writeEnd();
			 
			  generator.flush();
			 
			 
		       
			  Jsondata=writer.toString();
			 // StringEntity entity = new StringEntity(writer.toString()); 
		
		    request.bodyString(Jsondata,ContentType.APPLICATION_JSON);
		      
		    
		  
	        
			Response result=RequestHttpExecute(request);
			HandleHttpResponse("Customer_Publish_Need",result);
	    }
		
		public void Customer_Retrieve_Need() throws ClientProtocolException, IOException
	    {  	
			String Action="needs";
			String url =StrHttpServiceroot+Action+"?offset=10&limit=10";
			//org.apache.http.client.fluent.Request 
		    Request request = Request.Get(url)
					.addHeader("token", CurrentSession);
            
		     
			 
			 
		       
			
		      
		    
		  
	        
			Response result=RequestHttpExecute(request);
			HandleHttpResponse("Customer_Publish_Need",result);
	    }
		public void Customer_Publish_Notify() throws ClientProtocolException, IOException
	    {  	
			String Action="needs";
			String url =StrHttpServiceroot+Action;
			
		    Request request = Request.Put(url).addHeader("Accept", "application/json")
					.addHeader("X-AFC",X_AFC)
					.addHeader("token", CurrentSession);
		           
			
			Response result=RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread",result);
	    }
	
		
	
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
		
		public void HandleHttpResponse(String CaseName,Response result) throws ClientProtocolException, IOException
		{
			   
			HttpResponse ServiceReturn=result.returnResponse();
			StatusLine Status=ServiceReturn.getStatusLine();
			
			System.out.println("Test Case: "+CaseName);
			System.out.println("Response Code: "+ String.valueOf(Status.getStatusCode()) );
			
		    if (Status.getReasonPhrase().equals("No Content"))
		    {
		    	System.out.println("ReasonPhrase: No Content ");
		    	return;
		    }
		    
		    System.out.println("Content Start:==================================");
		    byte[] bytes = EntityUtils.toByteArray(ServiceReturn.getEntity());
		    String ContentStr = new String(bytes);
		    
		    if (ContentStr.length()!=0)
		    {
		    	//Content content = result.returnContent();
				System.out.println(ContentStr);
				 
				
				JsonParserFactory factory = Json.createParserFactory(null);
				javax.json.stream.JsonParser parser = factory.createParser(new StringReader(ContentStr));
				jsonDataParser(parser);
		    }
			
			System.out.println("Content End:====================================");
			
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

}

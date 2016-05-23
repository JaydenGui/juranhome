package com.adsk.mp.commons;


import java.io.IOException;
import java.io.StringReader;

import javax.json.Json;
import javax.json.stream.JsonParser;
import javax.json.stream.JsonParserFactory;

import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Response;
import org.apache.http.util.EntityUtils;

public class MessageDemo {
	public enum HttpVerb{  
		GET,POST,PUT,DELETE  
	}  
	
	static String CurrentSession ="6ECCAFA7-1038-4C2E-9026-5A8E00D9CF21";
	//20727892
	 
	private static String StrHttpServiceroot ="https://beta-api.acg.autodesk.com/api/v2/members/";
	private static String StrHttpServicerootInquiry ="https://beta-api.acg.autodesk.com/api/v2/members?";
	private static String X_AFC ="PA1ONB";
	
	//private static String StrHttpServiceroot ="https://alpha-api.acg.autodesk.com/api/v2/members/";
	//private static String StrHttpServicerootInquiry ="https://alpha-api.acg.autodesk.com/api/v2/members?";
	//private static String X_AFC ="PA1ONA";
	
	//Members / Private Messaging / Retrieve Member Thread Details
	//Retrieve asset references
		public void Retrieve_Member_Thread(String UserId) throws ClientProtocolException, IOException
	    {  	
			//20727892/threads
			 String Action="threads";
		    String url =StrHttpServiceroot+UserId+"/"+ Action;
				
			 
		    Request request = Request.Get(url).addHeader("Accept", "application/json")
					.addHeader("X-AFC",X_AFC)
					.addHeader("X-Session", CurrentSession);
		    //Request request = Request.Post(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
					//.addHeader("X-AFC",X_AFC)
					//.addHeader("X-Session", CurrentSession);
			
			Response result=RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread",result);
	    }
		
		//Members / Private Messaging / Retrieve Member Thread Details
		public void Retrieve_Member_Thread_Details(String UserId,String threadId) throws ClientProtocolException, IOException
	    {  	
			//https://api.acg.autodesk.com/api/v2/members/20727892/messages/TWTWLL9H411A68F
			//T5WEQ6KIHX6LOE8
			//20727892/threads
			String Action="threads";
		    String url =StrHttpServiceroot+UserId+"/"+ Action +"/"+ threadId;
				
			 
		    Request request = Request.Get(url).addHeader("Accept", "application/json")
					.addHeader("X-AFC",X_AFC)
					.addHeader("X-Session", CurrentSession);
		    //Request request = Request.Post(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
					//.addHeader("X-AFC",X_AFC)
					//.addHeader("X-Session", CurrentSession);
			
			Response result=RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread",result);
	    }
	
		//Members / Private Messaging / Retrieve Messages
		//{"count":1,"limit":20,"offset":0,"_link":"/members/20729514/messages/to9wirzijauuj88?limit=20&offset=0","messages":[{"subject":"messagesubject","body":"messagebody","thread_id":"TO9WIRZIJAUUJ88","sent_time":"January 12, 2016 03:44:53","profile_image":"http://static.spark.autodesk.com/Images/Member/default_avatar.png","sender_screen_id":20729514,"sender_screen_name":"yxw android","recipient_screen_id":20729514,"recipient_screen_name":"yxw android","profile_url":"http://beta.squidplatform.com/MyCorner/yxwandroid-20729514","message_id":"XQ3NMTDIJAD9OEC","read_time":"","recipient_box":"CHAT","sender_box":"CHAT","in_reply_to":"","message_media_type":"TEXT","sender_member_id":20729514,"recipient_member_id":20729514,"sender_profile_image":"http://static.spark.autodesk.com/Images/Member/default_avatar.png","recipient_profile_image":"http://static.spark.autodesk.com/Images/Member/default_avatar.png"}]}

		public void Retrieve_Member_Thread_Messages(String UserId,String threadId) throws ClientProtocolException, IOException
	    {  	
			//https://api.acg.autodesk.com/api/v2/members/20727892/messages/TWTWLL9H411A68F
			//T5WEQ6KIHX6LOE8
			//20727892/threads
			String Action="messages";
		    String url =StrHttpServiceroot+UserId+"/"+ Action +"/"+ threadId;
				
			 
		    Request request = Request.Get(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
					.addHeader("X-AFC",X_AFC)
					.addHeader("X-Session", CurrentSession);
		    //Request request = Request.Post(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
					//.addHeader("X-AFC",X_AFC)
					//.addHeader("X-Session", CurrentSession);
			
			Response result=RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread_Messages",result);
	    }
	
		//Members / Private Messaging / Retrieve Messages
		public void Retrieve_Member_Thread_Reply(String UserId,String threadId,String Msg) throws ClientProtocolException, IOException
	    {  	
			//POSThttps://api.acg.autodesk.com/api/v2/members/id/messages/reply
			//T5WEQ6KIHX6LOE8
			//20727892/threads
			String Type="messages";
			String Action="reply";
		    String url =StrHttpServiceroot+UserId+"/"+ Type +"/"+ Action +"?body="+Msg+"&thread_id="+threadId;
				
			 
		    Request request = Request.Post(url).addHeader("Accept", "application/json")
					.addHeader("X-AFC",X_AFC)
					.addHeader("X-Session", CurrentSession);
		    //Request request = Request.Post(url).addHeader("Content-Type", "application/x-www-form-urlencoded")
					//.addHeader("X-AFC",X_AFC)
					//.addHeader("X-Session", CurrentSession);
			
			Response result=RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread_Messages",result);
	    }
	    
	
		
		
		// Members
		///
		// Private Messaging
		///
		// Send Message    发送消息
		// https://beta-api.acg.autodesk.com/api/v2/members/20729514/messages?subject=messagesubject&body=messagebody&recipient_ids=20727892&mailbox=CHAT&app_Id=96 HTTP/1.1
		//{"thread_id":"TO9WIRZIJAUUJ88","_link":"/members/20729514/messages/TO9WIRZIJAUUJ88"}
		public void send_Message(String UserId)
					throws ClientProtocolException, IOException {
				// POSThttps://api.acg.autodesk.com/api/v2/members/id/messages/reply
				// T5WEQ6KIHX6LOE8
				// 20727892/threads
				String Type = "messages";
				String Action = "reply";
				String url = StrHttpServiceroot + UserId + "/" + Type + "?subject=" + "messagesubject" + "&body="+"messagebody"+"&recipient_ids="+"20727892"+"&mailbox=CHAT"+"&app_Id=96";

				Request request = Request.Post(url).addHeader("Accept", "application/json").addHeader("X-AFC", X_AFC)
						.addHeader("X-Session", CurrentSession);
				// Request request = Request.Post(url).addHeader("Content-Type",
				// "application/x-www-form-urlencoded")
				// .addHeader("X-AFC",X_AFC)
				// .addHeader("X-Session", CurrentSession);

				Response result = RequestHttpExecute(request);
				HandleHttpResponse("Retrieve_Member_Thread_Messages", result);
			}

		
		
//		// POSThttps://api.acg.autodesk.com/api/v2/members/id/messages/reply?body=reply body&message_id=XWTWLL9H411A68F&thread_id=TWTWLL9H411A68F&subject=reply subject
		//{"thread_id":"TO9WIRZIJAUUJ88","_link":"/members/20729514/messages/TO9WIRZIJAUUJ88"}
		/**
		 * POST https://beta-api.acg.autodesk.com/api/v2/members/20729514/messages/reply?body=%E5%86%85%E5%AE%B9%E4%BF%A1%E6%81%AF&thread_id=TO9WIRZIJAUUJ88 HTTP/1.1
Test Case: Retrieve_Member_Thread_Messages
Response Code: 201
Content Start:==================================
{"thread_id":"TO9WIRZIJAUUJ88","_link":"/members/20729514/messages/TO9WIRZIJAUUJ88"}
START_OBJECT
thread_id  =  TO9WIRZIJAUUJ88
_link  =  /members/20729514/messages/TO9WIRZIJAUUJ88
END_OBJECT
Content End:====================================

		 * @param UserId
		 * @throws ClientProtocolException
		 * @throws IOException
		 */
		public void reply_Message(String UserId)
				throws ClientProtocolException, IOException {
			// POSThttps://api.acg.autodesk.com/api/v2/members/id/messages/reply
			// T5WEQ6KIHX6LOE8
			// 20727892/threads
			String Type = "messages";
			String Action = "reply";
			//String url = StrHttpServiceroot + UserId + "/" + Type ++Action?subject=" + "messagesubject" + "&body="+"messagebody"+"&recipient_ids="+"20727892"+"&mailbox=CHAT"+"&app_Id=96";
		    String url =StrHttpServiceroot+UserId+"/"+ Type +"/"+ Action +"?body="+"内容信息"+"&thread_id="+"TY91QWLIJB24D5Q";
			
			Request request = Request.Post(url).addHeader("Accept", "application/json").addHeader("X-AFC", X_AFC)
					.addHeader("X-Session", CurrentSession);
			// Request request = Request.Post(url).addHeader("Content-Type",
			// "application/x-www-form-urlencoded")
			// .addHeader("X-AFC",X_AFC)
			// .addHeader("X-Session", CurrentSession);

			Response result = RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread_Messages", result);
		}

	
		
		/**
		 * PUThttps://api.acg.autodesk.com/api/v2/members/id/messages?action=read&message_id=XWTWLL9H411A68F&thread_id=TWTWLL9H411A68F&user_id=20280724
		 * PUT https://beta-api.acg.autodesk.com/api/v2/members/20729514/messages?action=read HTTP/1.1
		 */
		public void put_Message(String UserId)
				throws ClientProtocolException, IOException {
		
			String Type = "messages";
			String Action = "action";
			//String url = StrHttpServiceroot + UserId + "/" + Type ++Action?subject=" + "messagesubject" + "&body="+"messagebody"+"&recipient_ids="+"20727892"+"&mailbox=CHAT"+"&app_Id=96";
		    //String url =StrHttpServiceroot+UserId+"/"+ Type +"?"+ Action +"=read"+"&message_id="+"ce3494d6-4535-421b-8cdb-bd810dca5779"+"&thread_id="+"TY91QWLIJB24D5Q"+"&user_id="+"20729858";
			String url =StrHttpServiceroot+UserId+"/"+ Type +"?"+ Action +"=read";
			Request request = Request.Put(url).addHeader("Accept", "application/json").addHeader("X-AFC", X_AFC)
					.addHeader("X-Session", CurrentSession);
			// Request request = Request.Post(url).addHeader("Content-Type",
			// "application/x-www-form-urlencoded")
			// .addHeader("X-AFC",X_AFC)
			// .addHeader("X-Session", CurrentSession);

			Response result = RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread_Messages", result);
		}
		
		
		/**
		 * DELETEhttps://api.acg.autodesk.com/api/v2/members/id/messages?message_id=XWTWLL9H411A68F&thread_id=TWTWLL9H411A68F
		 * DELETE https://beta-api.acg.autodesk.com/api/v2/members/20729514/messages?thread_id=TWTWLL9H411A68F HTTP/1.1
		 */
		public void delete_Message(String UserId)
				throws ClientProtocolException, IOException {
		
			String Type = "messages";
			String Action = "action";
			String url =StrHttpServiceroot+UserId+"/"+ Type +"?"+"thread_id=TWTWLL9H411A68F"+"&message_id=ce3494d6-4535-421b-8cdb-bd810dca5779";
			Request request = Request.Delete(url).addHeader("Accept", "application/json").addHeader("X-AFC", X_AFC)
					.addHeader("X-Session", CurrentSession);
			// Request request = Request.Post(url).addHeader("Content-Type",
			// "application/x-www-form-urlencoded")
			// .addHeader("X-AFC",X_AFC)
			// .addHeader("X-Session", CurrentSession);

			Response result = RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread_Messages", result);
		}

		//Members/Private Messaging/Add recipients to a thread
		//POSThttps://api.acg.autodesk.com/api/v2/members/id/recipients?recipient_ids=20280723,1248514&thread_id=TWTWLL9H411A68F
		public void Add_recipients_to_thread(String UserId)
				throws ClientProtocolException, IOException {
		
			String Type = "recipients";
			String Action = "action";
			String url =StrHttpServiceroot+UserId+"/"+ Type +"?"+"recipient_ids=20728733"+"&thread_id=T5WEQ6KIHX6LOE8";
			Request request = Request.Post(url).addHeader("Accept", "application/json").addHeader("X-AFC", X_AFC)
					.addHeader("X-Session", CurrentSession);
			// Request request = Request.Post(url).addHeader("Content-Type",
			// "application/x-www-form-urlencoded")
			// .addHeader("X-AFC",X_AFC)
			// .addHeader("X-Session", CurrentSession);

			Response result = RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread_Messages", result);
		}
		

//Members
///
//Private Messaging
///
//Delete recipients to a thread
//DELETEhttps://api.acg.autodesk.com/api/v2/members/id/recipients?recipient_ids=20280723,1248514&thread_id=TWTWLL9H411A68F
//DELETE https://beta-api.acg.autodesk.com/api/v2/members/20729514/recipients?recipient_ids=20728733&thread_id=T5WEQ6KIHX6LOE8 HTTP/1.1
		public void Delete_recipients_to_thread(String UserId)
				throws ClientProtocolException, IOException {
		
			String Type = "recipients";
			String url =StrHttpServiceroot+UserId+"/"+ Type +"?"+"recipient_ids=20728733"+"&thread_id=T5WEQ6KIHX6LOE8";
			Request request = Request.Delete(url).addHeader("Accept", "application/json").addHeader("X-AFC", X_AFC)
					.addHeader("X-Session", CurrentSession);
			// Request request = Request.Post(url).addHeader("Content-Type",
			// "application/x-www-form-urlencoded")
			// .addHeader("X-AFC",X_AFC)
			// .addHeader("X-Session", CurrentSession);

			Response result = RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread_Messages", result);
		}
		
		
		
		
		//GEThttps://api.acg.autodesk.com/api/v2/members/id/threads?mailbox=CHAT&latest_message_info=true&sort_order=recent&offset=0&limit=20
		//Members/Private Messaging/Retrieve Member Threads
		public void Retrieve_Member_Threads(String UserId)
				throws ClientProtocolException, IOException {
		
			String Type = "threads";
			String url =StrHttpServiceroot+UserId+"/"+ Type +"?"+"&thread_id=T5WEQ6KIHX6LOE8";
			Request request = Request.Get(url).addHeader("Accept", "application/json").addHeader("X-AFC", X_AFC)
					.addHeader("X-Session", CurrentSession);
			// Request request = Request.Post(url).addHeader("Content-Type",
			// "application/x-www-form-urlencoded")
			// .addHeader("X-AFC",X_AFC)
			// .addHeader("X-Session", CurrentSession);

			Response result = RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread_Messages", result);
		}
		
		
		
		//https://api.acg.autodesk.com/api/v2/members/id/threads/thread_id
		//GET https://beta-api.acg.autodesk.com/api/v2/members/20729514/threads/T5WEQ6KIHX6LOE8 HTTP/1.1
		public void Retrieve_Member_Thread_Details(String UserId)
				throws ClientProtocolException, IOException {
		
			String Type = "threads";
			String url =StrHttpServiceroot+UserId+"/"+ Type +"/T5WEQ6KIHX6LOE8";
			Request request = Request.Get(url).addHeader("Accept", "application/json").addHeader("X-AFC", X_AFC)
					.addHeader("X-Session", CurrentSession);
			// Request request = Request.Post(url).addHeader("Content-Type",
			// "application/x-www-form-urlencoded")
			// .addHeader("X-AFC",X_AFC)
			// .addHeader("X-Session", CurrentSession);

			Response result = RequestHttpExecute(request);
			HandleHttpResponse("Retrieve_Member_Thread_Messages", result);
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

package com.adsk.mp.commons;

/**
 * Hello world!
 *
 */

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
 
public class App 
{
	
	
//	杨学武
//    6ECCAFA7-1038-4C2E-9026-5A8E00D9CF21
//	20729514
	
//
//    EEA40E75-4735-4BF9-8764-9EC8744DF804
//    20729858
	
	
/**
 *     "appId": "96",
        "args": "leedian yang,啾啾啾",
        "data": "XN5XM55IJAD9OGO,TY91QWLIJB24D5Q,Chat Subject,M0F8VQWIJAD9NS9,TEXT",
        "id": "ce3494d6-4535-421b-8cdb-bd810dca5779",
        "key": "MESSAGE_PRIVATE",
        "version": "v1"
 * @param args
 */
    public static void main( String[] args ) 
    {
    	AssetsDemo Asset=new AssetsDemo();
    	MessageDemo Message=new MessageDemo();
    	try {
//    		//Asset General===================================================================
//			//Asset.Create_Asset_Test();
//			//Asset.Retrieve_Asset_Test("1534661");
//			//Asset.Update_Asset_Test("4640269","DescriptionV4");
//			//Asset.Delete_Asset_Test("4629236");
//			
//			//Asset Versions===================================================================
//			//Asset.Create_AssetVersion_Test("4640543","2.0");
//			//Asset.Retrieve_AssetVersion_Test("4640269");
//			
//			//Asset Search=====================================================================
//			//Asset.Search_Assets_Test("1519154");//not work
//			
//			//Asset Custom Data=================================================================
//			//Asset.Asset_Custom_Data_Test("4629664","CustomKey","CustomData"); 
//			//Asset.Retrieve_Asset_custom_dataTest("4629664");
//			//Asset.Detete_Asset_custom_dataTest("4629664","CustomKey");
//			
//    		//Asset Previews=================================================================
//    		//Asset.Asset_Preview_Create_Test("1519154","17882642"); 
//    		//Asset.Retrieve_Assets_Previews_Test("1519154");
//    		//Asset Sources
//    		//Asset.Asset_New_Source_Test("4640269","93081543"); 
//    		    		
//    		//Asset Thumbnails 
//    		//Asset.Asset_New_Thumbnail_Test("1520367","17882642");
//			//Asset.Retrieve_Assets_Thumbnail_Test("1520367");
//			
//			
//			
//    		//Asset.Asset_New_Translations_Test("4640269","93081543");
//    		
//    		//Asset.Asset_New_Source_Test("1534661","17954685");
//    		//Asset.Retrieve_Assets_Source_Test("1534661"); 
//    		
//    		//Asset Reference=================================================================
//			//Asset.Asset_New_Reference_Test("4629664","4629665","4629666"); 
//			//Asset.Asset_Update_Reference_Test("4629664","4629665");
//			//Asset.Retrieve_Asset_references_Test("4629664");
//			//Asset.Detete_Asset_reference_data_Test("4629664","4629665","4629666");
//    		
//    		//Asset Referenced=================================================================
//    		//Asset.Retrieve_Asset_Referenced_Test("1534661");
//    		//Asset.Asset_New_Reference_Test("1534661","17954685","");
//			
//			//Asset Links=================================================================
//    		//  Asset.Asset_New_link_Test("4640269");
//    		//Asset.Retrieve_New_link_Test("4629664");
//    		//Asset.Detete_New_link_Test("4629664");
//    		
//    		
//    		//Asset Asset Permission Roles===================================================
//			//Asset.Asset_Create_member_permission_Test("4629664","22443609");
//			//Asset.Retrieve__member_permission_Test("4629664");
//			//Asset.Asset_Updatemember_permission_Test("4629664","22443609");
//			//Asset.Detete_member_permission_Test("4629664","22443609");
//			
//    		//Asset likes===================================================
//    		//Asset.Retrieve_total_like_Test("1519154");
//    		//Asset.Asset_Update_Likes_Asset_("1519154");
//    		
//    		//Comments===================================================================4
//    		//Asset.Asset_New_Comment_Test("1519154","enclosedcomment");
//    		//Asset.Retrieve_Asset_Comments_Test("1519154");
//    		
//    		
//    		//Asset Comments level========================================================
//    	    //Asset.Retrieve_Asset_Comments_level_Test("1519154");
//    		//Asset.Retrieve_Asset_Comments_level_replies_Test("1519154","CQYRQVEIGBQK1N0");
//    		
//    		
//    		//Status_Post=================================================================
//    		//Asset.Asset_New_Status_Post_Test("4629664");
//    		//Asset.Asset_Update_Status_Post_Test("4629664","490");
//    		//Asset.Retrieve_Asset_Status_Post_Test("4629664");
//    		//Asset.Detete_Asset_data_Status_Post_Test("4629664","490");
//    		
//    		// Asset Flag=================================================================
//    		//Asset.Asset_Flag_Test("1519154");
//    		//Asset.Asset_Feature_Test("1519154","true","96");//Ignore
//    		//Asset.Asset_Flag_Comment_Test("1519154","CQYRQVEIGBQK1N0","INAPPROPRIATE");
			String file = "F:\\LeedianWorkSpace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\juranhome\\filePath\\7_02011F3451350.jpg";
    		Asset.uploadFile(file,"FA00524C-9311-4ECB-AE57-BC3B5DB82499");
//    		Asset.DownloadFile("17958476","A25F6391-096B-478D-93AE-A483BCA29E91");
//    		//Asset.Asset_New_File_Conversations("1535821","17956450","TJBDX9IIJCGYZXF");
//    		//Asset.Asset_Retrieve_File_Conversations("1535821");
//    		//Message.Retrieve_Member_Thread("20727892");
//    
//    		//Message.Retrieve_Member_Thread_Details("20727892","T5WEQ6KIHX6LOE8");
//    		//Message.Retrieve_Member_Thread_Messages("20727892","T5WEQ6KIHX6LOE8");
//    		//Message.Retrieve_Member_Thread_Reply("20728734","T0NJZO3IHY7SWKV","20151209");
//    		
//    
//    		
//    		
//    		
//    		
//    		
//    		
//    		 //Message.send_Message("20729514");
//    	//Message.Retrieve_Member_Thread_Messages("20729514","TO9WIRZIJAUUJ88");
//    	 //Message.reply_Message("20729514");
//       // Message.put_Message("20729514");
//        //Message.delete_Message("20729514");
//        //Message.Add_recipients_to_thread("20729514");
//    		//Message.Delete_recipients_to_thread("20729514");
//    	//	Message.Retrieve_Member_Threads("20729514");
//    		//Message.Retrieve_Member_Thread_Details("20729514");
//    		//XTG3J3KIHWFJD98
////    		EzHomeTest();
//    		
//			
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }
//    
//    public static void EzHomeTest()  throws ClientProtocolException, IOException
//    {
//    	 
//    	EzHomeCloud EzHomeConn=new EzHomeCloud();
//    	try {
//    		//EzHomeConn.Retrieve_CaseList_By_DesignerId();
//    		//EzHomeConn.Customer_Publish_Need("TAIWAN");
//			EzHomeConn.Customer_Retrieve_Need();
//		} catch (ClientProtocolException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//    	
//    	
//    }
    
 
}







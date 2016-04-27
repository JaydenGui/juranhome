package com.adsk.mp.commons;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class MyFileUpload {
	private String filePath; //存放上传文件的目录  
	private String tempFilePath; //存放临时文件的目录  
	static class AssetUploadFileResponse {
		List files;
		String name;
		String md5sum;
		Long file_id;
		String public_url;

		public AssetUploadFileResponse(List files, String name, String md5sum, Long file_id, String public_url) {
			this.files = files;
			this.name = name;
			this.md5sum = md5sum;
			this.file_id = file_id;
			this.public_url = public_url;
		}

		List getFiles() {
			return files;
		}

		public void setFiles(List files) {
			this.files = files;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getMd5sum() {
			return md5sum;
		}

		public void setMd5sum(String md5sum) {
			this.md5sum = md5sum;
		}

		public Long getFile_id() {
			return file_id;
		}

		public void setFile_id(Long file_id) {
			this.file_id = file_id;
		}

		public String getPublic_url() {
			return public_url;
		}

		public void setPublic_url(String public_url) {
			this.public_url = public_url;
		}
	}
		static class AssetDownloadFileResponse {
			String download_url_secure;
			int validity;

			public AssetDownloadFileResponse(String download_url_secure, int validity) {
				this.download_url_secure = download_url_secure;
				this.validity = validity;
			}

			public String getDownload_url_secure() {
				return download_url_secure;
			}

			public void setDownload_url_secure(String download_url_secure) {
				this.download_url_secure = download_url_secure;
			}



			public int getValidity() {
				return validity;
			}

			public void setValidity(int validity) {
				this.validity = validity;
			}

		}

		public static Map AssetFileUploadResponse(String file) {
			Gson g = new Gson();
			AssetUploadFileResponse bean = g.fromJson(file, AssetUploadFileResponse.class);
			List list = (List) bean.getFiles();
			Map m = (Map) list.iterator().next();
			return m;
		}
	

	public static String AssetDownloadFileResponse(String fileId) {
		Gson g = new Gson();
		AssetDownloadFileResponse bean = g.fromJson(fileId, AssetDownloadFileResponse.class);
		return bean.getDownload_url_secure();
	}

	private void processFormField(FileItem item) {
		String name = item.getFieldName();
		String value = item.getString();
		System.out.println(name + ":" + value + "/r/n");
	}

	private String processUploadedFile(FileItem item) throws Exception {
		String filename = item.getName();
		int index = filename.lastIndexOf("//");
		filename = filename.substring(index + 1);
		long fileSize = item.getSize();
		System.out.println("filename ======> "+filename+" , fileSize : "+fileSize);
		if (filename.equals("") && fileSize == 0)
			return null;

		File uploadedFile = new File(filePath + File.separator + filename);
		item.write(uploadedFile);
		System.out.println(filename + " is saved.");
		System.out.println("The size of " + filename + " is " + fileSize + "/r/n");
		System.out.println(" uploadedFile :"+uploadedFile.toString());
		return uploadedFile.toString();
	}
	
	@SuppressWarnings("unchecked")
	public Map process(HttpServletRequest request , HttpServletResponse response)throws ServletException, IOException {
		System.out.println("***** enter process *****");
		init(request);
		Map map = new HashMap();
	    //向客户端发送响应正文  
	    try{  
	      //创建一个基于硬盘的FileItem工厂  
	      DiskFileItemFactory factory = new DiskFileItemFactory();  
	      //设置向硬盘写数据时所用的缓冲区的大小，此处为20K  
	      factory.setSizeThreshold(20*1024);   
	      //设置临时目录  
	      factory.setRepository(new File(tempFilePath));  
	  
	      //创建一个文件上传处理器  
	      ServletFileUpload upload = new ServletFileUpload(factory);  
	      //设置允许上传的文件的最大尺寸，此处为120M  
	      upload.setSizeMax(20*6*1024*1024);   
	      upload.setHeaderEncoding("UTF-8");
	      System.out.println("***** get upload.parseRequest(request) *****" + upload.toString().length());
	      System.out.println("***** get upload.parseRequest(request) *****" + upload);
	      boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	      System.out.println("isMultipart : "+isMultipart);
	      List /* FileItem */ items = upload.parseRequest(request);      
	      System.out.println("items : "+items.size());
	      Iterator iter = items.iterator();  
	      int i = 0;
	      String filePath = "";
	      String FileList = "";
	      String UpladFileList = "";
	      Map<String, FileItem> ImageItem = new HashMap();
	      System.out.println("UpladFileList--------------------------------> " + UpladFileList);
	      while (iter.hasNext()) {
	    	  System.out.println("-------------- not file data ------------------");
	        FileItem item = (FileItem) iter.next(); 
	        if(item.isFormField()) {  
	          //not write fileupload
	          processFormField(item); //处理普通的表单域  
	          String name = item.getFieldName();
	          String value = item.getString("UTF-8");
	          map.put(name, value);
	          if("fileList".equals(name))FileList = value;
	        }
	        else{
	        	System.out.println("-------------- is file data ------------------");
	        	//write fileupload
	        	String name = item.getName();
	        	String FileName = item.getFieldName();
	        	System.out.println("FileName --------------------------------> " + name);
	        	i++;
	        		ImageItem.put(name + "," + FileName, item);
	        }  
	      }

	      if(FileList.length() > 0)
	      {
	    	  int UploadCount = 0;
		      for(Map.Entry<String, FileItem> entry : ImageItem.entrySet())   
		      {
		    	  String[] FileInfo = entry.getKey().split(",");
		    	  String FileName = "," + FileInfo[0] + ",";
		    	  System.out.println("Process File ====================================> " + FileInfo[0]);
		    	  if(FileList.indexOf(FileName) > -1 && UploadCount <= 20)
		    	  {
		    		 UploadCount++;
			         filePath =  processUploadedFile(entry.getValue()); //处理上传文件
	
			         System.out.println("FilePath ====================================> " + "FilePath"+UploadCount);
			         map.put("FilePath"+UploadCount, filePath);
			         map.put("contentName"+UploadCount, FileInfo[0]);
		             System.out.println("Upload File ====================================> " + FileInfo[0]);
		    	  }
		    	  else
		    	  {
		    		  System.out.println("Passed File ====================================> " + FileInfo[0]);
		    	  }
		      }
	      }
	      else
	      {
	    	  if(ImageItem.entrySet().size() > 0)
	    	  {
		    	  //int UploadCount = 0;
		    	  for(Map.Entry<String, FileItem> entry : ImageItem.entrySet())
		    	  {
		    		  int FileOrder = 1;
				      System.out.println("Entry size ====================================> " + entry.getValue().getSize());
				      System.out.println("Entry value ====================================> " + entry.getValue());
				      System.out.println("Field Key ====================================> " + entry.getKey());
		    		  if(entry.getValue().getSize() > 0)
		    		  {
			    		  //UploadCount++;
			    		  filePath =  processUploadedFile(entry.getValue()); //处理上传文件
			    		  String fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
			    		  if(entry.getKey().indexOf("backimageurl") > -1)
			    		  {
			    			  FileOrder = 2;
			    		  }else if(entry.getKey().indexOf("handimageurl") > -1){
			    			  FileOrder = 3;
			    		  }
			    		  
					      System.out.println("FilePath ====================================> " + "FilePath"+FileOrder);
					      map.put("FilePath"+FileOrder, filePath);
					      map.put("contentName"+FileOrder, fileName);
		    		  }
		    	  }
	    	  }
	      }
	      
	    }catch(Exception e){  
	       throw new ServletException(e);  
	    }  
	    return map;
	}
	
	public Map processMulti(HttpServletRequest request , HttpServletResponse response)throws ServletException, IOException {
		System.out.println("***** enter process *****");
		init(request);

		HashMap<String, List<String>> map = new HashMap<String, List<String>>();
	    //向客户端发送响应正文  
		
	    try{  
	      //创建一个基于硬盘的FileItem工厂  
	      DiskFileItemFactory factory = new DiskFileItemFactory();  
	      //设置向硬盘写数据时所用的缓冲区的大小，此处为120K  
	      factory.setSizeThreshold(20*6*1024);   
	      //设置临时目录  
	      factory.setRepository(new File(tempFilePath));  
	  
	      //创建一个文件上传处理器  
	      ServletFileUpload upload = new ServletFileUpload(factory);  
	      //设置允许上传的文件的最大尺寸，此处为120M  
	      upload.setSizeMax(20*6*1024*1024);   
	      upload.setHeaderEncoding("UTF-8");

	      boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	      List /* FileItem */ items = upload.parseRequest(request);      
	      Iterator iter = items.iterator();  
	      String FileList = "";
	      String filePath = "";
	      int FileCount = 0;
	      while (iter.hasNext()) {  
	        FileItem item = (FileItem) iter.next(); 
	        if(item.isFormField()) {  
	          //not write fileupload
	          processFormField(item); //处理普通的表单域  
	          String name = item.getFieldName();
	          String value = item.getString("UTF-8");
	          List<String> values = new ArrayList<String>();
	          values.add(value);
	          
	          map.put(name, values);
	        }else{  
	        	//write fileupload
	        	String name = item.getFieldName();
		        filePath =  processUploadedFile(item); //处理上传文件
		        List<String> values = new ArrayList<String>();
		        
		        if(map.containsKey(name)) {
		        	values = map.get(name);
		        }
		        
	        	values.add(filePath);
	        	map.put(name, values);  
	        }  
	      }
	    }catch(Exception e){  
	       throw new ServletException(e);  
	    }  
	    return map;
	}
	
	public void init(HttpServletRequest request)throws ServletException {  
		    filePath=request.getSession().getServletContext().getRealPath("/filePath");  
		    tempFilePath=request.getSession().getServletContext().getRealPath("/tempFilePath"); 
		    File file = new File(filePath);
		    File temp = new File(tempFilePath);
	        if (!file.exists() && !file.isDirectory()) {
	            System.out.println(filePath+"目录不存在，需要创建");
	            //创建目录
	             file.mkdir();
	         }
	         if (!temp.exists() && !temp.isDirectory()) {
	            System.out.println(tempFilePath+"目录不存在，需要创建");
	            //创建目录
	            temp.mkdir();
	         }
		  }  
}

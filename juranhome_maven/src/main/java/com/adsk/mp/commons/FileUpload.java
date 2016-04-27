package com.adsk.mp.commons;

import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

public class FileUpload {

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

		static class AssetDownloadFileResponse{
			String url;
		    int validity;
			public AssetDownloadFileResponse(String url , int validity){
				this.url = url;
				this.validity = validity;
			}
			public String getUrl() {
				return url;
			}
			public void setUrl(String url) {
				this.url = url;
			}
			public int getValidity() {
				return validity;
			}
			public void setValidity(int validity) {
				this.validity = validity;
			}
			
		}
	public static Map AssetFileUploadResponse(String file){
		Gson g = new Gson();
		AssetUploadFileResponse bean = g.fromJson(file,AssetUploadFileResponse.class);
		List list = bean.files;
		Map m = (Map) list.iterator().next();
		return m;
	 }
	}
	public static Map AssetDownloadFileResponse(String fileId){
		return null;
	}
}

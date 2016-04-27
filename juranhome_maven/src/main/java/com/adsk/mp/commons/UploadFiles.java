package com.adsk.mp.commons;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
/**
 * 
 * @author tungwei
 * upload File data
 */
public class UploadFiles {
	
	private Map parameters;
	
	private Map<String, FileItem> fileItems;
	
	public UploadFiles(Map parameters, Map<String, FileItem> fileItems) {
		this.parameters = parameters;
		this.fileItems = fileItems;
	}

	public Map<String, FileItem> getFileItems() {
		return fileItems;
	}

	public void setFileItems(Map<String, FileItem> fileItems) {
		this.fileItems = fileItems;
	}

	public Map getParameters() {
		return parameters;
	}

	public void setParameters(Map parameters) {
		this.parameters = parameters;
	}
}

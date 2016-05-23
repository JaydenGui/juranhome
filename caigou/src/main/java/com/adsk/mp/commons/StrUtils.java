package com.adsk.mp.commons;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 
 * @author tungwei
 * String's util
 */
public class StrUtils {
	public static boolean isEmpty(String s) {
		return s == null || s.length() == 0;
	}
	
	public static boolean isNotEmpty(String s) {
		return !(s == null || s.length() == 0);
	}
	
	public static String trim(String s) {
		if(isEmpty(s))
			return "";
		return s.trim();
	}
	
	public static String right(String str, int len) {
		if(str.length() <= len)
			return str;
		return str.substring(str.length() - len);
	}
	
	public static String left(String str, int len) {
		if(str.length() <= len)
			return str;
		return str.substring(0, len);
	}
	
	public static String repeat(String str, int len) {
		StringBuffer sb = new StringBuffer();
		for(int i =0; i < len ; i++) {
			sb.append(str);
		}
		return sb.toString();
	}
	
	/**
	 * if input value v is "" or null, return default value
	 * @param v
	 * @param defaultValue
	 * @return
	 */
	public static String nvl(String v, String defaultValue) {
		return (isEmpty(v) ? defaultValue : v);
	}

	
	@SuppressWarnings("unchecked")
	public static Set<String> splitToSet(String delim, String value) {
		return new HashSet(Arrays.asList(value.split(delim)));
	}
	
	/**
	 * arys add delim = String
	 * @param delim
	 * @param arys
	 * @return
	 */
	public static String implode(String delim, String[] arys) {
		if(arys == null || arys.length == 0)
			return "";
		
		StringBuffer result = new StringBuffer();
		
		for(String x : arys) {
			if(result.length() != 0)
				result.append(delim);
			result.append(x);
		}
		
		return result.toString();
	}
	
	public static String implode(String delim, Set<String> arys) {
		if(arys == null || arys.size() == 0)
			return "";
		
		StringBuffer result = new StringBuffer();
		
		for(String x : arys) {
			if(result.length() != 0)
				result.append(delim);
			result.append(x);
		}
		
		return result.toString();
	}
	
	public static String implode(String delim, List<String> arys) {
		if(arys == null || arys.size() == 0)
			return "";
		
		StringBuffer result = new StringBuffer();
		
		for(String x : arys) {
			if(result.length() != 0)
				result.append(delim);
			result.append(x);
		}
		
		return result.toString();
	}
	
    /**
     * String copy, max length 4096 bytes
     */
    public static void copyStream( InputStream in, OutputStream out ) throws IOException {
        byte[] buf = new byte[4096];
        int len;
        while ( ( len = in.read( buf ) ) != -1 )
            out.write( buf, 0, len );
    }

    /**
     * String copy, max length 4096 bytes
     */
    public static void copyStream( Reader in, Writer out ) throws IOException {
        char[] buf = new char[4096];
        int len;
        while ( ( len = in.read( buf ) ) != -1 )
            out.write( buf, 0, len );
    }

    /**
     * String copy, max length 4096 bytes
     */
    public static void copyStream( InputStream in, Writer out ) throws IOException {

        byte[] buf1 = new byte[4096];
        char[] buf2 = new char[4096];
        int len, i;
        while ( ( len = in.read( buf1 ) ) != -1 ) {
            for ( i = 0; i < len; ++i )
                buf2[i] = (char) buf1[i];
            out.write( buf2, 0, len );
        }
    }

    /**
     * String copy, max length 4096 bytes
     */
    public static void copyStream( Reader in, OutputStream out ) throws IOException
    {
        char[] buf1 = new char[4096];
        byte[] buf2 = new byte[4096];
        int len, i;
        while ( ( len = in.read( buf1 ) ) != -1 ) {
            for ( i = 0; i < len; ++i )
                buf2[i] = (byte) buf1[i];
            out.write( buf2, 0, len );
        }
    }
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public static Map fileUploadSplit(String str){
    	System.out.println("***** fileUploadSplit ***** ");
    	System.out.println(" ---------split str before ------>"+str);
    	String sub_replace = str.substring(9).replace("[", "").replace("{", "").replace("}", "").replace("]", "").replace("'", "").replace("\"", "");
    	String[] list = sub_replace.split(",");
    	String[] name = list[0].split(":");
    	String[] md5 = list[1].split(":");
		String[] file_id = list[2].split(":");
		String[] public_url = list[3].split(":");
		System.err.println("public_url : "+public_url.toString());
		Map map = new HashMap();
		
		map.put("file_name", name[1].toString());
		map.put("file_id", file_id[1].toString());
		map.put("sumMd5", md5[1].toString());
		try{
			map.put("public_url", public_url[1].toString());
		}
		catch(Exception e){
//			map.put("file_name", "null");
//			map.put("file_id", "null");
//			map.put("sumMd5", "null");
			map.put("public_url", "null");

		}
    	return map;
    }
}

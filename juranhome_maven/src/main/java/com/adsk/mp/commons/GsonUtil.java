/**
 * 
 */
package com.adsk.mp.commons;

import java.lang.reflect.Type;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

/**
 * @author tungwei
 *
 */
public class GsonUtil {
	/**
	 * For parameterized object, can't use pojo
	 */
	public static <T> T formJson(String json)
	{
		Gson g = new Gson();
		try
		{
			Type t = new TypeToken<T>() {}.getType();
			return g.fromJson(json, t);
		}
		catch(Exception e)
		{
			
		}
		finally
		{
			g = null;
		}
		return null;
	}
	
	static class Greet
	{
		String name;
		String source;
		public Greet(String name,String source)
		{
			this.name = name;
			this.source = source;
		}
		public String getName()
		{
			return name;
		}
		public void setName(String name)
		{
			this.name = name;
		}
		public String getSource()
		{
			return source;
		}
		public void setSource(String source)
		{
			this.source = source;
		}
		
		public static void main(String[] args) {

			System.out.println("--------------------------------------------------------");
			JsonObject gson = new JsonObject();
			JsonArray gArray = new JsonArray();
			JsonParser jParser = new JsonParser();
			gson.addProperty("ck1", "1");
			gson.addProperty("ck2", "2");
			gson.addProperty("ck3", "3");
			gson.addProperty("ck1", "4");
			System.out.println("gson =========> "+gson);
			
//			StringBuffer sb = new StringBuffer();
//			String x = "[{\"key1\":0,\"key2\":0,\"key3\":\"http://sherpapreview-standard.s3.cn-north-1.amazonaws.com.cn/Preview/Public/Beta/17990418.jpg\"}]";
//			String re_x = x.replace("[", "").replace("]", "").replace("\\", "");
//			System.out.println("re_x ==> "+re_x);
//			Map map = GsonUtil.formJson(re_x);
//			String str = map.get("key1").toString();
//			System.out.println("str ==> "+str);
//			String n = "";
//			String nn = n.trim();
//			System.out.println("nn ===> "+nn);
			
			
//			for(int i=0; i<4; i++){
//				gson = new JsonObject();
//				gson.addProperty("key1", 1*i);
//				gson.addProperty("key2", 2*i);
//				gson.addProperty("key3", "http://sherpapreview-standard.s3.cn-north-1.amazonaws.com.cn/Preview/Public/Beta/17990418.jpg");
//				gArray.add(gson);
//				System.out.println("---------------------------------------------------");
//				System.out.println("gArray for ===> "+gArray);
////				gArray.add(gson);
//				String str_j = gson.toString();
//				sb.append(str_j);
//				sb.append(",");
//				sb.append(re);
//				System.out.println("StringBuffer () : "+sb);
//				String append = str_j.replace("\"", "")+","+re.replace("\"", "");
//				gArray.add(sb.toString());
//			}
//			System.out.println("gArray ------> "+gArray.toString());
//			int first = gArray.toString().indexOf("\"");
//			int last = gArray.toString().lastIndexOf("\"");
//			System.out.println("first => "+first+" , "+"last => "+last);
//			String subStr = (String) gArray.toString().substring(first+1, last);
//			System.out.println("subStr => "+subStr.replace("\\", ""));
//			gArray.add(subStr.replace("\\", ""));
//			System.out.println("gArray.add ----> "+gArray);
//			String str_gArray = gArray.toString().replace("\"", "");
////			gson.addProperty("img", gArray.toString().replace("\"", ""));
//			JsonParser jp = new JsonParser();
//			gson.add("img", jp.parse(gArray.toString()));
//			System.out.println("gson ----->"+gson.toString().replace("\\", ""));
			
//			String ss = "[{\"key1\":123,\"key2\":234,\"key3\":345}]";
//			String re_ss = ss.replace("[", "").replace("]", "");
//			String append_str = json.toJSONString()+","+json.parse(re_ss);
//			System.out.println("append_str ------> "+append_str);
////			System.out.println("json.parse --------> "+json.parse(append_str.toString()));
//			
//			jArray.add(append_str);
//			System.out.println("jArray ----------> "+jArray);
//			
//			
//			
//			String s = "{name:'GREETINGS',source:'guest'}";
//			Map<String,String> map = GsonUtil.formJson(s);
//			
//			Gson g = new Gson();
//			Greet o = g.fromJson(s, Greet.class);
//			System.out.println(o.getName());
		}
	}

}

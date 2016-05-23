/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *+ Encryption Tools 
 *+========================================================+
 *+@Author Fangzhigang
 *+========================================================+
 *+@Date 2015-12-18
 *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.commons;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

@SuppressWarnings("restriction")
public class EncryptionCoder {
	 public static final String KEY_SHA = "SHA";
	    public static final String KEY_MD5 = "MD5";
	 
	    /**
	     * MAC算法可选以下多种算法
	     * 
	     * <pre>
	     * HmacMD5  
	     * HmacSHA1  
	     * HmacSHA256  
	     * HmacSHA384  
	     * HmacSHA512
	     * </pre>
	     */
	    public static final String KEY_MAC = "HmacMD5";
	 
	    /**
	     * BASE64解密
	     * 
	     * @param key
	     * @return
	     * @throws Exception
	     */
	    public static byte[] decryptBASE64(String key) throws Exception {
	        return (new BASE64Decoder()).decodeBuffer(key);
	    }
	 
	    /**
	     * BASE64加密
	     * 
	     * @param key
	     * @return
	     * @throws Exception
	     */
	    public static String encryptBASE64(byte[] key) throws Exception {
	        return (new BASE64Encoder()).encodeBuffer(key);
	    }
	 
	    /**
	     * MD5加密
	     * 
	     * @param data
	     * @return
	     * @throws Exception
	     */
	    public static byte[] encryptMD5(byte[] data) throws Exception {
	 
	        MessageDigest md5 = MessageDigest.getInstance(KEY_MD5);
	        md5.update(data);
	 
	        return md5.digest();
	 
	    }
	    /**  
	     * 用MD5算法进行加密  
	     * @param str 需要加密的字符串  
	     * @return MD5加密后的结果  
	     */    
	    public static String encodeMD5String(String str) {    
	        return encode(str, "MD5");    
	    }   
	    
	    
	    private static String encode(String str, String method) {    
	        MessageDigest md = null;    
	        String dstr = null;    
	        try {    
	            md = MessageDigest.getInstance(method);
	            md.update(str.getBytes());    
	            dstr = new BigInteger(1, md.digest()).toString(16);    
	        } catch (NoSuchAlgorithmException e) {    
	            e.printStackTrace();    
	        }    
	        return dstr;    
	    }    
	 
	    /**
	     * SHA加密
	     * 
	     * @param data
	     * @return
	     * @throws Exception
	     */
	    public static byte[] encryptSHA(byte[] data) throws Exception {
	 
	        MessageDigest sha = MessageDigest.getInstance(KEY_SHA);
	        sha.update(data);
	 
	        return sha.digest();
	 
	    }
	 
	    /**
	     * 初始化HMAC密钥
	     * 
	     * @return
	     * @throws Exception
	     */
	    public static String initMacKey() throws Exception {
	        KeyGenerator keyGenerator = KeyGenerator.getInstance(KEY_MAC);
	 
	        SecretKey secretKey = keyGenerator.generateKey();
	        return encryptBASE64(secretKey.getEncoded());
	    }
	 
	    /**
	     * HMAC加密
	     * 
	     * @param data
	     * @param key
	     * @return
	     * @throws Exception
	     */
	    public static byte[] encryptHMAC(byte[] data, String key) throws Exception {
	 
	        SecretKey secretKey = new SecretKeySpec(decryptBASE64(key), KEY_MAC);
	        Mac mac = Mac.getInstance(secretKey.getAlgorithm());
	        mac.init(secretKey);
	        return mac.doFinal(data);
	    }
	 
	    /**
	     * @Title: encryptionRules
	     * @Description: TODO(加密规则)
	     * @param password
	     * @return
	     * @return String
	     */
	    public static String encryptionRules(String password) {
	        String result = null;
	        try {
	            //编写加密规则
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return result;
	    }
	    
	    /**
	     * base64 加密字符串
	     * @param str
	     * @return
	     */
	    public static String encryptBASE64(String str) {  
	        byte[] b = null;  
	        String s = null;  
	        try {  
	            b = str.getBytes("utf-8");  
	        } catch (UnsupportedEncodingException e) {  
	            e.printStackTrace();  
	        }  
	        if (b != null) {  
	            s = new BASE64Encoder().encode(b);  
	        }  
	        return s;  
	    }  
	  
	    /**
	     * base64 解密字符串
	     * @param str
	     * @return
	     */
	    public static String decrypTBASE64(String str) {  
	        byte[] b = null;  
	        String result = null;  
	        if (str != null) {  
	            BASE64Decoder decoder = new BASE64Decoder();  
	            try {  
	                b = decoder.decodeBuffer(str);  
	                result = new String(b, "utf-8");  
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }  
	        return result;  
	    } 
	    
	    /**
	     * 替换字符串
	     * @param jsonString
	     * @return
	     */
	    public static String encodeJson(String jsonString) {
			return jsonString.replace("&", esc('@')).replace("{", esc('{')).replace("}", esc('}')).replace("[", esc('[')).replace("]", esc(']'))
					.replace("\"", esc('"')).replace("=", esc('=')).replace("?", esc('?')).replace("/", esc('/'));
		}
	    
	    /**
	     * 
	     * @param c
	     * @return
	     */
	    public static String esc(char c) {
			String hex = Integer.toHexString(c & 0xFF);
			String hexString = String.format("%2s", hex);

			return "%" + hexString.toUpperCase();
		}
}

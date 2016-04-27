package com.adsk.mp.commons;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class ValidatorUtils {
	

	/**
	* 验证输入密码条件(字符与数据同时出现)
	* Verify input password conditions(characters and data appear simultaneously)
	* 
	* @param 待验证的字符串       String to be verified
	* @return 如果是符合格式的字符串,返回 true否则为false  
	* 			if it is in lline with the format of the string,return to false otherwise true
	*/
	public static boolean IsPassword(String str) {
	String regex = "^[A-Za-z0-9]+$";
	return match(regex, str);
	}

	/**
	* 验证输入密码长度 (6-12位)   Verify input password length (6-12 bit)
	* 
	* @param 待验证的字符串          String to be verified
	* @return 如果是符合格式的字符串,返回true ,否则为 false 
	* If it is in line with the format of the string, return to true, otherwise false
	*/
	public static boolean IsPasswLength(String str) {
	String regex = "^.{6,12}$";
	return match(regex, str);
	}

	

	/**
	* 验证输入手机号码       Verify input phone number
	* 
	* @param 待验证的字符串         String to be verified
	* @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	* If it is in line with the format of the string, return to true, otherwise false
	*/
	public static boolean IsPhone(String str) {
	String regex = "^((13[0-9])|(15[^4,\\D])|(18[^1^4,\\D]))\\d{8}";
	return match(regex, str);
	}

	
	/**
	* 验证验证输入用户名长度           Verify the input user name length
	* 
	* @param 待验证的字符串         String to be verified
	* @return 如果是符合格式的字符串,返回 <b>true </b>,否则为 <b>false </b>
	* If it is in line with the format of the string, return to true, otherwise false
	*/
	public static boolean IsLength(String str) {
	String regex = "^.{4,12}$";
	return match(regex, str);
	}

	/**
	* @param regex
	* 正则表达式字符串           Regular expression string
	* @param str
	* 要匹配的字符串              String to match
	* @return 如果str 符合 regex的正则表达式格式,返回true, 否则返回 false;
	* If STR conforms to the regex regular expression format, returns true, otherwise returns false
	*/
	private static boolean match(String regex, String str) {
	Pattern pattern = Pattern.compile(regex);
	Matcher matcher = pattern.matcher(str);
	return matcher.matches();
	}
}

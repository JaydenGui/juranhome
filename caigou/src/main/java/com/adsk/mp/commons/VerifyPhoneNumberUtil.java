package com.adsk.mp.commons;

import java.util.Random;

public class VerifyPhoneNumberUtil {
	public static String getNum(){
		StringBuffer captcha=new StringBuffer();
		for (int i=0;i<6;i++) {
			Random random=new Random();
			String value=String.valueOf(random.nextInt(10));
			captcha.append(value);
		} 
		return captcha.toString();
	}
}

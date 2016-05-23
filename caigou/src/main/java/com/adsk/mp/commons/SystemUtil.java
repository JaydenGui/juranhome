package com.adsk.mp.commons;

public class SystemUtil {
	/**
	 * 打印字符串
	 * @param name
	 * @param str
	 */
	public static void sysStr(String name,String str){
		System.out.println(name+":"+str);
	}
	/**
	 * 打印字int
	 * @param name
	 * @param str
	 */
	public static void sysInt(String name,int a){
		System.out.println(name+":"+a);
	}
	/**
	 * 打印对象
	 * @param name
	 * @param str
	 */
	public static void sysObj(String name,Object obj){
		System.out.println(name+":"+obj);
	}
	/**
	 * 循环输出数组
	 * @param name
	 * @param str
	 */
	public static void sysObj(String name,String[] arr){
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
	}
}	

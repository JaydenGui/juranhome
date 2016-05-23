package com.adsk.mp.commons;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Properties;

public class PropUtil 
{
	static InputStream input = null;
	
	/**
	 * Please put your property file in resources directory. 
	 * @param fileName       property file name
	 * @return               Properties
	 * @throws IOException
	 */
	public static Properties getProperty(String fileName)
	{
		Properties prop = new Properties();
		ClassLoader loader = Thread.currentThread().getContextClassLoader();
		try
		{
			input = null;
			input = loader.getResourceAsStream(fileName);					
			prop.load(input);		
			input.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return prop;			
	}
		
	public static Properties loadProperties(String arg)
	{
		Properties prop = null;
		try
		{
			prop = new Properties();
			//first load default properties
			input = PropUtil.class.getClassLoader().getResourceAsStream(arg);
			if (input != null)
			{
				prop.load(input);
				input.close();			
				prop.list(System.out);							
			}
			
			//check jvm's  properties
			String jvmArg = System.getProperty(arg);
			if (jvmArg!=null && !jvmArg.isEmpty())
			{
				input = new FileInputStream(jvmArg);
				if (input != null)
				{
					prop.load(input);
					input.close();
					prop.list(System.out);					
				}
			}
			
			//check command;s properties
			if (arg!=null && ! arg.isEmpty())
			{
				input = new FileInputStream(arg);
				if (input != null)
				{
					prop.load(input);
					input.close();
					prop.list(System.out);					
				}				
			}
			
			return prop;
		}
		catch(Exception e)
		{
			//e.printStackTrace();
		}
		
		return prop;
	}//loadProperties
	
	
	public static void main(String [] args)
	{
		PropUtil.loadProperties("redirectUrl.properties");
		
		Properties p = getProperty("redirectUrl.properties");
		Enumeration e = p.propertyNames();

	    while (e.hasMoreElements()) 
	    {
	    	String key = (String) e.nextElement();
	    	System.out.println(key + " -- " + p.getProperty(key));
	    }
		
	}
	
}

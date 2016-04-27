package com.adsk.mp.commons;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.DailyRollingFileAppender;
import org.apache.log4j.Level;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.log4j.PatternLayout;
import org.apache.log4j.PropertyConfigurator;

public class Log4jUtil 
{
	private final static Logger log = Logger.getLogger(Log4jUtil.class.getName());
	
	//動態 增加額外的log
	//log.addAppender(new RollingFileAppender(new PatternLayout(),"log.txt"));

	//動能 log4j log name
	//Log4jUtil.updateLog4jFileName(this, "log4j.appender.DR.File", "006");

	
	//log4j.appender.FILE.file, logFile 
	/**
	 * <pre>
	 * Change log4j log file name at runtime.
	 * 會影響全部的使用者
	 * sample:
	 *   Log4jUtil.updateLog4jFileName(this, "log4j.appender.DR.File", "006");
	 * </pre>
	 * @param obj
	 * @param appenderFileName
	 * @param logFileName
	 */
	public static void updateLog4jFileName(Object obj, String appenderFileName, String logFileName) 
	{ 
	    Properties props = new Properties(); 
	    try 
	    { 
	        InputStream configStream = obj.getClass().getResourceAsStream( "/log4j.properties"); 
	        props.load(configStream); 
	        configStream.close(); 
	    } 
	    catch (IOException e) 
	    { 
	        System.out.println("Errornot laod configuration file "); 
	    } 
	    props.setProperty(appenderFileName, logFileName); 
	    LogManager.resetConfiguration(); 
	    PropertyConfigurator.configure(props); 
	 }
	
	public static Logger getDailyLogger(String logName, String level)
	{
		Logger log = Logger.getLogger(logName);
		DailyRollingFileAppender a = (DailyRollingFileAppender) log.getAppender(logName);
		if (a != null)
		{
			System.out.println("Appender already exist");
			return log;
		}		
		DailyRollingFileAppender appender= new DailyRollingFileAppender();
		appender.setName(logName);
		
		appender.setFile(logName + ".log");
		PatternLayout p = new PatternLayout();
		p.setConversionPattern("%-d{yyyy-MM-dd HH:mm:ss}-%m%n");
		appender.setLayout(p);
		appender.setDatePattern(".yyyy-MM-dd");		
		appender.activateOptions(); 
		log.addAppender(appender);
		if (level.equalsIgnoreCase("debug"))
		{
			log.setLevel(Level.DEBUG);			
		}
		else if (level.equalsIgnoreCase("info"))
		{
			log.setLevel(Level.INFO);						
		}
		else if (level.equalsIgnoreCase("error"))
		{
			log.setLevel(Level.ERROR);						
		}
		else
		{
			log.setLevel(Level.ALL);												
		}
		return log;
	}
	
	public static void main(String [] args)
	{
		Log4jUtil u = new Log4jUtil();
		updateLog4jFileName(u, "log4j.appender.DR.File", "006--");
		
		log.debug("test");
		log.debug("test");
		
	}
	
}

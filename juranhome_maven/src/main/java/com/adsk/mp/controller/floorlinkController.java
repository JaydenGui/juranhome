package com.adsk.mp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/floorlink")
public class floorlinkController {
	/**
	 * About Us
	 * @return
	 */
	@RequestMapping(value="/aboutus/")
     public String aboutus(){
    	 return "template/floorlink/aboutus";
     }
	
	/**
	 * friendly link
	 * @return
	 */
	@RequestMapping(value="/friendlink/")
    public String friendlink(){
   	 return "template/floorlink/friendlink";
    }
	
	/**
	 * help center
	 * @return
	 */
	@RequestMapping(value="/helpcenter/")
    public String helpcenter(){
   	 return "template/floorlink/helpcenter";
    }
    
	/**
	 * cooperative partner
	 * @return
	 */
	@RequestMapping(value="/partners/")
    public String  partners(){
	   	 return "template/floorlink/partners";
    }
}

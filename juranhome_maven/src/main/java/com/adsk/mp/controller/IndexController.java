/*++++++++++++++++++++++++++++++++++++++++++++
 * index Controller
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2015-11-27
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.adsk.mp.commons.SessionUtil;

@Controller
public class IndexController{
	
   @RequestMapping("/")
   public String index() {
	  return "/template/index/index";
   }
   @RequestMapping("/do")
   public String secondIndex(HttpServletRequest request,HttpServletResponse response) {
	   SessionUtil session=new SessionUtil();
	   session.delSession(request, "users");
	   return "/template/index/index";
   }
   /**
    * 3D rotation motion
    * @return
    */
   
   
   @RequestMapping("/index3d")
   public String index3d() {
	   return "/template/index/3d";
	   
   }
   /**
    * Huge amounts of cases
    * @return
    */
   @RequestMapping("/caselibrary")
   public String caselibrary() {
	   return "/template/index/caselibrary";
	   
   }
   /**
    * chat tools
    * @return
    */
   @RequestMapping("/appright")
   public String appright() {
	   return "/template/index/appright";
	   
   }
 /**
  * 3d design of cloud
  * @return
  */
   @RequestMapping("/hsright")
   public String hsright() {
	   return "/template/index/hsright";
	   
   }
   /**
    * hs
    * @return
    */
     @RequestMapping("/hs")
     public String hs() {
  	   return "/template/index/hs";
     }
     /**
      * mobile
      * @return
      */
       @RequestMapping("/mobile")
       public String mobile() {
    	   return "/template/index/mobile";
       }
       
       /**
        * Browser compatibility page 
        * @return
        */
         @RequestMapping("/home")
         public String home() {
      	   return "/template/index/home";
         }
}

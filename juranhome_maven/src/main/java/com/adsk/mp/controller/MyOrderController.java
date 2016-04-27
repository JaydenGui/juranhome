/*+++++++++++++++++++++++++++++++++++++++++++++
 *my orders 
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2016-01-05
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.json.Json;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.core.annotation.SynthesizedAnnotation;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.GsonUtil;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.SessionUtil;
import com.adsk.mp.commons.SystemUtil;
import com.google.gson.JsonObject;

import freemarker.core.ReturnInstruction.Return;


@Controller
@RequestMapping(value="/myOrder")
public class MyOrderController {
	 SessionUtil session=new SessionUtil();
	 private Logger logger = Logger.getLogger(getClass());
   /**
    * Home improvement order list 
    * @return
    */
   @RequestMapping(value="/myorder")
   public String myOrderList(HttpServletRequest request){
	   
	   return "template/userCenter/customerOrderlist";
   }
   
   @RequestMapping(value="/orderList")
   public String OrderList(HttpServletRequest request){
	   return "template/userCenter/designerOrderlist";
   }
   
   /**
    * Home improvement order details
    * @return
    */
   @RequestMapping(value="/orderDetail")
   public String orderDetail(HttpServletRequest request){
	  
	   String  userType=session.getSession(request, "users").get("type").toString();
		  if(userType.equals("member")){
			  return "template/userCenter/orderDetail";
		  }else{
			  return "template/userCenter/myBidDetail";
		  }
   }
   
   /**
    * Return to the list template 
    * @return
    */
   @RequestMapping(value="/targets")
   public String targets(){
	   return "";
   } 
   
   /**
    * Should return the list page
    * @return
    */
   @RequestMapping(value="/mybidlist")
   public String mybidlist(){
	   return "template/userCenter/mybidlist";
   }
   
   /**
    * Should return the list page
    * @return
    */
   @RequestMapping(value="/mybidDetail")
   public String mybidDetail(){
	   return "template/userCenter/myBidDetail";
   }
   
   /**
    *  return the beishuOrder list page
    * @return
    */
   @RequestMapping(value="/beishuOreder")
   public String beishuOrder(){
	   return "template/userCenter/beishuOrder";
   }
   
   /**
	 * Release requirements 
	 * @return
	 */
	@RequestMapping(value="addNeeds")
	public String  careatCase(){
		return "template/userCenter/addNeeds";
	}
   
   /**
    * Get my next order data 
    * @return json
    */
   @SuppressWarnings("rawtypes")
   @RequestMapping(value="myNeedsList",method=RequestMethod.POST)
   @ResponseBody
   public Map myOrdersList(HttpServletRequest request) {
	   String statuS=request.getParameter("status");
	   String status="ezhome/fullflow/audit/*";
	   
	   if(statuS.equals("success")){
		   status="ezhome/fullflow/audit/success";
	   }
	   SessionUtil session=new SessionUtil();
	   String memberId=session.getSession(request, "users").get("id").toString();
		int page =Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page=1;
		}
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<0){
			pageSize=Api.PAGESIZE;
		}
	  Map map= HTTPApiCURL.getMethed(request,Api.GETMEMBERNEEDS(memberId,status,page,pageSize), "GET","");
	  System.out.println("map.toString() : "+map.toString());
	  return map;
   }
   
   /**
    * Details of orders to obtain orders based on orders of ID
    * @return
    */
   @SuppressWarnings({ "rawtypes" })
   @RequestMapping(value="/myOrderDetail",method=RequestMethod.POST)
   @ResponseBody
   public Map  myOrderDetailDesigner(HttpServletRequest request){
	   String orderid=request.getParameter("id");
	   //String  status=request.getParameter("status"); 
	   Map map=HTTPApiCURL.ApiCURL(request,Api.NEEDDATILE(orderid,0,0),"GET", "");
	   System.out.println("map.toString() : "+map.toString());
	   return map;
   }
   
   /**
    * List of all the decoration needs of consumers
    * @param request
    * @return
    */
   @SuppressWarnings("rawtypes")
   @RequestMapping(value="/getMemberNeeds",method=RequestMethod.POST)
   @ResponseBody
   public Map  getMemberNeeds(HttpServletRequest request){
	   JsonObject param=new JsonObject();
	   String memberId = request.getParameter("memberId");
	   String status="ezhome/fullflow/audit/*";
	   Map map=HTTPApiCURL.ApiCURL(request,Api.GETMEMBERNEEDS(memberId,status,0,0),"GET", param.toString());
	   System.out.println("map.toString() :"+map.toString());
	   return map;
   }
   
   /**
    * Consumers view for own needs to list should be the target should be the designer 
    * @param request
    * @return
    */
   
   @SuppressWarnings("rawtypes")
   @RequestMapping(value="/orderDetailDesignerList",method=RequestMethod.POST)
   @ResponseBody
   public Map  orderDetailDesignerList(HttpServletRequest request){
	   
	   String needs_id=request.getParameter("needs_id");
	   Map map=HTTPApiCURL.getMethed(request,Api.HOMEORDERDETAIL(needs_id),"GET","");
	   
	   System.out.println(map.values());
	   
	   return map;
   }
   
   
   @SuppressWarnings({ "rawtypes", "unchecked" })
   @RequestMapping(value="/getMemberDemandList",method=RequestMethod.POST)
   @ResponseBody
   public Map getMemberDemandList(HttpServletRequest request){
	   
	   System.out.println("***** MyOrderController method getMemberDemandList *****");
	   String needs_id = request.getParameter("needs_id");
	   Map member = HTTPApiCURL.getMethed(request, Api.MEMBERS(), "GET", "");	
	   Map deMandDetail = HTTPApiCURL.getMethed(request, Api.NEEDS(needs_id), "GET", "");
	   deMandDetail.put("nickName", member.get("nickName"));
	   System.out.println("deMandDetail.toString() : "+deMandDetail.toString());
	   return deMandDetail;
   }
   

   
   /**
    * Rejection Designer
    * @param request
    * @return
    */
   @RequestMapping(value="/deleteOrder")
   @ResponseBody
   @SuppressWarnings("rawtypes")
   public Map  deleteOrder(HttpServletRequest request) {
	  
	  String nees_id=request.getParameter("nees_id");
	  String  designent_id=request.getParameter("designent_id");
	   
	  
	  Map map=HTTPApiCURL.ApiCURL(request,Api.DELETE_DESIGNER(nees_id,designent_id),"PUT" ,"");
	  System.out.println("map.toString() : "+map.toString());
	  return map;
   }
   @RequestMapping(value="/modifyDemand")
   @ResponseBody
   @SuppressWarnings({ "rawtypes" })
   public Map modifyDemand(HttpServletRequest request) throws Exception{
	    JsonObject json = new JsonObject();
		
		
		json.addProperty("province", request.getParameter("provincename"));
		json.addProperty("city", request.getParameter("cityname"));
		json.addProperty("district", request.getParameter("districtname"));
		json.addProperty("province_name", request.getParameter("province_name"));
		json.addProperty("city_name", request.getParameter("city_name"));
		json.addProperty("district_name", request.getParameter("district_name"));
		json.addProperty("contacts_name", request.getParameter("contactsname"));
		json.addProperty("contacts_mobile", request.getParameter("contactsmobile"));
		json.addProperty("house_type", request.getParameter("housetype"));
		json.addProperty("house_area", request.getParameter("housearea"));
		json.addProperty("room", request.getParameter("room"));
		json.addProperty("living_room", request.getParameter("livingroom"));
		json.addProperty("toilet", request.getParameter("toilet"));
		json.addProperty("decoration_budget", request.getParameter("decoration_budget"));
		json.addProperty("design_budget", request.getParameter("design_budget"));
		json.addProperty("decoration_style", request.getParameter("renovationstyle"));
		json.addProperty("community_name", request.getParameter("neighbourhoods"));
		logger.debug("json.toString() : \n"+json.toString());
		String needId = request.getParameter("needId");
		System.out.println("needId : "+needId);
		String method = "PUT";
		Map map = HTTPApiCURL.ApiCURL(request,Api.NEEDS(needId), method, json.toString());
		System.out.println("map.toString() : "+map.toString());
		return map;
   }

   @RequestMapping(value="/terminateDemand")
   @ResponseBody
   @SuppressWarnings({ "rawtypes" })
   public Map terminateDemand(HttpServletRequest request){
	    String needId = request.getParameter("needs_id") ;
	    System.out.println("needId : "+needId);
	    String method = "PUT";
		Map map = HTTPApiCURL.ApiCURL(request,Api.NEED_CANCEL(needId),method,"");
		System.out.println("map.toString() : "+map.toString());
		return map;
   }
   

   /**
	 *designer get my mark list
	 * @param request
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/getmybidlist", method = RequestMethod.POST )
	@ResponseBody
	public Map<String,Object> getmybidlist(HttpServletRequest request)
	{
		SessionUtil session=new SessionUtil();
		int page =Integer.parseInt(request.getParameter("page").toString());
	    if(page<0){
		   page=0;
	    }
	    int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
	    if(pageSize<0){
		   pageSize=Api.PAGESIZE;
	    }
		String designerid=session.getSession(request, "users").get("id").toString();
		Map map = HTTPApiCURL.getMethed(request, Api.DESIGNERMARKLIST(designerid,page,pageSize), "GET", "");
		
		SystemUtil.sysStr("getmybidlist map",map.toString());
		return map;
	}
	
   @ResponseBody
   @RequestMapping(value="/getDesignersOrderlist")
   @SuppressWarnings("rawtypes")
   public Map getDesignersOrderlist(HttpServletRequest request){
	   
	   int page =Integer.parseInt(request.getParameter("page").toString());
	   if(page<0){
		   page=0;
	   }
	   int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
	   if(pageSize<0){
		   pageSize=Api.PAGESIZE;
	   }
	   
	   SessionUtil sessios=new SessionUtil();
	  
	   String designerid=sessios.getSession(request,"users").get("id").toString();
	      
	   Map map=HTTPApiCURL.getMethed(request,Api.DESIGNERORDER(designerid, page, pageSize),"GET","");
	   return map;
   }

	   /**
		 *designer get my mark bidDetail
		 * @param request
		 * @return
		 */
		@SuppressWarnings({ "rawtypes", "unchecked" })
		@RequestMapping(value = "/getmybiddetail", method = RequestMethod.POST )
		@ResponseBody
		public Map<String,Object> getmybidDetail(HttpServletRequest request)
		{
			String needs_id=request.getParameter("needs_id");
			SystemUtil.sysStr("getmybidDetail", Api.NEEDS(needs_id));
			Map map = HTTPApiCURL.getMethed(request,Api.NEEDS(needs_id), "GET", "");
			SystemUtil.sysStr("getmybiddetail map",map.toString());
			return map;
		}
		
		 @ResponseBody
		   @RequestMapping(value="/getBeishuOrderlist")
		   @SuppressWarnings("rawtypes")
		   public Map getBeishuOrderlist(HttpServletRequest request){
			   
			   int page =Integer.parseInt(request.getParameter("page").toString());
			   if(page<0){
				   page=0;
			   }
			   int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
			   if(pageSize<0){
				   pageSize=Api.PAGESIZE;
			   }
			   
			   SessionUtil sessios=new SessionUtil();
			  
			   String designerid=sessios.getSession(request,"users").get("id").toString();
			   
			   System.err.println(Api.BEISHUORDER(designerid, page, pageSize));
			   
			   Map map=HTTPApiCURL.getMethed(request,Api.BEISHUORDER(designerid, page, pageSize),"GET","");

			   return map;
		   }
		 
		 /**
		  * Custom designer 
		  * @param request
		  * @return
		 * @throws java.text.ParseException 
		  */
		 @SuppressWarnings({ "rawtypes", "unchecked"})
		 @RequestMapping(value="/customDesigner",method=RequestMethod.POST)
		 @ResponseBody
		 public Map customDesigner(HttpServletRequest request) throws java.text.ParseException{
			 
			
			 SessionUtil session=new SessionUtil();
			 String contactsname=session.getSession(request,"users").get("userName").toString();
			 int user_id=Integer.parseInt(session.getSession(request,"users").get("id").toString());
			 
			 
			 String housetype=request.getParameter("housetype");
			 String phone=request.getParameter("phone");
			 
			 String housearea=request.getParameter("housearea");
			 int  designer_id=Integer.parseInt(request.getParameter("designe_id").toString());
			 
			 String budget=request.getParameter("budget");
			 String style=request.getParameter("style");
			 
			 String province=request.getParameter("province");
			 String city=request.getParameter("city");
			 String district=request.getParameter("district");
			 
			 String address=request.getParameter("address");
			 String room=request.getParameter("room");
			 
			 String livingroom=request.getParameter("livingroom");
			 String bathroomCountreq=request.getParameter("bathroomCountreq");
			 
			 String time=request.getParameter("time");
			 String amount=request.getParameter("amount");
			 
			 String decoration_budget=request.getParameter("decoration_budget");
			 
			 
			 JSONObject param=new JSONObject();
			 
		  
			 
			 param.put("contacts_name",contactsname);
			 param.put("house_type",housetype);
			 
			 param.put("contacts_mobile",phone);
			 param.put("house_area",housearea);
			 
			 param.put("designer_id",designer_id);
			 param.put("decoration_style",style);
			 
			 param.put("province",province);
			 param.put("city",city);
			 
			 param.put("district",district);
			 param.put("room",room);
			 
			 param.put("living_room",livingroom);
			 param.put("toilet",bathroomCountreq);
			 
			 param.put("service_date",time);//Feb 4, 2016 9:05:27 PM
			 param.put("user_id", user_id);
			 
			 param.put("order_type","0");
			 param.put("amount",amount);
			 
			 param.put("channel_type","WEB");
			 param.put("community_name",address);
			 
			 param.put("decoration_budget",decoration_budget);
			 param.put("design_budget",budget);
			 
			 param.put("province_name", request.getParameter("province_name"));
			 param.put("city_name", request.getParameter("city_name"));
			 param.put("district_name", request.getParameter("district_name"));
			 
			 System.out.println("asasasasas :"+param.toString());   
			 
			 /*@"service_date"         : _measureTime,
             @"user_id"              : member.member_id,
             @"contacts_name"        :self.contactsNameTF.text,
             @"contacts_mobile"      :self.contactsMobileTF.text,
             @"designer_id"          : _designer_id,
             @"order_type"           : @"0",
             @"amount"               : _measurePrice,
             @"channel_type"         : @"IOS",
             @"house_type"           : _houseType,
             @"house_area"           : self.houseAreaTF.text,
             @"decoration_budget"    : _decorationBudget,
             @"design_budget"        : _designBudget,
             @"decoration_style"     : _renovationStyle,
             @"province"             : _province,
             @"city"                 : _city,
             @"district"             : _district,
             @"community_name"       : self.detailAddressTF.text,
             @"room"                 : _room,
             @"living_room"          : _livingRoom,
             @"toilet"               : _toilet,
             };*/
			 
			 Map map=HTTPApiCURL.ApiCURL(request,Api.CUSTOMDESIGNER(),"POST", param.toString());
			 
			 return map;
			 
		 } 
		 
		 /**
		  * 
		  * @param request
		  * @return
		  */
		 @SuppressWarnings({ "rawtypes", "unchecked" })
		 @RequestMapping(value="/selectTa",method=RequestMethod.POST)
		 @ResponseBody
		 public Map selectTa(HttpServletRequest request){
			 
			 SessionUtil session=new SessionUtil();
			 String needs_id=request.getParameter("needs_id");
			 
			 String designer_id=request.getParameter("designer_id");
			 String user_id=session.getSession(request, "users").get("id").toString();
			 String expenses=request.getParameter("expenses");
			 String time=request.getParameter("time");
			 
			 System.err.println("=================:"+time);
			 
			 JSONObject json=new  JSONObject();
			 json.put("needs_id", needs_id);
			 json.put("designer_id", designer_id);
			 
			 json.put("user_id", user_id);
			 json.put("service_date",time);
			 
			 json.put("order_type","0");
			 json.put("amount",expenses);
			 
			 System.err.println("//////////////////////////////"+json.toJSONString());
			 
			 Map map=HTTPApiCURL.ApiCURL(request, Api.CHOOSEHIM(), "POST", json.toString());
			 return map;
		 }
		
		/**
		 * Designers reject consumers real 
		 * @param request
		 * @return
		 */
		@SuppressWarnings("rawtypes")
		@RequestMapping(value="/refused",method=RequestMethod.POST)
		@ResponseBody
		public Map refused(HttpServletRequest request){
			 String needs_id=request.getParameter("needs_id");
			 Map map=HTTPApiCURL.ApiCURL(request,Api.DESIGNERREFUSED(needs_id),"PUT","");
			 return map;
		 }
		
		/**
		 * Designers confirm the volume of housing
		 * @param request
		 * @return
		 */
		@SuppressWarnings("rawtypes")
		@RequestMapping(value="confirm",method=RequestMethod.POST)
		@ResponseBody
		public Map confirm(HttpServletRequest request){
			String needs_id=request.getParameter("needs_id");
			Map map=HTTPApiCURL.ApiCURL(request,Api.AGREE(needs_id),"PUT", "");
			return map;
		}
		
		/**
		 * Designers create contracts
		 * @param request
		 * @return
		 * @throws UnsupportedEncodingException 
		 */
		@SuppressWarnings("rawtypes")
		@ResponseBody
		@RequestMapping(value="createContract",method=RequestMethod.POST)
		public Map createContract(HttpServletRequest request) throws UnsupportedEncodingException{
			//{ "contract_no": "100001", "contract_data": "[{key:value},{key1:value1},{key2:value2}]", "contract_first_charge": "3000", "contract_charge": "4000", "contract_template_url": "www.baidu.com", "contract_type": 0, "designer_id": 20730161 }
			
			String needs_id=request.getParameter("needs_id");
			String contract_no=request.getParameter("contract_no");
			
			String contract_type=request.getParameter("contract_type");
			String contract_first_charge=request.getParameter("contract_first_charge");
			
			String contract_charge=request.getParameter("contract_charge");
			String impressionDrawing=request.getParameter("impressionDrawing");
			
			String diy=request.getParameter("diy");
			String price=request.getParameter("price");
			
			String contract_template_url=request.getParameter("contract_template_url");
			SessionUtil session=new SessionUtil();

			String designer_id=session.getSession(request,"users").get("id").toString();
			String name=request.getParameter("name");
			String mobile=request.getParameter("mobile");
			String zip=request.getParameter("zip");
			String email=request.getParameter("email");
			String addr=request.getParameter("addr");
			String addrDe=request.getParameter("addrDe");
			
			
			JsonObject data=new JsonObject();
			data.addProperty("design_sketch",impressionDrawing);
			data.addProperty("render_map",diy);
			data.addProperty("design_sketch_plus",price);
			
			String contract_data="{'name':'"+name+"','mobile':'"+mobile+"','zip':'"+zip+"','email':'"+email+"','addr':'"+addr+"','addrDe':'"+addrDe+"','design_sketch':'"+impressionDrawing+"','render_map':'"+diy+"','design_sketch_plus':'"+price+"'}";
			String newsContract_data=contract_data.replaceAll("'","@jr@");
			
			JsonObject parameter=new JsonObject();
			parameter.addProperty("needs_id", needs_id);
			parameter.addProperty("contract_no",contract_no);
			
			parameter.addProperty("contract_type",contract_type);
			parameter.addProperty("contract_first_charge",contract_first_charge);
			
			parameter.addProperty("contract_charge",contract_charge);
			parameter.addProperty("contract_template_path",contract_template_url);
			
			parameter.addProperty("designer_id",designer_id);
			parameter.addProperty("contract_data",newsContract_data);
			Map map=HTTPApiCURL.ApiCURL(request,Api.CONTRACTS(needs_id),"POST",parameter.toString());
			return map;
		}
		
		/**
		 * Create upload delivery information 
		 * @param request
		 * @return
		 */
		@SuppressWarnings("rawtypes")
		@RequestMapping(value="deliveryresultsCreate",method=RequestMethod.POST)
		@ResponseBody
		public Map deliveryresultsCreate(HttpServletRequest request){
			String asset_id=request.getParameter("asset_id");
			SessionUtil session=new SessionUtil();
			String designer_id=session.getSession(request, "users").get("id").toString();
			String delivery_type=request.getParameter("delivery_type");
			String file_id=request.getParameter("file_id");
			String file_name=request.getParameter("file_name");
			String subbimtted_date=new Date().toString();
			
			JsonObject parameter=new JsonObject();
			
			parameter.addProperty("designer_id",designer_id);
			parameter.addProperty("delivery_type",delivery_type);
			parameter.addProperty("file_id",file_id);
			parameter.addProperty("file_name",file_name);
			parameter.addProperty("subbimtted_date",subbimtted_date);
			
			Map map=HTTPApiCURL.ApiCURL(request,Api.DELIVERRESULTSCREATE(asset_id),"",parameter.toString());
			
			return map;
		}
		
		
		/**
		 * Designers stop mark
		 * @param request
		 * @return
		 */
		@SuppressWarnings("rawtypes")
		@RequestMapping(value="stopmark",method=RequestMethod.POST)
		@ResponseBody
		public Map stopMark(HttpServletRequest request){
			SessionUtil session=new SessionUtil();
			String designer_id=session.getSession(request, "users").get("id").toString();
			String need_id=request.getParameter("needs_id");
			System.out.println("stopMark url:"+Api.DESIGNERNEEDS(need_id,designer_id));
			Map map=HTTPApiCURL.DELETE(request,Api.DESIGNERNEEDS(need_id,designer_id),"DELETE", "");
			System.out.println("stopMark map:"+map.toString());
			return map;
		}
		
		/**
		 * Alipay.com payment
		 * @param request
		 * @return
		 */
		@RequestMapping(value="/aliPay")
		@ResponseBody
		
		public JsonObject aliPay(HttpServletRequest request){
			String order_id=request.getParameter("order_id");
			String orderLine_id=request.getParameter("orderLine_id");
			JsonObject parameter=new JsonObject(); 
			parameter.addProperty("payUrl",Api.ALIPAY(order_id, orderLine_id));
			
			return parameter;
		}
		
		/**
		 * Get the contract number
		 * @param request
		 * @return
		 */
		@SuppressWarnings("rawtypes")
		@RequestMapping(value="getContractNumber")
		@ResponseBody
		public Map getContractNumber(HttpServletRequest request){
			//CENTRALALIZATION
			Map map=HTTPApiCURL.getMethed(request,Api.CENTRALALIZATION(),"GET","");
			return map;
			
		}
	     
		/**
		 * URLDecoder contract content 
		 * @param request
		 * @return
		 * @throws UnsupportedEncodingException
		 */
	    @SuppressWarnings({ "rawtypes"})
		@RequestMapping(value="/getURLDecoder",method=RequestMethod.POST)
	    @ResponseBody
		public Map getURLDecoder(HttpServletRequest request) throws UnsupportedEncodingException{
	    	
	    	String contract_data=request.getParameter("contract_data");
			Map map=GsonUtil.formJson(contract_data.replaceAll("@jr@", "\""));

			return map;
		}
}

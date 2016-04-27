/*++++++++++++++++++++++++++++++++++++++++++++
 * Payment Controller
 * ============================================
 * @author fangzhigang
 * ============================================
 * @date 2015-11-27
 *+++++++++++++++++++++++++++++++++++++++++++++*/
package com.adsk.mp.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adsk.mp.commons.Api;
import com.adsk.mp.commons.HTTPApiCURL;
import com.adsk.mp.commons.SessionUtil;
import com.adsk.mp.commons.SystemUtil;

@Controller
@RequestMapping(value="pay")
public class PaymentController {
	
	 /**
	  * get member money info
	  * @param request
	  * @return
	  */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/myMoneyInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map getMyMoneyInfo(HttpServletRequest request){
		SessionUtil session=new SessionUtil();
		String designer_id=session.getSession(request, "users").get("id").toString();
		SystemUtil.sysStr("getMyMoneyInfo url", Api.GETDESIGNERMONEYINFO(designer_id));
		Map map=HTTPApiCURL.getMethed(request, Api.GETDESIGNERMONEYINFO(designer_id), "GET", "");
		SystemUtil.sysStr("getMyMoneyInfo map", map.toString());
		return map;
	}
	
	
	/**
	 * get member withdrawal record info
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/withdrawalRecordInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map getWithdrawalRecordInfo(HttpServletRequest request){
		SessionUtil session=new SessionUtil();
		String designer_id=session.getSession(request, "users").get("id").toString();
		int page =Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page=1;
		}
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<0){
			pageSize=Api.PAGESIZE;
		}
		Map map=HTTPApiCURL.getMethed(request, Api.GETDESIGNERCASHLIST(designer_id,page,pageSize), "GET", "");
		return map;
	}
	
	/**
	 * get member Transaction record list
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/transactionRecordInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map getTransactionRecordInfo(HttpServletRequest request){
		SessionUtil session=new SessionUtil();
		String designer_id=session.getSession(request, "users").get("id").toString();
		int page =Integer.parseInt(request.getParameter("page").toString());
		if(page<0){
			page=1;
		}
		int pageSize=Integer.parseInt(request.getParameter("pageSize").toString());
		if(pageSize<0){
			pageSize=Api.PAGESIZE;
		}
		SystemUtil.sysStr("transactionRecordInfo url", Api.GETDESIGNERTRADINGLIST(designer_id,page,pageSize));
		Map map=HTTPApiCURL.getMethed(request, Api.GETDESIGNERTRADINGLIST(designer_id,page,pageSize), "GET", "");
		SystemUtil.sysStr("transactionRecordInfo map", map.toString());
		return map;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/submitDesignerBankCardInfo", method = RequestMethod.POST)
	@ResponseBody
	public Map submitDesignerBankCardInfo(HttpServletRequest request){
		SessionUtil session=new SessionUtil();
		String designer_id=session.getSession(request, "users").get("id").toString();
		JSONObject json=new JSONObject();
		json.put("account_user_name", request.getParameter("account_user_name"));
		json.put("bank_name", request.getParameter("bank_name"));
		json.put("branch_bank_name", request.getParameter("branch_bank_name"));
		json.put("deposit_card", request.getParameter("deposit_card"));
		SystemUtil.sysStr("submitDesignerBankCardInfo url", Api.DESIGNERWITHDRAW(designer_id));
		SystemUtil.sysStr("json", json.toJSONString());
		Map map=HTTPApiCURL.ApiCURL(request, Api.DESIGNERWITHDRAW(designer_id), "PUT", json.toString());
		SystemUtil.sysStr("submitDesignerBankCardInfo map", map.toString());
		return map;
	}
  
}

/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 * Package API class
 * ==========================================================+
 * @author fangzhigang
 * ==========================================================+
 * @date：2015-12-11 10:11
 * =========================================================*/
package com.adsk.mp.commons;

import freemarker.core.ReturnInstruction.Return;

/**
 * @author Administrator
 *
 */

public class Api {
	
	/*=============================================== pageSize ========================================================================*/
	public static final Integer PAGESIZE=20;
	/*=============================================== request =========================================================================*/
	//
	final static String BASEPATH =  (String) PropUtil.loadProperties("ApiUrl.properties").get("localhost");
	//membere API prefix path
	final static String MEMBERPATH =  (String) PropUtil.loadProperties("ApiUrl.properties").get("member");
	//im  API prefix path
	final static String IMPATH =  (String) PropUtil.loadProperties("ApiUrl.properties").get("im");
	//im socket prefix path
	final static String IMSOCKETPATH=(String) PropUtil.loadProperties("ApiUrl.properties").get("imSocket");
	//im socket prefix path
	final static String IMMEDIAPATH=(String) PropUtil.loadProperties("ApiUrl.properties").get("imMedia");
	//design API prefix path
	final static String DESIGNPATH =  (String) PropUtil.loadProperties("ApiUrl.properties").get("design");
	//onlinepay API prefix path
	final static String ONLINEPAYPATH =  (String) PropUtil.loadProperties("ApiUrl.properties").get("onlinepay");
	// designer transaction API prefix path
	final static String TRANSACTIONPATH = (String) PropUtil.loadProperties("ApiUrl.properties").get("transaction");
    //public static final String  BASEPATH="http://192.168.2.222:6080";
	final static String apiDomain = (String) PropUtil.loadProperties("ApiUrl.properties").get("apiDomain");
    
    /*================================================ member api ==================================================================*/
    
    //Verify whether the phone number has been registered
    public static final String  VERIFYMOBILE(){
    	return BASEPATH+"/v1/api/verify/mobile";
    }
    //Verify and register
    public static final String MEMBERS(){
    	return BASEPATH+"/member/api/v1/members/";
    }
    //According to the phone number + password and login
    public static final String MEMBERSLOGIN(String type){
    	return DESIGNPATH+"/v1/api/members/login/"+type;
    }
    //According to the phone number + SMS verification code and log on
    public static final String MEMBERSLOGINSMS(){
    	return BASEPATH+"/v1/api/members/login/sms";
    }
    //Send verification code for mobile phone
    public static final String SMS(){
    	return BASEPATH+"/v1/api/sms";
    }
    //Third party login
    public static final String MEMEBERSTHIRDPARTY(){
    	return BASEPATH+"/v1/api/members/thirdparty";
    }
    //According to cell phone authentication code and identity ID, password, mobile phone number to replace the new phone
    public static final String MEMEBERSMOBILE(){
    	return BASEPATH+"/v1/api/members/mobile";
    }
    //Obtain identity information based on membership identification
    public static final String MEMBERSIDENTITTY(){
    	return BASEPATH+"/v1/api/members/identity";
    }
    //Upload identity photos based on membership identity
    public static final String MEMBERSIDENTITYIMAGES(){
    	return BASEPATH+"/v1/api/members/identity/images";
    }
    //Obtain a personal collection case list based on membership identification
    public static final String MEMBERSFAVORITESCASES(){
    	return BASEPATH+"/v1/api/members/favorites/cases";
    }
    //Obtain a list of personal favorites DIY programs based on membership identification
    public static final String MEMBERFAVORITESDIY(){
    	return BASEPATH+"/v1/api/member/favorites/diy";
    }
    //Get personal attention to the designer list based on the membership identification
    public static final String MEMBERSDESIGNER(){
    	return BASEPATH+"/v1/api/members/designer";
    }
    //According to retrieve the password authentication code to verify the phone
    public static final String VERIFTYSMS(){
    	return BASEPATH+"/v1/api/verify/sms";
    }
    //Set a new password based on the phone's authentication information
    public static final String MEMBERSPASSWORD(){
    	return BASEPATH+"/v1/api/members/password";
    }
    //param 'post' member to realname authentication 。 param 'put' designer  realname authentication
    public static final String MEMBERREALNAME(String member_id){
    	return MEMBERPATH+"/v1/api/realnames/members/"+member_id;
    }
    //param 'get' member to get designer list。param 'delete' member to delete designer list
    public static final String memberGetDesigner(String member_id,String designer_id){
    	return BASEPATH+"/member/api/v1/members/"+member_id+"/designers/"+designer_id;
    }
    //param 'get' to get memberMsg。param 'put' to modify memberMsg
    public static final String MEMBERS(String id){
		return MEMBERPATH+"/v1/api/members/"+id;
    	
    }
    
    public static final String INDEXDESIGNER(){
		return MEMBERPATH+"/v1/api/designers/recommend ";
    	
    }
    
    //
    public static final String MEMBERAGAINAUTH(String member_id){
    	return MEMBERPATH+"/v1/api/realnames/members/"+member_id+"/reaudit";
    }
    
    public static final String UPLOADAVATAR(){
    	return MEMBERPATH+"/v1/api/members/updateavatar";
    }
    /*===================================================== cases api =============================================================*/
    
    //New case
    public static final String CASES(String parameter){
    	return BASEPATH+"/design/api/v1/cases";
    }
    
    /**
     * Delete case based on case identification
     * Obtain case details based on case identification 
     * @param caseid
     * @return 
     */
    public static final String DELETECASE(String caseid,String parameter ){
    	if(caseid !=null){
    		return DESIGNPATH+"/v1/api/cases/"+caseid;
    	}else{
    		return DESIGNPATH+"/v1/api/cases"+parameter;
    	}
    	
    }
    
    /**
     * case list
     * @param page
     * @param pageSize
     * @return
     */
    public static final String CASELIST(int page,int pageSize){
    	return DESIGNPATH+"/v1/api/cases?limit="+pageSize+"&offset="+page+"&sort_by=date&sort_order=desc&taxonomy_id=01";
    }
    
    /**
     * Modification of case recommendation status based on case identification 
     * @param caseid
     * @return
     */
    public static final String CASESRECOMMENDED(String caseid){
    	return DESIGNPATH+"/design/api/v1/cases/"+caseid+"/recommended";
    }
    
    /**
     * Recommended case list based on case recommendation 
     * @param recommended
     * @return
     */
    public static final String CASES_RECOMMENDED(String recommended){
    	return DESIGNPATH+"/design/api/v1/cases/cases/"+recommended;
    }
    
   /**
    * According to case identification audit case
    * @param caseid
    * @return 
    */
    public static final String CASESVERIFY(String caseid){
    	return DESIGNPATH+"/design/api/v1/cases/"+caseid+"/verify";
    }
    /**
     * Get designer case (effect diagram) list interface 
     * @return
     */
    public static final String DESINGNERCASES(){
    	return DESIGNPATH+"/design/api/v1/designer/cases/";
    }
    /**
     * Get designer cases (effect diagram) for the details of the interface
     * @param csesid
     * @return
     */
    public static final String CASESDETAILS(String casesid){
    	return DESIGNPATH+"/design/api/v1/cases/"+casesid+"/details";
    }
    /**
     * According to the case identification and design logo upload case effect diagram
     * @return
     */
    public static final String CASESUPLOAD(){
    	return DESIGNPATH+"/design/api/v1/cases/upload";
    }
    /**
     * According to the effect of the case and the design of the logo designer to delete the case effect diagram 
     * @param casesid
     * @param pictruesid
     * @return
     */
    public static final String CASESPICTRUUES(String casesid,String pictruesid){
    	return DESIGNPATH+"/design/api/v1/cases/"+casesid+"/pictrues/"+pictruesid;
    }
    /**
     * Add a comment based on identity and case identification 
     * @param casesid
     * @return
     */
    public static final String CASESCOMMENTS(String casesid){
    	return DESIGNPATH+"/design/api/v1/cases/"+casesid+"/comments";
    }
    /**
     * Reply to a case based on the designer's logo and case identification. 
     * @return
     */
    public static final String CASESCOMMENTSREPLY(){
    	return DESIGNPATH+"/design/api/v1/cases/comments/reply";
    }
    /**
     * Obtain "my" evaluation / reply list based on the designer's identity 
     * @param casesid
     * @param authorid
     * @param projectid
     * @return
     */
    public static final String CASES_COMMENTS(String casesid,String authorid,String projectid){
    	return DESIGNPATH+"/design/api/v1/cases/"+casesid+"/"+authorid+"/"+projectid;
    }
    /**
     * According to the number of non Reading Recovery of the designer's identity to obtain the case 
     * @return
     */
    public static final String DESIGNERREPLYS(){
    	return DESIGNPATH+"/design/api/v1/designer/replys";
    }
    /**
     * According to the identity and case identification point like a case 
     * @param caseid
     * @return
     */
    public static final String CASESLIKE(String caseid){
    	return DESIGNPATH+"/design/api/v1/cases/"+caseid+"/like";
    }
    /**
     * According to the identity and case identification collection of a case 
     * According to the identity and the case has been deleted 
     * Update a collection of case notes information based on identity and case identification
     * @param caseid
     * @return
     */
    public static final String CASESFAVORITE(String caseid){
    	return DESIGNPATH+"/design/api/v1/cases/"+caseid+"/favorite";
    }
    /**
     * According to the identity of the collection of information to obtain a list of information 
     * @param memberid
     * @return
     */
    public static final String CASESFAVORITES(String memberid){
    	return DESIGNPATH+"/design/api/v1/cases/"+memberid+"/favorites";
    }
    /**
     * Designers in the front of the new case
     * @return
     */
    public static final String DESIGNERADDCASE(){
    	return DESIGNPATH+"/v1/api/cases";
    }
    
    public static final String CASELIST(){
    	return DESIGNPATH+"/v1/api/cases?page=0&limit=10&sort_by=date&sort_order=desc";
    }
    
    
    public static final String  DESIGNERADDIDCASE(int page,int pageSize,String designer_id){
    	return  DESIGNPATH+"/v1/api/designers/"+designer_id+"/cases?limit="+pageSize+"&offset="+page+"&sort_by=date&sort_order=desc";
    }
    /**
     *  search case
     * @param page
     * @param pageSize
     * @return
     */
    public static final String SEARCHCASE(int page,int pageSize){
    	return  DESIGNPATH+"/v1/api/cases/search?limit="+pageSize+"&offset="+page+"&sort_by=date&sort_order=desc&taxonomy_id=01";
    }
    
    
    /*===================================================== need api =============================================================*/
    
    /**
     * @return publish needs api url , this api is add user demand(give diffrence method to do add or get data)
     */
    public static String NEEDS (){
    	return DESIGNPATH+"/v1/api/needs";
    }
    /**
     * @param need_id , call this api need give need_id
     * @return publish needs api url , this api is modify user demand(give diffrence method to do modify or delete or get data)
     */
    public static String NEEDS(String need_id){
    	return DESIGNPATH+"/v1/api/needs/"+need_id;
    }
    
    public static String  NEEDDATILE(String orderid,int page,int pageSize){
    	if(orderid!=null){
        	return DESIGNPATH+"/v1/api/member/needs/"+orderid+"/design_req_id?referenced_assets=true&extended_data=true&version=1.15&asset_taxonomy=true";    		
    	}else{
    		return DESIGNPATH+"/v1/api/needs?offset="+page+"&limit="+pageSize+"&media_type_id=53&software=96&asset_taxonomy=ezhome/fullflow/audit/success&sort_by=date&sort_order=desc";
    	}
    }
    
    /**
     * @return publish needs api url , this api get user needs
     */
    public static String GETMEMBERNEEDS(String memberId,String status , int offset , int limit){
    	return DESIGNPATH+"/v1/api/member/"+memberId+"/needs?offset="+offset+"&limit="+limit+"&media_type_id=53&sort_by=date&sort_order=desc&version=4.15";
    }
    /**
     * @param designreqid , call this api need give designreqid
     * @return publish needs api url , audit user needs
     */
    public static String AUDIT(String designreqid){
    	return DESIGNPATH+"/need/api/v1/needs/"+designreqid+"/status";
    }
    /**
     * 
     * @param designreqid  ,call this api need give designreqid
     * @return   Consumers view their own needs to come to a list of targets should be targeted API.
     */
    public static String HOMEORDERDETAIL(String needs_id){
    	return DESIGNPATH+"/v1/api/needs/"+needs_id+"/designers";
    }
    /**
     * @param designreqid , call this api need give designreqid
     * @return publish needs api url , audit user needs(give diffrence method to do audit or get data)
     */
    public static String DESIGNERNEEDS(String need_id,String designer_id){
    	return DESIGNPATH+"/v1/api/needs/"+need_id+"/designers/"+designer_id;
    }
    /**
     * @param designreqid, call this api need give designreqid
     * @param designerid, call this api need give designerid
     * @return publish needs api url , audit designer(give diffrence method to do audit or get status)
     */
    public static String SM_STATUS(String designreqid , String designerid){
    	return DESIGNPATH+"/need/api/v1/needs/"+designreqid+"/designers/"+designerid+"/status";
    }
    /**
     * @param designreqid, call this api need give designreqid
     * @param designerid, call this api need give designerid
     * @return publish needs api url , user delete not need designer
     */
    public static String DELETE_DESIGNER(String designreqid , String designerid){
    	return DESIGNPATH+"/v1/api/needs/"+designreqid+"/designers/"+designerid;
    }
    /**
     * @param need_id , call this api need give need_id
     * @return publish needs api url , this api is  user cancel demand
     */
    public static String NEED_CANCEL(String need_id){
    	return DESIGNPATH+"/v1/api/needs/"+need_id+"/cancel?is_deleted=1";
    }
    /**
     * @return get user demand list
     */
    public static String getMemberDemandList(){
    	return DESIGNPATH+"/v1/api/needs?offset=10&limit=10";
    }
    /**
     * According to the consumer identification to obtain their own release needs list
     * @return
     */
    public static String getUserPublishList(int page,int pageSize){
    	return DESIGNPATH+"/v1/api/member/needs?offset="+page+"&limit="+pageSize+"&sort_by=post_date&sort_order=desc";
    }
    /**
     * According to demand identification to obtain the release of details
     * @param need_id
     * @return
     */
    public static String getUserPublishList(String need_id){
    	return DESIGNPATH+"/v1/api/needs/"+need_id+"?referenced_assets=true&extended_data=true&version=1.15&asset_taxonomy=true";
    }
    /**
     * Designers should be subject to a demand
     * @param needs_id
     * @param designers_id
     * @return
     */
    public static String designerBid(String needs_id , String designers_id){
    	return DESIGNPATH+"v1/api/needs/"+needs_id+"/designers/"+designers_id;
    }
    
    /**
     * Consumer choice Designer
     * @return
     */
    public static final String CUSTOMDESIGNER(){
    	return DESIGNPATH+"/v1/api/orders?is_need=false";
    }
    
    /**
     * Choose him 
     * @return
     */
    public static  final String  CHOOSEHIM(){
    	return DESIGNPATH+"/v1/api/orders?is_need=true";
    }
    
    
    /**
     * No amount of real designer
     * @param needs_id
     * @return
     */
    public static final String DESIGNERREFUSED(String needs_id){
    	return DESIGNPATH+"/v1/api/refused/"+needs_id;
    }
    
    public static final String AGREE(String needs_id){
    	return DESIGNPATH+"/v1/api/orders/"+needs_id;
    }
    /**
     * search needs
     * @param page
     * @param pageSize
     * @return
     */
    public static final String SEARCHNEEDS(int page, int pageSize){
    	return DESIGNPATH+"/v1/api/search/needs?limit="+pageSize+"&offset="+page+"&sort_by=date&sort_order=desc&asset_taxonomy=ezhome/fullflow/audit/success";
    }
     /*====================================================== Design service ================================================================*/
    /**
     * According to the designer to obtain the designer of the housing price 
     * @return
     */
    public static final String PRICESMEASURE(){
    	return DESIGNPATH+"/design/api/v1/prices/measure";
    }
    /**
     * According to the designer logo and consumer identification of new volume orders
     * According to the designer to obtain the volume of housing orders list
     * @return
     */
    public static final String ORDER(){
    	return DESIGNPATH+"/v1/api/orders";
    }
    /**
     * According to identity identification and order identification to obtain the quantity of room order details
     * Refusal / consent quantity room order based on designer identification and order identification 
     * @param orderid
     * @return
     */
    public static final String ORDERS(String orderid,String parameter){
    	String str=null;
    	if(parameter==null){
    		str= DESIGNPATH+"/v1/api/orders/"+orderid;
    	}else if(orderid==null){
    		str=DESIGNPATH+"/v1/api/orders?"+parameter;
    	}
    	return str;
    }
    /**
     * Upload the results of the room according to the designer logo
     * @return
     */
    public static final String MEASUREUPLOAD(){
    	return DESIGNPATH+"/v1/api/measure/upload";
    }
    /**
     * According to the requirements of the tender identification and design logo design new contract 
     * @return
     */
    public static final String CONTRACTS(){
    	return DESIGNPATH+"/v1/api/contracts";
    }
    /**
     * According to the requirements of the tender identification and design identification of new design orders 
     * @return
     */
    public static final String 	ORDERDESIGN(){
    	return DESIGNPATH+"/v1/api/orders/design";
    }
    /**
     * According to the requirement of the bidding and the design of the new design 
     * Update design plan based on logo design and logo design
     * @return
     */
    public static final String 	PROJECTS(){
    	return DESIGNPATH+"/v1/api/projects";
    }
    /**
     * Modify the status of the design plan based on the logo design and logo design 
     * @param projectid
     * @return
     */
    public static final String 	PROJECTSSTATUS(String projectid){
    	return DESIGNPATH+"/v1/api/projects/"+projectid+"/status";
    }
    /**
     * According to the logo design and logo design logo upload content 
     * @return
     */
    public static final String 	PROJECTSUPLOAD(){
    	return DESIGNPATH+"/v1/api/projects/upload";
    }
    /**
     * Obtain details of design scheme based on program identification and identity identification. 
     * @param projectid
     * @return
     */
    public static final String 	PROJECTS(String projectid){
    	return DESIGNPATH+"/v1/api/projects/"+projectid;
    }  
    
    /**
     * List of designers 
     * @param parameter 
     * @return
     */
    public static final String DESIGNERS(int page,int pageSize){
    	return MEMBERPATH+"/v1/api/designers?offset="+page+"&limit="+pageSize+"&sort_by=date&sort_order=desc";
    }
    
    /**
     * Obtain designer information according to the designer 
     * @param designerId
     * @return
     */
    public static final String DESIGNERDETAIL(String designerId){
    	return MEMBERPATH+"/v1/api/designers/"+designerId+"/home";
    }
    
    /**
     * Change theme 
     * @param designerId
     * @return
     */
    public static final String DESIGNERDETAILPIC(String designerId){
    	return MEMBERPATH+"/v1/api/designers/"+designerId+"/theme";
    }
   /**
    * 
    * @param designerid
    * @param page
    * @param pageSize
    * @return
    */
    public static final String DESIGNERMARKLIST(String designerid,int page,int pageSize){
    	return DESIGNPATH+"/v1/api/designers/"+designerid+"/bidders?offset="+page+"&limit="+pageSize+"&sort_by=date&sort_order=desc";
    }
    
    public static final String DESIGNERORDER(String designerid,int page,int pageSize){
    	return DESIGNPATH+"/v1/api/designers/"+designerid+"/orders?offset="+page+"&limit="+pageSize+"&sort_by=date&sort_order=desc";
    }
    
    /**
     * Designer's North Shu package list
     * @param member_id
     * @param page
     * @param pageSize
     * @return
     */
    public static final String BEISHUORDER(String member_id,int page,int pageSize){
    	return DESIGNPATH+"/v1/api/beishu/"+member_id+"/needs?offset="+page+"&limit="+pageSize+"&media_type_id=53&sort_by=date&sort_order=desc&=4.15";
    }
    
    public static final String DESIGNER_CASE_LIST(String designerid,int limit,int page){
    	return DESIGNPATH+"/v1/api/designers/"+designerid+"/cases?limit="+limit+"&offset="+page+"&sort_by=date&sort_order=desc";
    }
    
    public static final String DESIGNER_CASE_LIST_MODIFY(String id){
    	return DESIGNPATH+"/v1/api/cases/"+id;
    }
    
    public static final String DESIGNER_REFUSE(String need_id , String designer_id, String node_id){
    	return DESIGNPATH+"/v1/api/refused/"+need_id+"?designer_id="+designer_id+"&node_id="+node_id; 
    }
    
    /**
     * Create design contract
     * @param need_id
     * @param workflowid
     * @return
     */
    public static final String CONTRACTS(String needs_id){
    	return DESIGNPATH+"/v1/api/contracts?need_id="+needs_id;
    }
    
    /**
     * Get the contract number 
     * @return
     */
    public static final String  CENTRALALIZATION() {
		return DESIGNPATH+"/v1/api/contracts/one";
	}
    
    /**
     * Create upload delivery information
     * @param asset_id
     * @return
     */
    public static final String DELIVERRESULTSCREATE(String asset_id){
    	return  DESIGNPATH+"v1/api/deliveryresults/"+asset_id+"/create";
    }
    
 
    /*======================================================3D service  api================================================================*/
    /**
     * Get a list of 3D programs
     * @param page
     * @param pageSize
     * @param project_ids  
     * @return
     */
    public static final String DDESIGNS(int page,int pageSize,String project_ids){
    	return BASEPATH+"/v1/api/3ddesigns?offset="+page+"&limit="+pageSize+"&sort_by=date&sort_desc=desc&project_ids="+project_ids;
    }
    
    /**
     * Access to 3D program details 
     * @param project_id
     * @return
     */
    public static final String DDESIGNSDETAIL(String project_id){
    	return  BASEPATH+"/v1/api/3ddesigns/"+project_id;
    }
    
    /**
     * Gets the 3D binding schemeGets the 3D binding scheme
     * @param page
     * @param pageSize
     * @param designer_id
     * @return
     */
    public static final String BOUND3DSCHEME(int page,int pageSize,String designer_id){
    	return DESIGNPATH+"/v1/api/hs/prints/referenced/"+designer_id+"?limit="+pageSize+"&offset="+page;
    }
    
    /**
     *get  Unbound 3D scheme
     * @param page
     * @param pageSize
     * @param designer_id
     * @return
     */
    public static final String UNBOUND3DSCHEME(int page,int pageSize,String designer_id){
    	return DESIGNPATH+"/v1/api/hs/prints/projects/"+designer_id+"?limit="+pageSize+"&offset="+page;
    	
    }
    
    /***
     * Upload files to 3D Asset 
     * @param designer_id
     * @return
     */
    public static final String UPLOADFILESTOASSET(String asset_id,String designer_id){
    	return DESIGNPATH+"/v1/api/hs/prints/"+asset_id+"?designer_id="+designer_id;
    }
    
    /**
     * Get the 3D Asset file list 
     * @param 3d_asset_id
     * @param designer_id
     * @param needs_id
     * @return
     */
    public static final String GET3DASSETLIST(String asset_id,String designer_id,String needs_id){
    	return DESIGNPATH+"/v1/api/hs/prints/"+asset_id+"?designer_id="+designer_id+"&needs_id="+needs_id;
    }
    
    /**
     * The 3D Asset project and binding 
     * @param 3d_asset_id
     * @param needs_id
     * @param designer_id
     * @param file_ids={file_id},{file_id}
     * @param type
     * @return
     */
    public static final String ASSETPROJECTANDBINDING(String asset_id,String needs_id,String designer_id,String file_ids,String type){
    	return DESIGNPATH+"/v1/api/hs/prints/"+asset_id+"/references/"+needs_id+"?designer_id="+designer_id+"&file_ids="+file_ids+"&type="+type;
    }
    
    /**
     * Enter the HS from the 3D design tool design 
     * @param needs_id
     * @param designer_id
     * @return
     */
    public static final String GETASSETID(String needs_id,String designer_id){
    	return  DESIGNPATH+"/v1/api/hs/prints/project/"+needs_id+"?designer_id="+designer_id;
    }
    
    /***
     * Consumers get the 3D scheme
     * @param member_id
     * @param page
     * @param pageSize
     * @return
     */
    public static final String MEMBER3D(String member_id,int page,int pageSize){
    	return DESIGNPATH+"/v1/api/hs/prints/member/projects/"+member_id+"?limit="+pageSize+"&offset="+page;
    }
    
    /**
     * View delivery 
     * @param needs_id
     * @param designer_id
     * @return
     */
    public static final String  VIEWDELIVERY(String  needs_id,String designer_id){
    	return  DESIGNPATH+"/v1/api/hs/prints/delivery/"+needs_id+"?designer_id="+designer_id;
    }
    
    /**
     * Get a list of files for the 3D program
     * @param asset_id
     * @return
     */
    public static final String  GETHSPRINTS(String asset_id,String needs_id){
		return DESIGNPATH+"/v1/api/hs/prints/"+asset_id+"?needs_id="+needs_id;
	}
    
    /**
     * 3D design for visitors to view the identity of the designer
     * @param page
     * @param pageSize
     * @param designer_id
     * @return
     */
    public static final String MEMBERSELECT3DSHEME(int page,int pageSize,String designer_id){
    	return DESIGNPATH+"/v1/api/hs/prints/search/"+designer_id+"?limit="+pageSize+"&offset="+page+"&sort_by=date&sort_order=desc ";
    }
    /*======================================================Pay service  api================================================================*/
    /**
     * ThirParty Pay First
     * @param orderId
     * @param orderLineId
     * @param channelType
     * @param paymethod
     * @return
     */
    public static final String PAY_F(Long orderId, Long orderLineId, String channelType, String paymethod){
    	return DESIGNPATH + "/v1/api/pay/url/alipay/web/path?orderId="+orderId+"&orderLineId="+orderLineId+"&channel_type="+channelType+"&paymethod="+paymethod;
    }
    /**
     * ThirParty Pay Last
     * @param orderId
     * @param orderLineId
     * @param channelType
     * @param paymethod
     * @return
     */
    public static final String PAY_L(Long orderId, Long orderLineId, String channelType, String paymethod){
    	return DESIGNPATH + "/v1/api/pay/url/alipay/web/path?orderId="+orderId+"&orderLineId="+orderLineId+"&channel_type="+channelType+"&paymethod="+paymethod;
    }
    /**
     * ThirParty Pay Turn Back
     * @param orderId
     * @param orderLineId
     * @param channelType
     * @param paymethod
     * @return
     */
    public static final String PAY_R(Long orderId, Long orderLineId, String channelType, String paymethod){
    	return DESIGNPATH + "/notify/notifyServlet.do";
    }
    
    /**
     * Alipay.com payment
     * @param order_id
     * @param orderLine_Id
     * @return
     */
    public static final String ALIPAY(String order_id,String orderLine_Id){
    	return apiDomain+"/v1/api/pay/alipay/web/path?orderId="+order_id+"&orderLineId="+orderLine_Id+"&channel_type=web&paymethod=1";
    }
    //======================================================designer  asset management api====================================================================================
    /**
     * select designer account  info 
     * @param designer_id
     * @return
     */
    public static final String GETDESIGNERMONEYINFO(String designer_id){
    	return TRANSACTIONPATH+"/v1/api/withdraw/"+designer_id;
    }
    
    /**
     * get designer trading list
     * @param designer_id
     * @return
     */
    public static final String GETDESIGNERTRADINGLIST (String designer_id,int page,int pageSize){
    	return TRANSACTIONPATH+"/v1/api/finance/queryOrderList/"+designer_id+"?limit="+pageSize+"&offset="+page;
    }
    
    /**
     * get designer cash list
     * @param designer_id
     * @return
     */
    public static final String GETDESIGNERCASHLIST (String designer_id,int page,int pageSize){
    	return TRANSACTIONPATH+"/v1/api/finance/designerWithdrawalsTransLog/"+designer_id+"?limit="+pageSize+"&offset="+page;
    }
    
    /**
     * designer withdraw interface
     * @param designer_id
     * @return
     */
    public static final String DESIGNERWITHDRAW (String designer_id){
    	return TRANSACTIONPATH+ "/v1/api/withdraw/balance/"+designer_id;
    }


    //======================================================message centger api====================================================================================
    /**
     * get message thread id by member id
     * @param member_id
     * @return
     */
    public static final String MESSAGE_THREAD_ID(String memberId){
    	return DESIGNPATH+ "/v1/api/message/member/"+memberId;
    }
    
    /**
     * get message
     * @param memberId
     * @param page
     * @param pageSize
     * @param threadId
     * @return
     */
    public static final String MESSAGE_URL(String memberId,int page,int pageSize,String threadId){
    	return DESIGNPATH+ "/v1/api/message/member/"+memberId+"?limit="+pageSize+"&offset="+page+"&thread_id="+threadId;
    }
    
    /**
     * new get message method
     * @param memberId
     * @param page
     * @param pageSize
     * @return
     */
    public static final String MESSAGE_URL_NEW(String memberId,int page,int pageSize){
    	return DESIGNPATH+ "/v1/api/message/member/"+memberId+"/sysmessages?limit="+pageSize+"&offset="+page;
    }
    /**
     * delete messages
     * @param memberId
     * @param messageIds
     * @return
     */
    public static final String MESSAGE_DELETE_URL(String memberId,String messageIds){
    	return DESIGNPATH+ "/v1/api/member/"+memberId+"/messages/delete?message_ids="+messageIds;
    }
   /*======================================================IM service api====================================================================================*/
    /**
     * Get the chat room list
     * @param member_id
     * @param page
     * @param pageSize
     * @return
     */
    public static final String THREADSROOLIST(String member_id,int page,int pageSize){
    	return IMPATH+"/v2/members/"+member_id+"/threads?mailbox=CHAT&latest_message_info=true&sort_order=recent&offset="+page+"&limit="+pageSize+"&entity_info=true&entity_types=ASSET,WORKFLOW_STEP,NONE";
    }
    
    /**
     * Get messages for a thread
     * @param member_id
     * @param thread_id
     * @param page
     * @param pageSize
     * @return
     */
    public static final String RETRIEVE_MESSAGES(String member_id,String thread_id,int page,int pageSize){
    	return IMPATH+"/v2/members/"+member_id+"/messages/"+thread_id+"?mailbox=IN&sort_order=desc&offset="+page+"&limit="+pageSize;
    }
    
    /**
     * Mark messagea as read of a thread
     * @param member_id
     * @param thread_id
     * @return
     */
    public static final String PUT_MESSAGE(String member_id,String thread_id){
    	return IMPATH+"/v2/members/"+member_id+"/messages?action=read&thread_id="+thread_id;
    }
    
    /**
     * Mark a message as read
     * @param member_id
     * @param message_id
     * @return
     */
    public static final String MARK_A_MESSAGE(String member_id,String message_id){
    	return IMPATH+"/v2/members/"+member_id+"/messages?action=read&message_id="+message_id;
    }
    
    /**
     * Send a new message to a member or multiple members. This API can be used to initiate both private messaging and group conversation (CHAT).
     * @param member_id
     * @param subject
     * @param body
     * @param recipient_ids
     * @return
     */
    public static final String SEND_MESSAGE(String member_id,String subject,String body,String recipient_ids){
    	return IMPATH+"/v2/members/"+member_id+"/messages?body="+body+"&subject="+subject+"&recipient_ids="+recipient_ids+"&mailbox=CHAT&&app_id=96";
    }
    
    /**
     * Reply to a private message or a group conversation (CHAT).
     * @param member_id
     * @param thread_id
     * @param body
     * @return
     */
    public static final String REPLY_MESSAGE(String member_id,String thread_id,String body){
    	return IMPATH+"/v2/members/"+member_id+"/messages/reply?body="+body+"&thread_id="+thread_id+"&app_id=96";
    }
    
    /**
     * receive socket message url
     * @param session_id
     * @param member_id
     * @return
     */
    public static final String RECEIVE_MESSAGE(String session_id,String member_id){
    	return IMSOCKETPATH+"/v2/connect?sessionId="+session_id+"&memberId="+member_id+"&appId=96&deviceType=web&deviceId="+session_id+"&messageVersion=v1";
    }    
    /**
     * GET Upload Server
     * @return
     */
    public static final String GET_UPLOAD_SERVER(){
    	return IMPATH+"/v2/server/upload";
    }
    
    /**
     * Send media in chat conversation
     * @param server
     * @param member_id
     * @param thread_id
     * @param content_type
     * @return
     */
    public static final String UPLOAD_MEDIA_URL(String member_id,String content_type,String thread_id){
    	return "/api/v2/members/"+member_id+"/chat/media?content_type="+content_type+"&thread_id="+thread_id;
    }
    
}

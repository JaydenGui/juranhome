function pageActive(current_page,type){
	$("#my_prodect") ? $("#my_prodect").removeClass("active") : "";
	$("#my_diy") ? $("#my_diy").removeClass("active") :"";
	$("#my_main") ? $("#my_main").removeClass("active"):"";
	$("#my_bid") ? $("#my_bid").removeClass("active"):"";
	$("#my_order_beishu") ? $("#my_order_beishu").removeClass("active"):"";
	$("#my_order") ? $("#my_order").removeClass("active"):"";
	if(current_page=="order_beishu"){
				
	}
	$("#my_assets") ? $("#my_assets").removeClass("active"):"";
	$("#my_3D") ? $("#my_3D").removeClass("active"):"";
	$("#my_message") ? $("#my_message").removeClass("active"):"";
	$("#my_" + current_page).addClass("active") ;
};
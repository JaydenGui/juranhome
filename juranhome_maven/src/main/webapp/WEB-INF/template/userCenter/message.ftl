<#assign baseUrl=request.contextPath />
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/edit_avatar.css">
	<div class="main-content">
		<div class="container" style="min-height: 760px;">
		<div class="loading" id="loading">
    		<img src="${baseUrl}/images/markHall/bx_loader.gif" style="display:inline-block"/>
    	</div>
	    <!-- start: PAGE HEADER -->
	    <div class="">
	        <div class="col-sm-12">
	            <!-- start: PAGE TITLE & BREADCRUMB -->
	            <ol class="breadcrumb">
	                <li><a href="javascript:document.getElementById('mybidlist').click()" style="">
	                    	个人中心
	                </a>  </li>
	                <li class="active">消息中心</li>
	            </ol>
	            <div class="homestyler-title">
	                <h3>消息中心</h3>
	                <div class="row" style="display:none">
	                    <div class="col-md-3 selectDu">
	                        <select name="dd" class="form-control" ng-change="messageSearch(selected)" ng-model="selected" ng-init="selected=0">
	                            <option value="0">全部</option>
	                            <option value="1">已读</option>
	                            <option value="2">未读</option>
	                        </select>
	                    </div>
	                    <div class="col-md-4">
	                       <!--  <div class="input-group">
	                            <span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
	                            <input class="form-control date-range" type="text">
	                        </div> -->
	                        <div id="info-datetimepicker" class="input-group date form_datetime col-md-12" data-date="" data-date-format="yyyy-mm-dd hh:ii" data-link-field="dtp_input1">
								<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
								<input class="form-control" size="20" type="text" value="" >
								<!--<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>-->
							</div>
	                    </div>
	                    <div class="col-md-2"><button class="btn btn-msgSearch clearButton clearButtonStyle" type="button">
	                        	搜索
	                    </button></div>
	                  <!--   <div class="col-md-4"><center><button class="btn btn-bricky btn-success" type="button">
	                      	  删除
	                    </button></center></div> -->
	
	                </div>
	            </div>
	            <!-- end: PAGE TITLE & BREADCRUMB -->
	        </div>
	    </div>
	    <!-- end: PAGE HEADER -->
	    <!-- start: PAGE CONTENT -->
	        <div class="col-sm-12">
	        <!-- end: PANLEL TABS -->
	        <div class="table-list"  style="border:none;">
	            <div class="table-list-body news-center-notice">
	            	<div class="messagenav" class="col-md-12">
	            		<div class="notice">
		                    <ul class="tabs asjfoap" style="border-bottom: 0px!important; margin:0px!important;">
				              <li class="active"><a href="#tab1">系统通知</a></li>
				              <!--li class="shuxian"></li>
				              <li><a href="#tab4">公告</a></li-->
				           </ul>
	                	</div>
	                	<div style="float:right;margin-right:10px;padding:5px;" ng-click="deleteMsg()">
                             <img alt="" src="${baseUrl}/images/global/del_03.png" style="padding-bottom:4px;cursor:pointer;">
                        </div>
						<i class="fa fa-reorder" style="color:#628be8;float:right;margin-top: 5px; width: 80px;">
							<input type="checkbox" ng-model="checkall" ng-click="checkAll(!checkall)" style="cursor:pointer;"><a style="color:#999;display: block;margin-top: 3px;" class="choiceall">全选</a>
						</i>
					</div>
				<div id="tab1" class="tab_content" style="display: block; ">
	                <ul>
	                	<li ng-show="!isShow">
	                		<div style="text-align:center;margin-top:10%;">
			                     <div><img src="${baseUrl}/images/userCenter/rreyeryer_03.png"></div>
				    			 <div style="margin-top:15px; margin-bottom:15px;color:#000;">目前您暂时没有系统通知</div>
			              	</div>	
	                	</li>
	                    <li ng-show="isShow" class="table-list-bdli" ng-repeat="item in messages" ng-cloak>
	                    	<#if users?exists & users.type='member'>
		                        <div class="clearfix">
		                            <div >
		                                <h3><input id="{{item.message_id}}" ng-model="item.isChecked" type="checkbox" style="cursor:pointer;"/>{{item.subject|code2name}}</h3>	   
		                                <span>{{item.body|htmlDecode|getContent:"member"|substr}}</span>                             
		                            </div>
		                            <div ng-click="deleteMsg(item.message_id)">
		                                 <img alt="" src="${baseUrl}/images/global/del_03.png" style="cursor:pointer;">
		                            </div>
		                            <div style="position: absolute;bottom:35px;right:13px">
		                            	<a href="javascript:;" class="btn btnsq">查看详情</a>
		                            </div>
		                        </div>
		                        <div class="control">
		                            <p class="checkon padding8">{{item.body|htmlDecode|getContent:"member"}}</p>
		                        </div>
		                    <#elseif users?exists & users.type='designer'>
		                    	<div class="clearfix">
		                            <div >
		                                <h3><input id="{{item.message_id}}" ng-model="item.isChecked" type="checkbox" style="cursor:pointer;"/>{{item.subject|code2name}}</h3>	   
		                                <span>{{item.body|htmlDecode|getContent:"designer"|substr}}</span>                             
		                            </div>
		                            <div ng-click="deleteMsg(item.message_id)">
		                                 <img alt="" src="${baseUrl}/images/global/del_03.png" style="cursor:pointer;">
		                            </div>
		                            <div style="position: absolute;bottom:35px;right:13px">
		                            	<a href="javascript:;" class="btn btnsq">查看详情</a>
		                            </div>
		                        </div>
		                        <div class="control">
		                            <p class="checkon padding8">{{item.body|htmlDecode|getContent:"designer"}}</p>
		                        </div>
		                    </#if>
	                        <div class="messagetime">{{item.sent_time|str2date|formatdate:"yyyy-MM-dd hh:mm"}}</div>
	                    </li>	                     
	                </ul>
	               </div>
              	   <div id="tab4" class="tab_content" style="display: none; ">
	               		<div class="control" style="background: rgb(245, 245, 245);">
	                            <p class="" style="display: block; min-height:100px; margin-top: 15px; padding: 1%;">尊敬的用户你好，您好，您01月20号的量房订单创建成功，请耐心等待设计师确认。确认后我们会以短信形式和站内信形式通知。请注意查收【居然在线】</p>
	                    </div>
	               </div>
	             </div>
	            <div class="table-list-body news-center-public">
	                暂时没有任何公告
	            </div>
	           <pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" ></pagination>
	
	        </div>
	       </div>
	</div>
  <script type="text/javascript">
      $(function() {
      
        $(".selectDu select").focus(function(){
      	 	$(this).addClass('selected');
      	});
      	$(".selectDu select").on('blur change', function(){
      	 	$(this).removeClass('selected');
      	});
      });
    </script>
    
    
    <script type="text/javascript">
      $(document).ready(function() {
    		  pageActive("message");
          //Default Action
          $(".tab_content").hide(); //Hide all content
          $("ul.tabs li:first").addClass("active").show(); //Activate first tab
          $(".tab_content:first").show(); //Show first tab content

          //On Click Event
          $("ul.tabs li").click(function() {
              $("ul.tabs li").removeClass("active"); //Remove any "active" class
              $(this).addClass("active"); //Add "active" class to selected tab
              $(".tab_content").hide(); //Hide all tab content
              var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
              $(activeTab).fadeIn(); //Fade in the active content
              return false;
          });
      });
	    $(document).on('click','#scrollTopG .scrollTopG',function(){
	   	    $('html,body').animate({scrollTop:0},'slow');
	   	});
  	</script>
 
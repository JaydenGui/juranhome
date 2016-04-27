<#assign baseUrl=request.contextPath/>
<div class="main-content">
	<div class="container" >
        <!-- start: PAGE HEADER -->
        <div class="">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li><a href="javascript:void(0);">
                        	个人中心
                    </a>  </li>
                    <li class="active">
                      	  我的应标
                    </li>
                </ol>
                <div class="homestyler-title">
                    <h3>我的应标</h3>
                    <div class="">
                    <!-- 
                    <div class="col-md-3 selectDu">
                            <select name="dd" class="form-control">
                                <option value="">全部状态</option>
                                <option value="goingon">进行中</option>
                                <option value="finished">已结束</option>
                            </select>
                        </div>
                        <div class="col-md-3 selectDu">
                            <select name="dd" class="form-control">
                                <option value="" selected="">全部时间</option>
                                <option value="residential">1月</option>
                                <option value="catering">2月</option>
                                <option value="office">3月</option>
                                <option value="hotel">4月</option>
                            </select>
                        </div>
                        
                       <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
                                <input class="form-control date-range" type="text">
                            </div>
                        </div>

                        <div class="col-md-3">
                        <button class="btn btn-success" type="button" style="background-color:#0084ff; width:70px; height:35px;  border-radius: inherit; border:none;">搜索</button>
                        </div> -->
                    </div>
                </div>
            </div>
            <!-- end: PAGE TITLE & BREADCRUMB -->
            
        </div>

        <!-- end: PAGE HEADER -->
        <!-- start: PAGE CONTENT -->
        <div>
            <div class="col-md-12" ng-repeat="mymark in mybidlist">
                <!-- start: BASIC TABLE PANEL -->
                <div class="main-content" style="width: 95%; margin-left: 10px;">
                    <div class="row">
                        <div class="col-md-12">
                            <!-- start: BASIC TABLE PANEL -->
                            <div class="panel panel-default">
                                <div class="panel-heading" style="line-height:16px!important;background:#0084ff;color:#fff;">
                                    <p style="font-size:18px;display: inline-block;">{{mymark.needs_name}}</p>
                                    <span class="shopveg" ng-if="mymark.bidder.status==2">消费者已经拒绝您的应标申请</span>
                                    <span class="shopveg" ng-if="mymark.bidder.status==1">请至我的订单查看详情</span> 
                                    <span class="shopveg" ng-if="mymark.bidder.status==3">您已终止此应标</span> 
                                </div>
                                <div class="panel-body">
                                    <table class="table table-hover" id="sample-table-1">
                                        <thead>
                                        <tr>
                                            <th class="col-md-2 ajsfaop">客户信息</th>
                                            <th class="hidden-xs col-md-2 ajsfaop">装修预算</th>
                                            <th class="col-md-2 ajsfaop">发布时间</th>
                                            <th class="hidden-xs col-md-2 ajsfaop">房屋类型</th>
                                            <th class="hidden-xs col-md-2 ajsfaop">状态</th>
                                            <th class="center col-md-2 ajsfaop">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="panel-body-hover">
                                            <td class="col-md-2"><a style="color:#000; text-decoration: none;">&nbsp;&nbsp; {{mymark.user_name}}</a></td>
                                            <td class="col-md-2"> {{mymark.renovation_budget}}</td>
                                            <td class="col-md-2">{{mymark.publish_time}}</td>

                                            <td class="hidden-xs col-md-2">{{mymark.house_type|replaceHouseType}}</td>
                                            <td class="col-md-2">
                                            <span style="color:#0084ff" ng-if="mymark.bidder.status==0">[应标中]</span>
                                            <span style="color:#0084ff" ng-if="mymark.bidder.status==1">[已中标]</span>
                                            <span style="color:#f24713" ng-if="mymark.bidder.status==2||mymark.bidder.status==3">[未中标]</span><br/>                                      
                                                		目前投标人数：{{mymark.bidder_count}}<br>
                                               			 距结束还有 {{mymark.end_day}}天</td>
                                            <td class="center col-md-2">
                                                <div class="visible-md visible-lg hidden-sm hidden-xs">
													<a class="btn btn-green tooltips" href="javascript:void(0)" style="line-height:2;" data-toggle="modal" 
   														data-target="#confirm2"  data-original-title="tooltip" title="查看详情" data-placement="top" ng-click="mybidDetail(mymark.needs_id)">查看详情</a>
                                                </div>
                                                <div class="visible-md visible-lg hidden-sm hidden-xs" style="margin-top:10px;">
													<a class="btn btn-green tooltips" ng-if="mymark.bidder.status==0" data-toggle="modal" data-target="#confirm3" 
													href="javascript:void(0)"  data-original-title="tooltip" title="终止应标" data-placement="top" ng-click="saveneedsid(mymark.needs_id)">终止应标</a>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
           
                                    </table>
                                    <div class="alert alert-info">
										设计宣言：{{mymark.bidder.declaration}}
                                    </div>
                                </div>
                            </div> <!-- end: BASIC TABLE PANEL -->
                        </div>
                    </div>
                </div>
            </div>
       		<div id="noMatch" style="text-align:center;display:none;" ng-if="mybidlist.length<=0" ng-cloak>
                  <div><img src="${baseUrl}/images/userCenter/rreyeryer_03.png"></div>
		   		 <div style="margin-top:15px; margin-bottom:15px;color:#000;">您还没有应标项目，请到应标大厅接单</div>
            </div>
        </div> <!-- end: PAGE CONTENT-->
        <pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" style="margin-bottom:50px; width:100%;'"></pagination>
    </div>
    <div class="paging">
    <!-- .row -->
	
</div>
    
   <div class="modal-dialog modal fade confirmMain" id="confirm3" tabindex="-1" role="dialog" aria-hidden="true" style="position:fixed; top:20%;display:none;">
    <div class="modal-content" style="border:none;">
		<div class="modal-header" style="border:none;padding:25px;padding-bottom:0;">
			<button class="close" aria-hidden="true" type="button" data-dismiss="modal">
				<img src="${baseUrl}/images/userCenter/m-close-icon.png">
			</button>
			<h4 class="modal-title">提示</h4>
		</div>
		<div class="modal-body" style="padding-bottom:0;padding-left:25px">您确定要终止应标吗？</div>
		<div class="modal-footer" style="background:#fff;border:none;">
			<button class="NewBtn btn-defaultClose" type="button" data-dismiss="modal" > 
				取消
			</button>
			<button class="NewBtn btn-primarySubmit" data-dismiss="modal" type="button" ng-click="stopMark()" >
				确定
			</button>
		</div>
	</div>
	</div>
	<!-- /.modal-content -->
    <!--detail start-->
     <div class="modal-dialog modal fade confirmMain" id="confirm2" tabindex="-1" role="dialog" aria-hidden="true" style="position:fixed; top:20%;display:none;">
        <div class="modal-content">
            <div class="modal-header" style="border:none;padding:25px;padding-left:40px;">
	            <button class="close" aria-hidden="true" type="button" data-dismiss="modal" style="margin-top:-10px;">
	                <img src="${baseUrl}/images/userCenter/m-close-icon.png">
	            </button>
	            <!--<h4 class="modal-title">{{mybiddetail.neighbourhoods}}</h4>-->
	            <h4 class="modal-title ng-binding">{{mybiddetail.community_name}}</h4>
				<div class="needs_num ng-binding" style="margin-top:20px">编号: {{mybiddetail.needs_id}}</div>
			</div>
			<div class="modal-body" style="overflow:hidden;padding:0;">
				<div class="col-md-12" style=background:#fff;line-height:15px;">
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">客户姓名&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.contacts_name}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">联系电话&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.contacts_mobile}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址&nbsp;&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.province_name}}{{mybiddetail.city_name}}{{mybiddetail.district_name|replaceNone}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">设计预算&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.design_budget}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">装修预算&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.decoration_budget}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">房屋类型&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.house_type|replaceHouseType}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">房屋面积&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.house_area|replaceArea}} m²</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型&nbsp;&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.room|replaceRoomType}}{{mybiddetail.living_room|replaceBedRoom}}{{mybiddetail.toilet|replaceRestRoom}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">风&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格&nbsp;&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.decoration_style|replaceStyle}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">发布时间&nbsp;:</div>
		            	<div class="col-md-8">{{mybiddetail.publish_time}}</div>
		            </div>
		        </div>    
			</div>
			<div class="modal-footer">
				<div id="poploading" class="poploading"><img src="${baseUrl}/images/global/LoadingCursor2.gif" /></div>
            	<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom"  data-original-title="关闭" >关闭</a>
			
			</div>
       <!--<div class="alert alert-info">
			    设计宣言：{{mybiddetail.bidder_list.deslaration}}
			</div>--> 
        </div> <!-- /.modal-content -->
    </div>
    <!--detail end-->
    
    

    


<script>
   $(function () {
     	$("[data-original-title='tooltip']").tooltip();
   });
   $(".selectDu select").focus(function(){
 	 	$(this).addClass('selected');
 	});
 	$(".selectDu select").on('blur change', function(){
 	 	$(this).removeClass('selected');
 	});
 	$(document).on('click','#scrollTopG .scrollTopG',function(){
 	    $('html,body').animate({scrollTop:0},'slow');
 	});
</script>







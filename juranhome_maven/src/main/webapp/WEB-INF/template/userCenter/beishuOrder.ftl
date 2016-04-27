<#assign baseUrl=request.contextPath />
<div class="main-content">
	<div class="container">
		<!-- start: PAGE HEADER -->
		<div class="">
			<div class="col-sm-12">
			<!-- start: PAGE TITLE & BREADCRUMB -->
					<ol class="breadcrumb" style="padding-left:30px;">
	                    <li><a href="javascript:void(0);">
	                        个人中心
	                    </a>  </li>
	                    <li class="active">
	                        我的订单
	                    </li>
	                </ol>
				<div class="page-header">
					<h3>北舒套餐订单</h3>
					<!--<div class="row">
						<div class="col-md-3">
							<select name="dd"  class="form-control" >
								<option value="">全部状态</option>
	                            <option value="wait_designer_confirm">北舒订单</option>
	                            <option value="wait_designer_confirm">待设计师确认量房</option>
	                            <option value="wait_consumer_pay">待接收</option>
	                            <option value="wait_designer_measure">待设计师量房</option>
	                            <option value="convert_to_design">量房转设计</option>
	                            <option value="wait_first_pay">待接收首款</option>
	                            <option value="wait_last_pay">待接收尾款</option>
	                            <option value="wait_confirm_design">待确认交付物</option>
	                            <option value="complete">设计完成</option>
	                            <option value="cancel">交易取消</option>
							</select>
						</div>-->
						<!-- <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i class="fa fa-calendar"></i> </span>
								<input type="text" class="form-control date-range">
							</div>
						</div>
                		<div class="col-md-2">
                			<button type="button" class="btn btn-success" style="padding:6px 20px;border-radius:0;background: #0084ff;border: medium none #0084ff;">
								搜寻
							</button>
						</div>
				       <!-- <div class="col-md-4">
				        	<a href="#panel-config" data-toggle="modal"  class="btn btn-bricky btn-success" >
								<i class="fa fa-pencil-square"></i>
								<span class="username">新建北舒订单</span>
							</a>
						</div>-->
					</div>
				</div>
			<!-- end: PAGE TITLE & BREADCRUMB -->
			</div>
		
		 <div class="" ng-repeat="order in orders" ng-init="dex = $index">
		    <div class="col-md-12">
		        <!-- start: BASIC TABLE PANEL -->
		        <div class="panel panel-default">
		            <div class="panel-heading" style="padding: 7px 7px;background:#0084ff;color:#fff;height:40px;">
		                <img style="width:24px; height:22px;" src="${baseUrl}/images/userCenter/098.png">
		                <span style="margin-right:18%;display:inline-block;padding-top:2px; vertical-align: middle; width:600px; max-width:600px;">{{order.community_name}}</span><span style="padding-top:2px; vertical-align: middle;">项目编号:{{order.needs_id}}</span>
		                <div class="panel-tools">
		                    <a class="btn btn-xs btn-link panel-expand" href="#">
		                        <i class="fa fa-resize-full"></i>
		                    </a>
		                </div>
		            </div>
		            <div class="panel-body">
		                <table class="table col-md-12" id="sample-table-1">
		                    <thead>
		                    <tr>
		                        <th class="col-md-2">客户姓名</th>
		                        <th class="col-md-2">联系电话</th>
		                        <th class="col-md-2">创建时间</th>
		                        <th class="col-md-2">项目地址</th>
		                       <!-- <th class="hidden-xs col-md-3">设计资料</th>-->
		                        <th class="center col-md-2">操作</th>
		                    </tr>
		                    </thead>
		                    <tbody>
		                    <tr>
		                        <td class="col-md-3"><!-- <a href="pages_messages.html" target="_blank" class="btn btn-xs btn-green tooltips"><i class="clip-bubbles-3 "></i> </a> --><span style="margin-left:12px">{{order.contacts_name}}</span></td>
		                        <td class="col-md-3">{{order.contacts_mobile}}</td>
		                        <td class="col-md-3">{{order.publish_time}}</td>
		                        <td class="col-md-3">{{order.province_name}}{{order.city_name}}{{order.district_name|replaceNone}}</td>
		                        <!--<td class="hidden-xs col-md-3">目前没有资料</td>-->
		                        <td class="center col-md-3">
		                            <div class="visible-md visible-lg hidden-sm hidden-xs listContainer">
		                                <a  ng-if="order.design_asset_id!=undefined"  href="${baseUrl}/3Dscheme/open3Dscheme/hs_design_id/{{order.hs_design_id|replaceNumber}}/acs_asset_id/{{order.design_asset_id}}/acs_project_id/{{order.needs_id}}/"   style="margin-top: 18px;" target="_blank" class="btn btn-xs btn-green tooltips" data-placement="top" data-original-title="进入3D设计">进入3D设计</a>
		                            	<a  ng-if="order.design_asset_id==undefined"  ng-click="getAsset(order.needs_id);"  href="javascript:void(0);"   style="margin-top: 18px;" class="btn btn-xs btn-green tooltips" data-placement="top" data-original-title="进入3D设计">进入3D设计</a>
		                            </div>
		                        </td>
		                    </tr>
		                    </tbody>
		                </table>
		            </div>
		        </div>
		        <!-- end: BASIC TABLE PANEL -->
		    </div>
		</div>
	</div>
	<!-- start: PAGE CONTENT -->
		<pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)"></pagination>
	<!-- end: PAGE HEADER -->
</div>
<script>
$(document).on('click','#scrollTopG .scrollTopG',function(){
    $('html,body').animate({scrollTop:0},'slow');
});
</script>
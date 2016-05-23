   <#assign baseUrl=request.contextPath/>
   <#if users?exists & users.type=='member'>
   <div class="main-content">
		<div class="container">	
			<div>
				<div class="col-sm-12">
  					<div class="container">
						<!-- start: PAGE HEADER -->
						<div>
							<div class="col-sm-12">
								<!-- start: PAGE TITLE & BREADCRUMB -->
								<ol class="breadcrumb">
								  <li><a href="javascript:document.getElementById('myorder').click()">
											个人中心  
										</a>  </li>
								  <li class="active">我的DIY方案</li>
								</ol>
								<div class="page-header">
								  	<h3>我的DIY方案</h3>
	                              <!-- <div class="row">
										<div class="col-md-3">
											<select name="dd"  class="form-control" >
												<option value="">全部收藏时间</option>	
	                                                <option value="ONE_MONTH_INSIDE">1个月以内</option>
	                                                <option value="THREE_MONTHS_INSIDE">3个月以内</option>
	                                                <option value="SIX_MONTHS_INSIDE">6个月以内</option>
	                                                <option value="SIX_MONTHS_OUTSIDE">半年以上</option>
											</select>
										</div>
										<div class="col-md-3">
											<input type="text" placeholder="输入名称、标签搜索"  name="yyyy" class="form-control">
										</div>
	                                       <div class="col-md-3">
	                                       	<button type="button" class="btn btn-primary clearButton clearButtonStyle">
												搜寻
											</button>
										</div>
									</div> -->
								</div>
								<!-- end: PAGE TITLE & BREADCRUMB -->
							</div>
							<!-- end: PAGE HEADER -->
						</div>
							<!-- start: PAGE CONTENT -->
							<div class="row">
								<div class="col-md-12">
								<!-- start: BASIC TABLE PANEL -->
									<div class="modal fade" id="confirm" tabindex="-1" role="dialog" aria-hidden="true" >
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title">温馨小贴士</h4>
												</div>
												<div class="modal-body">
					                            	  您确定要删除这个资料吗？
												</div>
												<div class="modal-footer">
													<button type="button" class="NewBtn btn-defaultClose" data-dismiss="modal">
														关闭
													</button>
													<button type="button" class="NewBtn btn-primarySubmit">
														确定
													</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
									<!-- /.modal-dialog -->
									</div>
									<!-- end: HEADER -->
									<!-- start: MAIN CONTAINER -->
								<div class="" style="margin-top:0px">
										<div class="main-content" style="margin-left:0px; width:100%" ng-cloak>
											<div class="col-md-12 my-diy project-design">
												<div class="col-md-4 col-sm-4 gallery-img" ng-repeat="diy in mydiy" ng-init="index=$index" ng-if="diy.design_file.length>0">
													<a href="${baseUrl}/3Dscheme/open3Dscheme/hs_design_id/{{diy.hs_design_id}}/acs_asset_id/{{diy.design_asset_id}}/acs_project_id/0/" target="_blank" title="图片说明" style="display:inline-block;width:100%;height:195px;">
														<img style="width:100%;height:195px;" ng-src="{{diy.design_file[0].link}}" alt="" >
													</a>
													<p id="designername" style="text-align:center;height:44px;line-height:44px;" ng-bind="diy.design_name"></p> 
												</div>
											</div>
											<!-- end: PAGE CONTENT-->
										</div>
										<!-- end: PAGE -->
									</div>
									<pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" ></pagination>
								<!-- end: BASIC TABLE PANEL -->
							</div>
							</div>
							<!-- end: PAGE CONTENT-->
					</div>
				</div>
			</div>
		</div>
	</div>
<#else>
	<script >
	$(function(){
		location.href = baseUrl+"/";
	});
	</script>
</#if>				
  
    <script src="${baseUrl}/js/userCenter/my-diy.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
		  pageActive("diy");
		  
    });
</script>


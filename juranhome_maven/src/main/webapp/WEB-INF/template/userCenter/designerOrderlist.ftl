<#assign baseUrl=request.contextPath />
<link rel="stylesheet" href="${baseUrl}/css/public/pgwslideshow.min.css">
<div class="main-content">	
	 <div class="modal-dialog modal fade confirmMain" id="measureconfirm" tabindex="-1" role="dialog" aria-hidden="true" style="position:fixed; top:10%;display:none;">
        <div class="modal-content">
            <div class="modal-header" style="border:none;padding:25px;padding-left:45px;">
           		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<img src="${baseUrl}/images/userCenter/m-close-icon.png">
				</button>
				<h4 class="modal-title ng-binding">{{detail.community_name}}</h4>
				<div class="needs_num ng-binding" style="margin-top:20px">项目编号 : {{detail.needs_id}}</div>
			</div>
			<div class="modal-body" style="overflow:hidden;padding:0;">
		        <div class="col-md-12" style=background:#fff;line-height:15px;">
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">客户姓名:</div>
		            	<div class="col-md-8">{{detail.contacts_name}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">联系电话:</div>
		            	<div class="col-md-8">{{detail.contacts_mobile}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">地址:</div>
		            	<div class="col-md-8">{{detail.province_name}}{{detail.city_name}}{{detail.district_name|replaceNone}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">设计预算:</div>
		            	<div class="col-md-8">{{detail.design_budget}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">装修预算:</div>
		            	<div class="col-md-8">{{detail.decoration_budget}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">房屋类型:</div>
		            	<div class="col-md-8">{{detail.house_type|replaceHouseType}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">房屋面积:</div>
		            	<div class="col-md-8">{{detail.house_area|replaceArea}} m²</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">户型:</div>
		            	<div class="col-md-8">{{detail.room|replaceRoomType}}{{detail.living_room|replaceBedRoom}}{{detail.toilet|replaceRestRoom}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">风格:</div>
		            	<div class="col-md-8">{{detail.decoration_style|replaceStyle}}</div>
		            </div>
		        	<div class="col-md-12 confirmform">
		            	<div class="col-md-4">发布时间:</div>
		            	<div class="col-md-8">{{detail.publish_time}}</div>
		            </div>
		            <div class="col-md-12 confirmform" style="color:#0084ff;">
		            	<div class="col-md-4">量房时间:</div>
		            	<div class="col-md-8">{{detail.bidders[0].measure_time}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">量房费:</div>
		            	<div class="col-md-8">{{detail.bidders[0].measurement_fee}}元</div>
		            </div>
	            	<!-- <div class="col-md-12" style="background:#DAEDF8;padding-top:10px;margin-bottom:15px;border-radius:10px">
	                	<p style="color:#5185A4">设计宣言：我超级棒的请选我为您服务，这是我的作品链接</p>
	                	<p style="color:#5185A4">http://www.sj.com</p>
	                </div> -->
		        </div>
	        </div>
            <div class="modal-footer" style="background: #fff; border-radius: 5px;border:none;margin-top:10px;">
            	<div id="poploading" class="poploading" style="display:block"><img src="${baseUrl}/images/global/LoadingCursor2.gif" /></div>
            	<button type="button" class="NewBtn btn-defaultClose" data-dismiss="modal">关闭</button>
            	<button type="button" ng-if="detail.bidders[0].wk_cur_sub_node_id==11" class="NewBtn btn-refuse" data-target="#remind" data-toggle="modal" data-dismiss="modal">
				拒绝
				</button>
				<button type="button" ng-if="detail.bidders[0].wk_cur_sub_node_id==11" class="NewBtn btn-primarySubmit" ng-click="confirm(detail.needs_id,detail.member_id)"  ng-disabled="confirmAbleFlag">
				确认量房
				</button>
            </div>
        </div> 
    </div>
    <div class="modal fade" id="remind" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:100px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title">提示</h4>
				</div>
				<div class="modal-body">
					您确定要拒绝“{{detail.consumer_name}}”的量房邀请吗？
				</div>
				<div class="modal-footer" style="background: #fff;border:none;">
					<button type="button" class="NewBtn btn-defaultClose" data-dismiss="modal" >
						关闭
					</button>
					<button type="button" class="NewBtn btn-primarySubmit" ng-click="refuse(detail.needs_id,detail.member_id)"  ng-disabled="refuseAbleFlag" >
						确定
					</button>
				</div>
			</div>
				<!-- /.modal-content -->
		</div>
			<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
<!-- end: SPANEL CONFIGURATION MODAL FORM -->
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
					您确定要终止项目么？
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
	<!-- /.modal -->
	<!-- end: SPANEL CONFIGURATION MODAL FORM -->
	<div class="modal fade" id="payfinial" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" style="width:1080px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title">接收设计尾款</h4>
				</div>
				<div class="modal-body">  
					<!-- start: PAGE HEADER -->
					<div style=" display:block; width:946px; position:relative ">
						<div style=" position:absolute; right:120px;top:120px ">
							<a href="#finishpay" data-toggle="modal" class="btn btn-lg btn-blue hidden-print" id="paybnnow">
							立即接收 <i class="fa fa-check"></i>
							</a>
						</div> 
						<img src="${baseUrl}/images/userCenter/09-2.jpg">
					</div>
				</div>
				<div class="modal-footer">
	  				<a href="orderlist.html"  class="btn btn-lg btn-red hidden-print">
						稍后付款<i class="clip-close"></i>
					</a>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<div class="modal fade" id="finishpay" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" style="width:1080px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title">接收设计尾款</h4>
				</div>
				<div class="modal-body">  
					<!-- start: PAGE HEADER -->
					<div style=" display:block; width:946px; position:relative ">
						<div style=" position:absolute; left:380px; bottom:150px ">
							<a href="orderlist.html"  class="btn btn-lg btn-blue" >
							进入接收宝 <i class="fa fa-check"></i>
							</a>
						</div> 
						<img src="${baseUrl}/images/userCenter/10-1.jpg">
					</div>
				</div>
				<div class="modal-footer">
	  				<a href="pages_messages11-1.html"  class="btn btn-lg btn-red hidden-print">
						稍后付款<i class="clip-close"></i>
					</a>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	<!-- /.modal-dialog -->
	</div>
	
	
<div class="modal fade" id="contractprompt" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="border:none;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
			</div>
			<div class="modal-body" style="overflow:hidden;">
				<div class="col-md-12">
					<div class="col-md-3">
						<img src="${baseUrl}/images/userCenter/fdstere_03.png" width="100px" height="100px"/>
					</div>
					<div class="col-md-9" style="color:#82c65e;line-height:5;font-size:1.6em;font-weight:bold;">您已成功发送合同</div>
				</div>
			</div>
			<div class="modal-footer" style="border:none;background:#fff;">
				<button type="button" class="NewBtn btn-defaultClose" data-dismiss="modal" >
					关闭
				</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<div class="modal fade confirmMain" id="contract2" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" style="width:900px !important;">
		<div class="modal-content" style="height:700px;">
			<div class="modal-header" style="border:none;padding:25px;">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<img src="${baseUrl}/images/userCenter/m-close-icon.png">
				</button>
				<h4 class="modal-title">设计合同</h4>
			</div>
			<div class="modal-body" style="height:580px;overflow:hidden;"> 
				<!-- start: PAGE HEADER -->
				<div id="sample-table-1">
					<div id="description" style="height:580px;overflow:hidden;">
					<div class="col-sm-12"><div class="row"><div class="contract-title">住宅室内装饰设计合同</div></div></div>	
					<!-- start: PAGE CONTENT -->
					<div class="contract-logo col-sm-12"><img alt="设计家logo" src="${baseUrl}/images/userCenter/contracts_logo.png"></div>
					<input type="hidden" ng-model="contractNumber"> 
					<div class="contract-info col-sm-12"><div class="l">合同编号：<span>{{contractNumber}}</span></div><div class="r">签订时间：<span>{{time|date:'yyyy-MM-dd'}}</span></div></div>
					<div class="row owner-designer-info" id="owner_designer_info">
						<div class="col-sm-6 contract-owner">
							<div  class="name col-sm-12" ng-class="{'conVal':name_error==true}">
								<span class="owderContract">甲方(消费者): </span>
								<span ng-show="status>=41">{{name}}</span>
								<input ng-show="status<41"  ng-class="{'conValInput':name_error==true,'form-control':name_error==false}"   name="pro-name2" id="pro-name" type="text" value="" ng-model="name"  ng-focus="clearError.name();"/>
								<span ng-if="name_error==true" class="conValidation">姓名必填项！</span>
							</div>
							<div class="address col-sm-12">
								<span class="owderContract">装修地址： </span>
								<span ng-show="status>=41">{{addr}}</span>
								<input ng-show="status<41" class="" id="" name="page-cost" type="text" value="" ng-model="addr"  placeholder="{{detail.province_name}}{{detail.city_name}}{{detail.district_name|replaceNone}}" />
							</div>
							<div  class="address col-sm-12"  ng-class="{'conVal':addrDe_error==true}">
								<span class="owderContract">详细地址： </span>
								<span ng-show="status>=41">{{addrDe}}</span>
								<input ng-show="status<41" class="conValInput"  id="" name="pagecost" type="text" value="" ng-model="addrDe" ng-focus="clearError.addrDe();" />
								<span  ng-if="addrDe_error==true"  class="conValidation">详细地址必填项！</span>
							</div>
							<div class="postcode col-sm-12">
								<span class="owderContract">邮政编码 : </span>
								<span ng-show="status>=41">{{zip|replaceNull}}</span>
								<input ng-show="status<41" class="" name="postcode" type="text" value="" ng-model="zip"  placeholder="100007" maxlength="6" />
							</div>
							<div  class="phone col-sm-12" ng-class="{'conVal':mobile_error==true||error==true}">
								<span class="owderContract">手机号码 : </span>
								<span ng-show="status>=41">{{mobile}}</span>
								<input ng-show="status<41" class="conValInput" name="phone" type="text" value="" ng-model="mobile"   maxlength="11" ng-focus="clearError.mobile();" />
								<span ng-if="mobile_error==true" class="conValidation">手机号码必填项！</span>
								<span ng-if="error==true" class="conValidation">手机格式有误！</span>
							</div>
							<div class="mail col-sm-12">
								<span class="owderContract">电子邮箱  : </span>
								<span ng-show="status>=41">{{email|replaceNull}}</span>
								<input ng-show="status<41" class="" name="mail" type="text" value="" ng-model="email"  placeholder="user@customer.cn"/>
							</div>
						</div>
						<div class="col-sm-6 pull-right contract-designer">
							<div class="name col-sm-12">
								<span class="">乙方(设计师):</span>
								<span class="">{{designerInfo.real_name.real_name}}</span>
							</div>
							<div class="address col-sm-12">
								<span class="">服务地址 : </span><span class="">{{detail.province_name}}{{detail.city_name}}{{detail.district_name|replaceNone}}</span>
							</div>
							<div class="address col-sm-12">
								<span class="">详细地址 : </span><span class="">{{addrDe}}</span>
							</div>
							<div class="postcode col-sm-12">
								<span class="">邮政编码 : </span>
								<span class="">{{designerInfo.zip_code}}</span>
							</div>
							<div class="phone col-sm-12">
								<span class="">手机号码 : </span>
								<span class="">{{designerInfo.real_name.mobile_number}}</span>
							</div>
							<div class="mail col-sm-12">
								<span class="">电子邮箱 : </span>
								<span class="">{{designerInfo.email}}</span>
							</div>
						</div>
					</div>
					<div class="row contract-rules">
						<div class="col-md-12">
							<div class="tit">1.设计工作内容</div>
							<div class="text-cont" style="padding-left:6px;">
							<p class="txt"><span class="serial">1.1</span>&nbsp;&nbsp;平面规划设计: 量房后乙方设计师根据甲方提供的需求信息开始平面规划设计，包括设计理念阐述、平面布置图、概念参考图等。甲方书面确认后，平面规划设计完成。</p>
							<span class="serial">1.2</span>&nbsp;&nbsp;甲乙双方协商，乙方应提供给甲方
							<form role="form" class="form-horizontal Act-1-form" style="margin-left:45px;">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="form-field-1">效果图 :</label>
									<div class="col-sm-4 helpInline"><span ng-if="status>=41">{{contract_Data.design_sketch}}</span> 
									<input type="text" placeholder=""  class="form-control" ng-show="status<41"  ng-model="impression" ng-focus="clearError.impressionDrawing();" value=""/>
									<span class="help-inline">张 </span></div>
									<span ng-if="impressionDrawing_error==true" class="formGspan">请填写</span>
									<span ng-if="impressionDrawing_is_number_error==true" class="formGspan">请填写数字</span>
								</div>
							    <div class="form-group">
									<label class="col-sm-3 control-label" for="form-field-1">渲染图 :</label>
									<div class="col-sm-4 helpInline"><span ng-if="status>=41">{{contract_Data.render_map}}</span> <input type="text" placeholder=""  class="form-control" ng-show="status<41" ng-model="diy" ng-focus="clearError.diy();"/><span class="help-inline" >张 </span></div>
									<span ng-if="diy_error==true" class="formGspan">请填写</span>
									<span ng-if="diy_is_number_error==true" class="formGspan">请填写数字</span>
								</div>
							    <div class="form-group">
									<label class="col-sm-3 control-label" for="form-field-1">每增加一张效果图费用 :</label>
									<div class="col-sm-4 helpInline"><span ng-if="status>=41">{{contract_Data.design_sketch_plus|currency : ''}}</span> <input type="text" placeholder="" class="form-control" ng-show="status<41" ng-model="price" ng-focus="clearError.price();"/><span class="help-inline" >元</span></div>
									<span ng-if="price_error==true" class="formGspan">请填写</span>
									<span ng-if="price_is_number_error==true" class="formGspan">请填写数字</span>
								</div>        
							</form>
						</div>
						<div class="tit">2.本项目设计费</div>
						<div>
							<form role="form" class="form-horizontal Act-2-form" style="margin-left:45px;">
								<div class="form-group">
									<label class="col-sm-3 control-label" for="form-field-1"></span>本项目设计费总额：</label>
									<div class="col-sm-4 helpInline"><span ng-if="status>=41">{{totalDesign|currency : ''}}</span><input type="text" ng-show="status<41"  value="" placeholder="" class="inp-input sign-money form-control" ng-model="totalDesign" ng-focus="clearError.totalDesign();"/><span class="help-inline">元 </span></div>
									<span ng-if="totalDesign_error==true" class="formGspan">请填写设计费总额</span>
									<span ng-if="totalDesign_is_number_error==true" class="formGspan">请填写数字</span>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="form-field-1">设计首款 :</label>
									<div class="col-sm-4 helpInline"><input type="text" ng-show="status<41"  placeholder="" value="" class="form-control" ng-model="designFirst" ng-focus="clearError.designFirst();"/><span ng-show="status>=41" >{{designFirst|currency : ''}}</span><span class="help-inline">元 </span></div>
									<span ng-if="designFirst_error==true" class="formGspan">请填写设计首款</span>
									<span ng-if="designFirst_is_number_error==true" class="formGspan">请填写数字</span>
									<span ng-if="designFirst_is_error==true" class="formGspan">首款金额不能小于总金额的80%</span>
									<span ng-if="designFirst_gte_error==true" class="formGspan">首款金额不能大于总金额</span>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="form-field-1">设计尾款 :</label>
									<div class="col-sm-4 helpInline"><input type="text"  ng-show="status<41" class="form-control" value="{{totalDesign-designFirst|currency : ''}}" readonly="readonly" style="background:#fff;"/> <span ng-if="status>=41">{{totalDesign-designFirst|currency : ''}}</span><span class="help-inline">元</span></div>
								</div>        
							</form>
						</div>
					</div>
				</div>
				<div class="row contract-detail" style="margin-top:16px;">
					<div class="col-md-12" style="padding:0;">
						<!-- start: DYNAMIC TABLE PANEL -->
						<div class="panel panel-default">
							<div class="panelAccordionHeading" style="background-color:#0084ff">合同详情
								<div class="contractAccordion">
									<span class="contract-accordion-icon">收起</span><span class="word">展开</span>
								</div>
							</div>
							<div class="panel-body" id="contract-body" style="height:100%">
								<div class="row">
									<div class="col-md-12 space20">
										<div class="btn-group pull-right">	
											<ul class="dropdown-menu dropdown-light pull-right"><li><a href="#" class="export-png" data-table="#sample-table-1">下载图档</a></li></ul>
										</div>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table table-hover" >
										<tbody>
											<tr>
												<td>
													<p class="sign-txt-head">根据《中华人民共和国合同法》，以及其他有关法律、法规规定的原则，结合室内装饰装修的特点，经甲、乙双方友好协商，现就甲方委托乙方承担室内装饰设计（不含结构设计、空调消防系统设计、智能系统设计）事宜达成如下协议。</p>
							    					<div class="sign-txt">
														<p class="txt"><span class="serial">1.2</span>效果设计：平面规划设计确定后，乙方开始效果设计，包括最终平面布置图、空间效果图或使用平台提供的DIY软件生成的渲染图。 </p>
														<!--<p class="txt-small"></p>-->
														<p class="txt"><span class="serial">1.3</span>施工图设计：甲方书面确定方案设计后，乙方开始施工图设计，包括但不限于：（图纸目录、主材明 细表、设计说明、主材告知书、原始测量图、拆除图、新建图、平面布置图、强弱电插座图、开关控制灯具图、综合天花图、水路平面示意图图、地面布置周长面积图、排砖图、墙体饰面图、客厅背景墙详图、节点大样）。</p>
													</div>
												</td>
											</tr>
											<!--<tr>
												<td>
													 <div class="sign-txt">
														<h4 class="tit">2.设计周期</h4>
														<div class="text-cont">
															<p class="txt"><span class="serial">2.2</span>甲方分两个阶段支付设计费，设计周期从甲方付款之日开始计算： </p>
															<table class="table table-hover">
																<thead><tr><th> 设计阶段</th><th> 设计费比例</th><th> 金额（元）</th><th> 付款说明</th></tr></thead>
																<tr><td>平面规划设计</td><td>不低于<span class="red"> 20 %</span></td><td></td><td>线上签订设计合同订单，三日内</td></tr>
																<tr><td>效果及施工图设计</td><td>设计尾款</td><td></td><td>完成效果图及施工图设计后，甲方进行支付尾款，乙方将所有图纸交给甲方</td></tr>
															</table>
															<p></p>
															<p class="txt"><span class="serial">2.3</span>甲方在签合同前已支付的定金或量房费从首期款中扣除。</p>
															<p class="txt"><span class="serial">2.4</span>甲方延期付款,设计周期自动顺延。</p>
															<p class="txt"><span class="serial">2.5</span>如工程地址为乙方服务区域范围以外地区，则乙方人员发生的差旅费用如：长途往返交通（飞机、高铁等）、当地交通、住宿（不低于经济型连锁酒店标准）等由甲方直接承担。</p>
														</div>
													</div> 
												</td>
											</tr>-->
											<tr>
												<td>
													<div class="sign-txt">
														<h4 class="tit">3.甲方责任</h4>
														<div class="text-cont">
															<p class="txt"><span class="serial">3.1</span>甲方应按乙方要求及时、准确且完整的提供设计所需原始户型图等项目建筑基本图纸等资料；</p>
															<p class="txt"><span class="serial">3.2</span>甲方应按约定的日期及金额向乙方支付设计费用； </p>
															<p class="txt"><span class="serial">3.3</span>甲方不得要求乙方设计师违反国家有关标准或规定进行设计；</p>
															<p class="txt"><span class="serial">3.4</span>本工程建筑材料、设备的加工订货如需乙方设计人员配合时，所需费用由甲方承担；</p>
															<p class="txt"><span class="serial">3.5</span>甲方有权对乙方提交的设计方案提出修改调整意见，并享有最终确认权。甲方应于乙方提交设计方案（含修改后方案）后三日内以书面形式或邮件形式提出修改意见或签署确认，但修改调整限定于已选定主调装饰风格范畴内。逾期既未确认又未提出书面修改意见的，视为同意确认该设计图纸或方案；</p>
															<p class="txt"><span class="serial">3.6</span>甲方如需改动承重结构图，由甲方向乙方提供原始结构及原始建筑图，结构改造图纸由专业设计院统一设计和盖章收费，如需乙方进行建筑设计的，则另行协商收费；</p>
															<p class="txt"><span class="serial">3.7</span>如甲方提供原始测量图（乙方未进行现场实地测量），乙方根据甲方提供的原始测量图数据，为甲方出具装饰施工图和约定效果图，相关设计图纸应标明尺寸、材质、用料、颜色 、图标以及设计说明等内容。</p>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="sign-txt">
														<h4>4.乙方责任</h4>
														<div class="text-cont">
															<p class="txt"><span class="serial">4.1</span>如乙方进行现场实地测量，在收取设计费后，根据实际测量与设计方案需要，向甲方提供装饰施工图和约定效果图，相关设计图纸应标明尺寸、材质、用料、颜色 、图标以及设计说明等内容；</p>
															<p class="txt"><span class="serial">4.2</span>乙方应尽职尽责完成设计方案，及时与甲方沟通征求意见并予以修改完善，按照约定向甲方交付和确认设计工程；</p>
															<p class="txt"><span class="serial">4.3</span>在施工过程中，乙方设计师根据具体施工情况与进度，有责任提供不少于3次的现场施工指导或协助解决与设计有关的技术问题，以实现原设计效果；</p>
															<p class="txt"><span class="serial">4.4</span>在装修过程中，如甲方需要，乙方有责任提供在居然在线进行线上推荐选购或陪同甲方在居然之家挑选装饰材料、家具配饰的服务；</p>
															<p class="txt"><span class="serial">4.5</span>对于现场施工服务指导服务和材料挑选服务，如发生在异地的情况，请甲乙双方自行协商。</p>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td> 
													<div class="sign-txt">
														<h4 class="tit">5.合同顺延</h4>
														<div class="text-cont">
															<p class="txt"><span class="serial">5.1</span>甲方发生下列情形之一的，乙方有权顺延设计期限：</p>
															<p class="txt-small">（1）未按照约定支付设计费用的；</p>
															<p class="txt-small">（2）延期提交设计工作所依据的图纸资料的；</p>
															<p class="txt-small">（3）逾期提出修改意见或签署确认书的；</p>
														</div>
													</div>
												</td>
											</tr>
							                <tr>
												<td>
							                    	<div class="sign-txt">
														<h4 class="tit">6.违约责任</h4>
														<div class="text-cont">
															<p class="txt"><span class="serial">6.1</span>因乙方设计未按国家有关设计规定、规范要求而发生错误造成甲方工程质量事故的，乙方除负责采取补救措施外，还应根据损失程度按照国家相关规定向甲方支付赔偿金。</p>
															<p class="txt"><span class="serial">6.2</span>乙方未能按照合同约定的期限完成设计工作内容，甲方可在平台申请退款或向平台客服发起投诉。</p>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="sign-txt">
														<h4 class="tit">7.其他事项</h4>
														<div class="text-cont">
															<p class="txt"><span class="serial">7.1</span>本合同未包含的园林设计和配饰设计另行约定补充协议。</p>
															<p class="txt"><span class="serial">7.2</span>乙方对其为甲方设计的成果依法享有版权，甲方支付全部费用后，设计成果的版权除署名权外均 转让给甲方；但是未经乙方书面允许，甲方不得将本项目设计成果用于其它项目；乙方享有仅在本项目推广及乙方汇编作品集、参展、参赛、出席研讨、行业内报刊投稿、乙方自身宣传中使用的权利，不得用于其它项目。</p>
															<p class="txt"><span class="serial">7.3</span>本合同在履行过程中发生纠纷，甲乙方应及时协商解决。协商不成时，向仲裁委员会申请仲裁； </p>
															<p class="txt"><span class="serial">7.4</span>本合同未尽事宜，双方可签订补充协议作为附件，补充协议与本合同同具有相等效力；</p>
															<p class="txt"><span class="serial">7.5</span>本合同于双方履行完毕各自义务后自动终止； </p>
															<p class="txt"><span class="serial">7.6</span>本合同正本经甲乙双方签章后生效。本合同一式两份，甲方执一份，乙方执一份。</p>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					<!-- end: DYNAMIC TABLE PANEL -->
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 invoice-block" style="text-align:center">
						 <label class="checkbox-inline"><input type="checkbox" class="red" value="" checked="checked" disabled="true">同意 "合同编号：{{contractNumber}}"所有内容</label> 
					</div>      
					<div class="col-sm-5">
						<!-- <label class="checkbox-inline"><input type="checkbox" class="red" value="" checked="checked">选择居然施工</label> -->
					</div>
					<div class="col-sm-12 invoice-block contract-opeartion">								
						<!--<button data-toggle="dropdown" class="btn btn-green dropdown-toggle">下载 <i class="fa fa-angle-down"></i></button>-->
						<a href="javascript:void(0);" class="contract-download" style="margin-right:30px;"><img src="${baseUrl}/images/userCenter/download.png" alt="下载"><span style="vertical-align:middle">下载</span></a>
						<a onclick="javascript:window.print();" class="contract-print"><img src="${baseUrl}/images/userCenter/print.png" alt="打印">&nbsp<span style="vertical-align:middle">打印 </span></a>
					</div>
				</div>
			</div>
			</div>
<!-- end: PAGE CONTENT-->
		</div>
		<!-- <iframe src="contract.html" width="100%" height="500" style="border:none" ></iframe> -->
		<div class="modal-footer">
			<button class="NewBtn btn-defaultClose" aria-hidden="true" data-dismiss="modal" class="close" type="button">关闭</button><!-- data-dismiss="modal" data-toggle="modal" data-target="" -->
			<button class="NewBtn btn-primarySubmit" ng-if="status==21" aria-hidden="true"   ng-disabled="ableFlag"  ng-model="ableFlag"  ng-click="saveContract(needs_id);"  class="close" type="button">创建发送</button><!-- #contractprompt -->
		    <button class="NewBtn btn-primarySubmit" ng-if="status==31" aria-hidden="true"   ng-disabled="ableFlag"  ng-model="ableFlag"  ng-click="saveContract(needs_id);"  class="close" type="button">修改发送</button>
		</div>
	</div>
<!-- /.modal-content -->
</div>
<!-- /.modal-dialog -->
</div>		
	<!--detail start-->
    <div class="modal-dialog modal fade confirmMain" id="confirm9" tabindex="-1" role="dialog" aria-hidden="true" style="position:fixed; top:10%;display:none;">
        <div class="modal-content">
            <div class="modal-header" style="border:none;padding-left:45px;padding:25px;">
           		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					<img src="${baseUrl}/images/userCenter/m-close-icon.png">
				</button>
				<h4 class="modal-title ng-binding">{{detail.community_name}}</h4>
				<div class="needs_num ng-binding" style="margin-top:20px">项目编号 : {{detail.needs_id}}</div>
			</div>
			<div class="modal-body" style="overflow:hidden;padding:0;">
		        <div class="col-md-12" style=background:#fff;line-height:15px;">
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">客户姓名&nbsp;:</div>
		            	<div class="col-md-8">{{detail.contacts_name}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">联系电话&nbsp;:</div>
		            	<div class="col-md-8">{{detail.contacts_mobile}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址&nbsp;&nbsp;:</div>
		            	<div class="col-md-8">{{detail.province_name}}{{detail.city_name}}{{detail.district_name|replaceNone}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">设计预算&nbsp;:</div>
		            	<div class="col-md-8">{{detail.design_budget}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">装修预算&nbsp;:</div>
		            	<div class="col-md-8">{{detail.decoration_budget}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">房屋类型&nbsp;:</div>
		            	<div class="col-md-8">{{detail.house_type|replaceHouseType}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">房屋面积&nbsp;:</div>
		            	<div class="col-md-8">{{detail.house_area|replaceArea}} m²</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型&nbsp;&nbsp;:</div>
		            	<div class="col-md-8">{{detail.room|replaceRoomType}}{{detail.living_room|replaceBedRoom}}{{detail.toilet|replaceRestRoom}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">风&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格&nbsp;&nbsp;:</div>
		            	<div class="col-md-8">{{detail.decoration_style|replaceStyle}}</div>
		            </div>
		            <div class="col-md-12 confirmform">
		            	<div class="col-md-4">发布时间&nbsp;:</div>
		            	<div class="col-md-8">{{detail.publish_time}}</div>
		            </div>
	            	<!-- <div class="col-md-12" style="background:#DAEDF8;padding-top:10px;margin-bottom:15px;border-radius:10px">
	                	<p style="color:#5185A4">设计宣言：我超级棒的请选我为您服务，这是我的作品链接</p>
	                	<p style="color:#5185A4">http://www.sj.com</p>
	                </div> -->
		        </div>
	        </div>
            <div class="modal-footer" style="background: #fff; border-radius: 5px;border:none;margin-top:10px;">
            	<div id="poploading" class="poploading"><img src="${baseUrl}/images/global/LoadingCursor2.gif" /></div>
            	<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom"  data-original-title="关闭" >关闭</a>
            </div>
        </div> 
    </div>
	  <div class="modal fade" id="confirm3" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">北舒套餐 - 创展国际</h4>
				</div>
				<div class="modal-body" style="overflow:hidden">
                   <div class="col-sm-12">
						<table class="table table-condensed table-hover">
							<tbody> 
								<tr>
									<th colspan="3">编号 : 000000001370</th>
								</tr>
								<tr>
									<td>发布时间:</td>
									<td>2015-12-07 14:47
									</td>
									<td></td>
								</tr>
                                <tr>
									<td>客户姓名:</td>
									<td>罗ＯＯ</td>
									<td></td>
								</tr>
                                <tr>
									<td>联系电话:</td>
									<td>18501718133</td>
									<td></td>
								</tr>
								<tr>
									<td>地址:</td>
									<td>北京市东城区、东直门南大街甲3号</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
						<img src="${baseUrl}/images/userCenter/m-close-icon.png">
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
<!-- ==================== -->
<div class="modal fade" id="design-case-list" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" style="top:10%">
		<div class="modal-content">
			<div class="modal-header" style="padding:25px;">
				<button class="close not-transparent" aria-hidden="true" type="button" data-dismiss="modal" style="margin-right: -5px;margin-top: -13px;">
	                <img src="${baseUrl}/images/userCenter/m-close-icon.png"/>
	            </button>
				<h4 class="modal-title">居然大厦</h4>
			</div>			
			<div class="modal-body" style="overflow:hidden">
				<div class="row">
		           <div class="col-sm-12">
						<div class="dclist-panel">
							<div class="panel-heading dclist-paner-heading" style="background:#EAEAEA!important;">交付资料列表
							</div>
							<div class="panel-body">
								<table class="table" style="margin-bottom:10px;">
									<thead><tr><th>资料类别</th><th>资料名称</th><th>操作</th></tr>
									</thead>
									<tbody>
										<tr>
											<td class="center"><img alt="image" src="${baseUrl}/images/userCenter/design_case_icon_01.png" height="48" width="40">
											</td>
											<td>3D 设计方案</td>
											<td class="center" style="color:#1fbad6" onclick="setTimeout('$(window).resize()', 20)">
												<a href="javascript:void(0);" data-toggle="modal" data-target="#confirm10" data-dismiss="modal">
													<img src="${baseUrl}/images/userCenter/design_case_eye_icon.png" alt="查看" id="resizeImg">
												</a>
											</td>
										</tr>
										<tr>
											<td class="center">
												<img alt="image" src="${baseUrl}/images/userCenter/design_case_icon_02.png" height="48" width="40">
											</td>
											<td>渲染图交付</td>
											<td class="center">
												<a id="finialbn02" class="" data-toggle="tooltip" data-placement="bottom" title="上传图片" data-toggle="modal" href="javascript:void(0)" >
													<img src="${baseUrl}/images/userCenter/design_case_eye_icon.png" alt="查看">
												</a>
											</td>
										</tr>
										<tr>
											<td class="center">
												<img alt="image" src="${baseUrl}/images/userCenter/design_case_icon_03.png" height="48" width="40">
											</td>
											<td>设计图纸</td>
											<td class="center">
												<a id="finialbn03" class="" data-toggle="tooltip" data-placement="bottom" data-toggle="modal"  title="未上传" href="javascript:void(0)" >
													<img src="${baseUrl}/images/userCenter/design_case_eye_icon.png" alt="查看">
												</a>
											</td>
										</tr>
										<tr>
											<td class="center">
												<img alt="image" src="${baseUrl}/images/userCenter/design_case_icon_04.png" height="48" width="40">
											</td>
											<td>材料清单</td>
											<td class="center">
												<a id="finialbn03" class="" data-toggle="tooltip" data-placement="bottom" data-toggle="modal"  title="未上传" href="javascript:void(0)" >
													<img src="${baseUrl}/images/userCenter/design_case_eye_icon.png" alt="查看">
												</a>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>  
					</div>
	           </div>
			</div>
			<div class="modal-footer  common-modal-footer" style="padding: 25px 15px;">
				<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose" data-placement="bottom" data-original-title="关闭">关闭</a>
				<!--<a href="javascript:void(0);" class="NewBtn btn-primarySubmit tooltips" data-placement="bottom" data-original-title="提交" >提交</a>-->
			</div>
		</div>
		<!-- .modal-content -->
	</div>
		<!-- .modal-dialog -->
</div>

<div class="modal fade confirmMain" id="confirm10" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="padding:25px;">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal" style="font-size:34px;color:#000;">
	                &times;
	            </button>
	            <div class="close clase1" aria-hidden="true" style="color:#000;font-size:60px;display:none;">&times;退出全屏</div>
				<h4  ng-if="status<51" class="modal-title">{{schemeList.community_name}}</h4>
				<h4  ng-if="status==61" class="modal-title">{{community_name}}</h4>
			</div>
			<div class="modal-body" style="overflow:hidden" style="padding:25px!important;">
	           <div class="col-sm-12" style="padding:0;">
					<div class="panel panel-default col-md-12" style="padding:20px;">
						
						<ul class="pgwSlideshow pgwSlideshower">
						    <li ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==type">
						       <img  ng-src="{{scheme.url}}"  alt="" data-description="" ng-if="scheme.name|deliveryFileBom"/>
						    </li>
						</ul>
					</div>
	           </div>
			</div>
			<div class="modal-footer">
				<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
			</div>
		</div>
	</div>
</div> 	

<div id="windowImg" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="z-index:999999999999;background:#09091A;">
	<div style="position:absolute;right:50px;top:50px;z-index:2;">
		<button class="close" aria-hidden="true" type="button" data-dismiss="modal" data-toggle="modal" data-target="#confirm10" style="font-size:34px;color:#fff;" onclick="setTimeout('$(window).resize()', 10)">
            &times;
        </button>
	</div>
	<div class="windowImages" style="width:100%;margin:50px auto 0;overflow:hidden;">
		<ul class="pgwSlideshow pgwSlideshower">
		    <li ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==type">
		        <img ng-src="{{scheme.url}}" alt="" data-description="" style="width:80%;height:40%;" ng-if="scheme.name|deliveryFileBom"/>
		   </li>
		</ul>
	</div>
</div>


<div class="modal fade confirmMain" id="confirm8" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%">
	<div class="modal-dialog" style="width:800px">
		<div class="modal-content">
			<div class="modal-header" style="padding:25px;" ng-if="schemeList.design_file.length>0&&is_designdrawing">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal">
	                <img src="${baseUrl}/images/userCenter/m-close-icon.png"/>
	            </button>
				<h4 class="modal-title">{{community_name}}</h4>
			</div>
			<div class="modal-header" style="padding:25px;background:#0084ff;color:#fff;border-radius:4px 4px 0 0" ng-if="schemeList.design_file.length<=0||!is_designdrawing" ng-cloak>
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal" style="font-size:32px;color:#fff;margin-top:-6px;">
	                <img src="${baseUrl}/images/userCenter/m-close-icon1.png"/>
	            </button>
				<h5 class="modal-title">您还没有完善交付资料，请到“个人中心>>我的设计方案”上传后再试</h5>
			</div>
			<div class="modal-body col-md-12" style="overflow:hidden">
	           <div class="col-sm-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="border:none;background:#eaeaea!important;color:#333!important;">
								交付资料列表
							<div class="panel-tools"> </div>
						</div>
						<div class="panel-body">
							<table id="sample-table-2" class="table table-striped" style="vertical-align:middle; text-align:center;background:#fff;margin-bottom:0;">
								<thead>
									<tr>
										<th class="col-md-4">资料类别</th>
										<th class="col-md-4">资料名称</th>
										<th class="col-md-4">操作</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-if="type==1">
										<td class="center">
											<img alt="image" src="${baseUrl}/images/global/designerIcon(3).png" height="48" width="40">
										</td>
										<td>3D 设计方案</td>
										<td class="center" style="color:#1fbad6">
											<a href="javascript:void(0);" ng-if="schemeList.design_file.length>0&&is_diy" data-toggle="modal" data-target="#confirm7" data-dismiss="modal" href="javascript:void(0)">
												<img src="${baseUrl}/images/global/upload_01.png" height="28" width="28" alt="">
											</a>
											<a href="javascript:void(0);" ng-if="schemeList.design_file.length==0||!is_diy" data-toggle="tooltip" title="未上传" data-placement="bottom">
												<img src="${baseUrl}/images/global/upload_02.png" height="28" width="28" alt="">
											</a>
										</td>
									</tr>
									<tr ng-if="type==1">
										<td class="center">
											<img alt="image" src="${baseUrl}/images/global/designerIcon(1).png" height="48" width="40">
										</td>
										<td>渲染图交付</td>
										<td class="center">
											<a  class="tooltips" ng-if="schemeList.design_file.length>0&&is_bom" data-toggle="modal" data-dismiss="modal" data-target="#confirm6"  title="已上传" href="javascript:void(0)" >
												<img src="${baseUrl}/images/global/upload_01.png" height="28" width="28" alt="">
											</a>
											<a  class="tooltips" ng-if="schemeList.design_file.length==0||!is_bom" href="javascript:void(0)">
												<img src="${baseUrl}/images/global/upload_02.png" height="28" width="28" alt="">
											</a>
										</td>
									</tr>
									<tr>
										<td class="center">
											<img alt="image" src="${baseUrl}/images/global/designerIcon(2).png" height="48" width="40">
										</td>
										<td>设计图纸</td>
										<td class="center">
											<a  class="tooltips" ng-if="schemeList.design_file.length>0&&is_designdrawing" data-toggle="modal" data-target="#confirm5" data-dismiss="modal" title="已上传" href="javascript:void(0)" >
												<img src="${baseUrl}/images/global/upload_01.png" height="28" width="28" alt="">
											</a>
											<a  class="tooltips" ng-if="schemeList.design_file.length==0||!is_designdrawing" title="未上传" href="javascript:void(0)">
												<img src="${baseUrl}/images/global/upload_02.png" height="28" width="28" alt="">
											</a>
										</td>
									</tr>
									<tr ng-if="type==1">
										<td class="center">
											<img alt="image" src="${baseUrl}/images/global/designerIcon(4).png" height="48" width="40">
										</td>
										<td>材料清单</td>
										<td class="center">
											<a id="finialbn03"  ng-if="schemeList.design_file.length>0&&is_forageList"  class="tooltips" data-toggle="modal" data-target="#confirm4" data-dismiss="modal"  title="已上传" href="javascript:void(0)" >
												<img src="${baseUrl}/images/global/upload_01.png" height="28" width="28" alt="">
											</a>
											<a class="tooltips" ng-if="schemeList.design_file.length==0||!is_forageList" title="未上传" href="javascript:void(0)">
												<img src="${baseUrl}/images/global/upload_02.png" height="28" width="28" alt="">
											</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
	           </div>
			</div>
			<div class="modal-footer" style="background:#fff;border:none;">
				<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="type==1"  class="NewBtn btn-primarySubmit tooltips"  ng-disabled="goAbleFlag" data-placement="bottom" data-original-title="发送"  ng-click="saveDesignDelivery();" ng-disabled="schemeList.design_file.length==0||!is_forageList||!is_diy||!is_designdrawing||!is_bom" >发送</a>
				<a href="javascript:void(0);" ng-if="type==0"  class="NewBtn btn-primarySubmit tooltips"  ng-disabled="goAbleFlag" data-placement="bottom" data-original-title="发送"  ng-click="saveDesignDelivery();" ng-disabled="schemeList.design_file.length==0||!is_designdrawing" >发送</a>
			</div>
		</div>
	</div>
</div>	
	
<div class="modal fade confirmMain" id="confirm7" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="padding:25px;">
				<button class="close" ng-if="type<2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;">
	                &times;
	            </button>
	            <button class="close" ng-if="type==2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;">
	                &times;
	            </button>
				<h4 class="modal-title">{{schemeList.community_name}}</h4>				
			</div>
			<div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
	           <div class="col-sm-12" style="padding:0;">
					<div class="panel panel-default" style="height:400px;">
						<div class="panel-heading" style="border:none;">
								3D 设计方案
							<div class="panel-tools"> </div>
						</div>
						<!--  Submit deliverables  -->
						<div class="panel-body wrapper" id="description" ng-if="schemeList.design_file.length>0&&status>=51&&status<61">
						    <input type="hidden" name="bom" id="diy" />
							<div href="javascript:void(0)" class="planfloat planfloater" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==10">
								<div class="plan">
									<span class="planSpanSelected" id="{{scheme.id}}"></span>
									<a href="javascript:void(0);"><!-- ${baseUrl}/3Dscheme/open3Dscheme/hs_design_id/{{schemeList.hs_design_id}}/acs_asset_id/{{asset_id}}/acs_project_id/{{needs_id}}/ -->
									  <img ng-src="{{scheme.link}}" height="110" width="146" alt="">
									</a>
								</div>
								<div class="center">{{schemeList.community_name}}{{index+1}}</div>
							</div>
						</div>
						<!-- View delivery -->
						<div class="panel-body wrapper" id="description" ng-if="status==61">
							<div href="javascript:void(0)" class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==10">
								<div class="plan">
									<a href="${baseUrl}/3Dscheme/open3Dscheme/hs_design_id/{{schemeList.hs_design_id}}/acs_asset_id/{{asset_id}}/acs_project_id/{{needs_id}}/" >
									  <img ng-src="{{scheme.url}}" height="110" width="146" alt="">
									</a>
								</div>
								<div class="center">{{schemeList.community_name}}{{index+1}}</div>
							</div>
						</div>
					</div>
	           </div>
			</div>
			<div class="modal-footer">
				<a href="javascript:void(0);" ng-if="type<2" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-toggle="modal" data-target="#confirm8" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="type==2" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-toggle="modal" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="status>=51&&status<61" class="NewBtn btn-primarySubmit tooltips" data-placement="bottom" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" data-original-title="提交" ng-click="submit(1);" >提交</a>
			</div>
		</div>
	</div>
</div>	
	
<div class="modal fade confirmMain" id="confirm6" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="padding:25px;">
				<button class="close" aria-hidden="true" ng-if="type<2" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;">
	                &times;
	            </button>
	            <button class="close" aria-hidden="true" ng-if="type==2" type="button" data-toggle="modal" data-dismiss="modal" style="font-size:34px;color:#000;">
	                &times;
	            </button>
				<h4  ng-if="status<51" class="modal-title">{{schemeList.community_name}}</h4>
				<h4  ng-if="status==61" class="modal-title">{{community_name}}</h4>
			</div>
			<div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
	           <div class="col-sm-12" style="padding:0;">
					<div class="panel panel-default" style="height:400px;">
						<div class="panel-heading" style="border:none;">
								{{schemeList.community_name}}方案一 &gt; 渲染图
							<div class="panel-tools"> </div>
						</div>
						
						<!--  Submit deliverables  -->
						<div class="panel-body wrapper" id="description" ng-if="status>=51&&status<61" style="padding:20px;">
						    <input type="hidden" name="bom" id="bom" />
							<div href="javascript:void(0)" class="planfloat planfloater" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==0" style="margin-right:5px;">
								<div class="plan">
									<span  class="planSpanSelected" id="{{scheme.id}}"></span>
									<a href="javascript:void(0)" data-toggle="nodal" data-target="#confirm10"  ><img ng-src="{{scheme.link}}" height="110" width="146" alt=""></a>
								</div>
								<div class="center">{{scheme.name}}</div>
							</div>
						</div>
						
						<!-- View delivery -->
						<div class="panel-body wrapper" id="description" ng-if="status==61" style="padding:20px;">
							<div class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==0" style="margin-right:5px;">
								<div class="plan">
									<img ng-src="{{scheme.url}}" height="110" width="146" alt="" data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-click="enlargePicture(scheme.usage_type);">
								</div>
								<div class="center">渲染{{index+1}}</div>
							</div>
						</div>
					</div>
	           </div>
			</div>
			<div class="modal-footer">
				<a href="javascript:void(0);" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="type==2" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="status>=51&&status<61" class="NewBtn btn-primarySubmit tooltips" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" data-placement="bottom" data-original-title="提交" ng-click="submit(2);" >提交</a>
			</div>
		</div>
	</div>
</div> 	
	
<div class="modal fade confirmMain" id="confirm5" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="padding:25px;">
				<button class="close" ng-if="type<2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;">
	                &times;
	            </button>
	            <button class="close" ng-if="type==2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" style="font-size:34px;color:#000;">
	                &times;
	            </button>
				<h4  ng-if="status<51" class="modal-title">{{schemeList.community_name}}</h4>
				<h4  ng-if="status==61" class="modal-title">{{community_name}}</h4>
			</div>
			<div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
	           <div class="col-sm-12" style="padding:0;">
					<div class="panel panel-default" style="height:400px;">
						<div class="panel-heading" style="border:none;">
								设计图纸
							<div class="panel-tools"> </div>
						</div>
						
						<!--  Submit deliverables  -->
						<div class="panel-body wrapper" id="description" ng-if="status>=51&&status<61||status==33" style="padding:20px;">
							 <input type="hidden" ng-model="designdrawing" id="designdrawing" />
							<div class="planfloat planfloater" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==3" style="margin-right:5px;">
								<div class="plan">
									<span class="planSpanSelected" id="{{scheme.id}}"></span>
									<a href="javascript:void(0)" data-toggle="nodal" data-target="#confirm10"><img ng-src="{{scheme.link}}"  height="110" width="146" alt="" ></a>
								</div>
								<div class="center">设计图纸</div>
							</div>
						</div>
						<!-- View delivery -->
						<div class="panel-body wrapper" id="description" ng-if="status==61" style="padding:20px;">
							<div class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==3" style="margin-right:5px;">
								<div class="plan">
									<img ng-src="{{scheme.url}}"  height="110" width="146" alt="" data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-click="enlargePicture(scheme.usage_type);">
								</div>
								<div class="center">设计图纸</div>
							</div>
						</div>
					</div>
	           </div>
			</div>
			<div class="modal-footer">
				<a href="javascript:void(0);" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="type==2" data-toggle="modal" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="status>=51&&status<61||status==33" class="NewBtn btn-primarySubmit tooltips" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" data-placement="bottom" data-original-title="提交" ng-click="submit(3);" >提交</a>
			</div>
		</div>
	</div>
</div> 


<div class="modal fade confirmMain" id="viewConfirm5" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="padding:25px;">
				<button class="close" ng-if="type<2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;">
	                &times;
	            </button>
	            <button class="close" ng-if="type==2" aria-hidden="true" type="button" data-toggle="modal" data-dismiss="modal" style="font-size:34px;color:#000;">
	                &times;
	            </button>
				<h4  class="modal-title">{{community_name}}</h4>
			</div>
			<div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
	           <div class="col-sm-12" style="padding:0;">
					<div class="panel panel-default" style="height:400px;">
						<div class="panel-heading" style="border:none;">
								设计图纸
							<div class="panel-tools"> </div>
						</div>
						<div class="panel-body wrapper" id="description" style="padding: 20px">
							<div class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==3"  style="margin-right:5px;">
								<div class="plan">
									<img ng-src="{{scheme.url}}"  height="110" width="146" alt="" data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-click="enlargePicture(scheme.usage_type);" >
								</div>
								<div class="center">设计图纸</div>
							</div>
						</div>
					</div>
	           </div>
			</div>
			<div class="modal-footer">
				<a href="javascript:void(0);" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="type==2" data-toggle="modal" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
			</div>
		</div>
	</div>
</div> 


<div class="modal fade confirmMain" id="confirm4" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="padding:25px;">
				<button class="close" aria-hidden="true" type="button" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" style="font-size:34px;color:#000;">
	                &times;
	            </button>
	            <button class="close" aria-hidden="true" ng-if="type==2" type="button" data-toggle="modal" data-dismiss="modal" style="font-size:34px;color:#000;">
	                &times;
	            </button>
				<h4  ng-if="status<51" class="modal-title">{{schemeList.community_name}}</h4>
				<h4  ng-if="status==61" class="modal-title">{{community_name}}</h4>
			</div>
			<div class="modal-body col-md-12" style="overflow:hidden" style="padding:25px!important;">
	           <div class="col-sm-12" style="padding:0;">
					<div class="panel panel-default" style="height:400px;">
						<div class="panel-heading" style="border:none;">
								材料清单
							<div class="panel-tools"> </div>
						</div>
						<!-- Submit deliverables -->
						<div class="panel-body wrapper" id="description" ng-if="status>=51&&status<61" style="padding:20px;">
						    <input type="hidden" name="forageList" id="forageList" />
							<div class="planfloat planfloater" ng-repeat="scheme in schemeList.design_file" ng-init="index=$index" ng-if="scheme.type==2" style="margin-right:5px;">
								
								<div class="plan">
									 <span class="planSpanSelected" id="{{scheme.id}}"></span>
									 <a href="javascript:void(0);"  ng-if="scheme.link|deliveryFileType" class="imgStyle"><img ng-src="{{scheme.link|deliveryFileUrl}}" alt="" ></a>
									 <img ng-src="{{scheme.link|deliveryFileUrl}}" ng-if="scheme.link|deliveryFileBom"  height="110" width="146" alt="" >
								</div>
								
								<div class="center">材料清单</div>
							</div>
						</div>
						<!-- View delivery -->
						<div class="panel-body wrapper" id="description" ng-if="status==61" style="padding:20px;">
							<div class="centerMagin">
								<div class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==2" style="margin-right:5px;">
									<div class="plan" ng-if="scheme.name|deliveryFileType">
										<a href="{{scheme.url}}" class="imgStyle"><img ng-src="{{scheme.url|deliveryFileUrl}}" alt="" ></a>
									</div>
									
									<div class="plan" ng-if="scheme.name|deliveryFileBom">
										<img ng-src="{{scheme.url|deliveryFileUrl}}"  height="110" width="146" alt="" data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-click="enlargePicture(scheme.usage_type);">
									</div>
									<div class="center">材料清单</div>
								</div>
							</div>
						</div>
					</div>
	           </div>
			</div>
			<div class="modal-footer">
				<a href="javascript:void(0);" ng-if="type<2" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="status>=61" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				<a href="javascript:void(0);" ng-if="status>=51&&status<61" class="NewBtn btn-primarySubmit tooltips" data-toggle="modal" data-dismiss="modal" data-target="#confirm8" data-placement="bottom" data-original-title="提交" ng-click="submit(4);" >提交</a>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
	<!--   0000000000    -->
	
	<div class="container">
		<!-- start: PAGE HEADER -->
		<div class="">
			<div class="col-sm-12">
			<!-- start: PAGE TITLE & BREADCRUMB -->
					<ol class="breadcrumb">
	                    <li><!--  <em class="clip-file"></em>  --><a href="javascript:document.getElementById('mybidlist').click()">
	                        个人中心
	                    </a>  </li>
	                    <li class="active">
	                        我的订单
	                    </li>
	                </ol>
				<div class="homestyler-title">
					<h3 style="color:#000">我的订单</h3>
					<!-- <div class="row">
						<div class="col-md-4 selectDu">
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
						</div>
						<div class="col-md-4 selectDu">
							<select name="dd"  class="form-control" >
								<option value="">全部创建时间</option>
	                            <option value="">X4创建时间</option>
	                            <option value="">X3创建时间</option>
	                            <option value="">X1创建时间</option>
	                            <option value="">X2创建时间</option>
							</select>
						</div>
                		<div class="col-md-2">
                			<button type="button" class="btn btn-primary clearButton clearButtonStyle" style="padding:6px 20px;color:#000;background:#fff!important;border:1px solid #ccc!important;">
								搜索
							</button>
						</div>
					</div> -->
					
				</div>
			<!-- end: PAGE TITLE & BREADCRUMB -->
			</div>
		</div>
		<!-- end: PAGE HEADER -->
		<!-- start: PAGE CONTENT -->
		<!--   没有装修项目时的提示信息        -->
		<div id="noMatch" class="row" style="display:none;margin:80px auto 0;" ng-show="orders.length==0" ng-cloak>
			<div class="center" style="margin-bottom:20px;"><img src="${baseUrl}/images/global/prompt_11.png" /></div>
			<div class="center" style="color:#333">您还没有装修项目，请到应标大厅接单</div>
		</div>
				 <div class="desOrder" ng-repeat="order in orders" ng-if="orders.length>0" ng-cloak>
				    <div class="col-md-12">
				        <!-- start: BASIC TABLE PANEL -->
				        <div class="panel panel-default re-panel">
				            <div class="panel-heading ordert-title" style="height:39px">
				               <div style="float:left; font-size:14px;color:#fff;line-height:20px!important">{{order.community_name}}</div>
							   <div id="orderItemNum" style="" > 项目编号:{{order.needs_id}}</div>
				            </div>
				            <div class="panel-body">
				                <div id="wizard" class="swMain desMain" style="margin:25px 0 30px;">
				                    <ul style="margin-left:-5%;">
				                    	<!-- 步骤1 -->
				                        <li>
				                            <a href="javascript:void(0);" class="selected">
				                                <div class="stepNumber" ng-if="order.bidders[0].wk_cur_sub_node_id<13||order.bidders[0].wk_cur_sub_node_id==''" style="border-width:3px;">
				                                    1
				                                </div>
				                                <div class="stepNumber stepNumberColor" ng-if="order.bidders[0].wk_cur_sub_node_id>12"  style="border-width:3px;">
				                                    <div class=""><i class="clip-checkmark-2" ></i></div>
				                                </div>
				                                <span class="stepDesc"> 确认量房 </span>
				                            </a>
				                        </li>
				                        <li>
				                            <a href="javascript:void(0);" ng-class="{selected:order.bidders[0].wk_cur_sub_node_id>12}">
				                                <div class="stepNumber" ng-if="order.bidders[0].wk_cur_sub_node_id<21" style="border-width:3px;">
				                                    2
				                                </div>
				                                <div class="stepNumber stepNumberColor" ng-if="order.bidders[0].wk_cur_sub_node_id>=21"  style="border-width:3px;">
				                                    <div class="stepNumberColor2"><i class="clip-checkmark-2" ></i></div>
				                                </div>
												<span class="stepDesc"> 接收量房费
													<br />
													<small></small>
												</span>
				                            </a>
				                        </li>
				                        <li>
				                            <a href="javascript:void(0);" ng-class="{selected:order.bidders[0].wk_cur_sub_node_id>20}">
				                                <div class="stepNumber" style="border-width:3px;" ng-if="order.bidders[0].wk_cur_sub_node_id<31||order.bidders[0].wk_cur_sub_node_id==33">
				                                    3
				                                </div>
				                                 <div class="stepNumber stepNumberColor" ng-if="order.bidders[0].wk_cur_sub_node_id>=31&&order.bidders[0].wk_cur_sub_node_id!=33"  style="border-width:3px;">
				                                    <div class=""><i class="clip-checkmark-2" ></i></div>
				                                </div>
													<span class="stepDesc"> 创建设计合同
														<br />
													<small></small> </span>
				                            </a>
				                        </li>
				                        <li>
				                            <a href="javascript:void(0);" ng-class="{selected:order.bidders[0].wk_cur_sub_node_id>=31&&order.bidders[0].wk_cur_sub_node_id!=33}">
				                                <div class="stepNumber" style="border-width:3px;" ng-if="order.bidders[0].wk_cur_sub_node_id<41">
				                                    4
				                                </div>
				                                <div class="stepNumber stepNumberColor" ng-if="order.bidders[0].wk_cur_sub_node_id>=41"  style="border-width:3px;">
				                                    <div class=""><i class="clip-checkmark-2" ></i></div>
				                                </div>
														<span class="stepDesc"> 接收设计首款
															<br />
															<small></small> </span>
				                            </a>
				                        </li>
				                        <li>
				                            <a href="javascript:void(0);" ng-class="{selected:order.bidders[0].wk_cur_sub_node_id>=41}">
				                                <div class="stepNumber" style="border-width:3px;" ng-if="order.bidders[0].wk_cur_sub_node_id<51">
				                                    5
				                                </div>
				                                <div class="stepNumber stepNumberColor" ng-if="order.bidders[0].wk_cur_sub_node_id>=51"  style="border-width:3px;">
				                                    <div class=""><i class="clip-checkmark-2" ></i></div>
				                                </div>
														<span class="stepDesc"> 接收设计尾款
															<br />
															<small></small> </span>
				                            </a>
				                        </li>
				                        <li>
				                            <a href="javascript:void(0);" ng-class="{selected:order.bidders[0].wk_cur_sub_node_id>=51}">
				                                <div class="stepNumber" style="border-width:3px;" ng-if="order.bidders[0].wk_cur_sub_node_id<61">
				                                    6
				                                </div>
				                                <div class="stepNumber stepNumberColor" ng-if="order.bidders[0].wk_cur_sub_node_id>=61"  style="border-width:3px;">
				                                    <div class=""><i class="clip-checkmark-2" ></i></div>
				                                </div>
												<span class="stepDesc"> 上传设计交付物
												<br/>
												<small></small> </span>
				                            </a>
				                        </li>
				                    </ul>
				                </div>
				                <hr style="border-width:2px;margin-top:25px;width:97.8%;margin-left:0.8%;margin-bottom:30px;"/>
				                <table class="table designerTable" id="sample-table-1"> 
				                    <thead>
				                    <tr>
				                        <th class="col-md-2">客户信息</th>
				                        <th class="hidden-xs col-md-3">项目金额</th>
				                        <th class="col-md-3">创建时间</th>
										<th class="col-md-3">项目状态</th>
				                        <th class="center col-md-3 " style="text-align:center !important">操作</th>
				                    </tr>
				                    </thead>
				                    <tbody>
				                    <tr>
				                        <td class="col-md-2">{{order.contacts_name}}</td>
				                        <td class="col-md-3" ng-if="order.bidders[0].wk_cur_sub_node_id<31||order.bidders[0].wk_cur_sub_node_id==''">
					                        <span ng-if="order.bidders[0].wk_cur_sub_node_id==11||order.bidders[0].wk_cur_sub_node_id==''||order.bidders[0].wk_cur_sub_node_id==12">量房费  ：￥{{order.bidders[0].payment.measurement_fee}}</span>
					                        <span ng-if="order.bidders[0].wk_cur_sub_node_id==13">等待接受量房费  ：{{order.bidders[0].measurement_fee|currency : '￥'}}</span>
					                        <span ng-if="order.bidders[0].wk_cur_sub_node_id==21">已付量房费：{{order.bidders[0].measurement_fee|currency : '￥'}}</span>
					                        <span ng-if="order.bidders[0].wk_cur_sub_node_id==22">已付量房费  ：{{order.bidders[0].measurement_fee|currency : '￥'}}</span>
				                        </td>
				                        <td class="col-md-3" ng-if="order.bidders[0].wk_cur_sub_node_id>=31">
					                                                                                    总金额 <span ng-if="order.bidders[0].wk_cur_sub_node_id!=33">{{order.bidders[0].design_contract[0].contract_charge|currency : '￥'}}</span><span ng-if="order.bidders[0].wk_cur_sub_node_id==33">￥ 0.00</span><br>
											已付金额 <span ng-if="order.bidders[0].wk_cur_sub_node_id==31||order.bidders[0].wk_cur_sub_node_id==33">￥ 0.00</span><span ng-if="order.bidders[0].wk_cur_sub_node_id==41">{{order.bidders[0].design_contract[0].contract_first_charge|currency : '￥'}}</span ><span ng-if="order.bidders[0].wk_cur_sub_node_id>=51">{{order.bidders[0].design_contract[0].contract_charge|currency : '￥'}}</span><br>
											未付金额 <span ng-if="order.bidders[0].wk_cur_sub_node_id==31">{{order.bidders[0].design_contract[0].contract_first_charge|currency : '￥'}}</span><span ng-if="order.bidders[0].wk_cur_sub_node_id>=51">￥0.00</span><span ng-if="order.bidders[0].wk_cur_sub_node_id==41">{{order.bidders[0].design_contract[0].contract_charge-order.bidders[0].design_contract[0].contract_first_charge|currency : '￥'}}</span><span ng-if="order.bidders[0].wk_cur_sub_node_id==33">￥ 0.00</span><br>
											待付金额<span ng-if="order.bidders[0].wk_cur_sub_node_id==31">{{order.bidders[0].design_contract[0].contract_first_charge|currency : '￥'}}</span><span ng-if="order.bidders[0].wk_cur_sub_node_id>=51">￥0.00</span><span ng-if="order.bidders[0].wk_cur_sub_node_id==41">{{order.bidders[0].design_contract[0].contract_charge-order.bidders[0].design_contract[0].contract_first_charge|currency : '￥'}}</span><span ng-if="order.bidders[0].wk_cur_sub_node_id==33">￥ 0.00</span>
				                        </td>
				                        <td class="col-md-3">{{order.publish_time}}</td>
				                        <td class="col-md-2">
				                                <span ng-if="order.bidders[0].wk_cur_sub_node_id==11||order.bidders[0].wk_cur_sub_node_id==''">待确认量房</span>
				                                <span ng-if="order.bidders[0].wk_cur_sub_node_id==13">等待接收量房费</span>
				                                <span ng-if="order.bidders[0].wk_cur_sub_node_id==21">接收量房费</span>
				                                <span ng-if="order.bidders[0].wk_cur_sub_node_id==22">已付量房费</span>
				                                <span ng-if="order.bidders[0].wk_cur_sub_node_id==31">创建设计合同</span>
				                                <span ng-if="order.bidders[0].wk_cur_sub_node_id==41">接收项目首款</span>
				                                <span ng-if="order.bidders[0].wk_cur_sub_node_id==51">接收项目尾款</span> 
				                                <span ng-if="order.bidders[0].wk_cur_sub_node_id==61">上传设计交付物</span>
				                                <span ng-if="order.bidders[0].wk_cur_sub_node_id==33">项目结束</span>
				                        </td>
				                        <td class="col-md-2">
				                            <div class="visible-md visible-lg hidden-sm hidden-xs listContainer">
				                                <a href="javascript:;" ng-if="order.bidders[0].wk_cur_sub_node_id==11" data-target="#measureconfirm" data-toggle="modal" class="btn btn-sm btn-info tooltips orderBut" data-placement="top"  ng-click="orderDetail(order.needs_id)" data-original-title="确认量房">确认量房</a>
				                               	<a href="javascript:void(0);" ng-if="order.bidders[0].wk_cur_sub_node_id>=21" style="margin-top: 5px!important;" class="btn btn-sm btn-primary tooltips orderBut" data-placement="top" data-original-title="进入3D设计"  ng-click="getAsset(order.needs_id);">进入3D设计</a>
				                                <a href="javascript:;" ng-if="order.bidders[0].wk_cur_sub_node_id>=21&&order.bidders[0].wk_cur_sub_node_id<31" data-target="#contract2" data-toggle="modal"  style="margin-top: 5px!important;" class="btn btn-sm btn-info tooltips orderBut" data-placement="top"  data-original-title="创建设计合同" ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,1,order.bidders[0].design_contract);">创建设计合同</a>
				                                <a href="javascript:;" ng-if="order.bidders[0].wk_cur_sub_node_id>=31&&order.bidders[0].wk_cur_sub_node_id<41&&order.bidders[0].wk_cur_sub_node_id!=33" data-target="#contract2" data-toggle="modal"  style="margin-top: 5px!important;" class="btn btn-sm btn-info tooltips orderBut" data-placement="top"  data-original-title="修改设计合同" ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,2,order.bidders[0].design_contract);">修改设计合同</a>
				                                <a href="javascript:;" ng-if="order.bidders[0].wk_cur_sub_node_id==33&&order.bidders[0].delivery.length==0" data-target="#confirm8" data-toggle="modal" class="btn btn-sm btn-info tooltips orderBut" style="margin-top: 5px!important;"  ng-click="designDelivery(order.needs_id,order.community_name,order.bidders[0].designer_id,0,order.bidders[0].wk_cur_sub_node_id);" data-placement="top" data-original-title="量房交付">量房交付</a>
				                                <a href="javascript:void(0);" ng-click="designDelivery(order.needs_id,order.community_name,order.bidders[0].designer_id,1,order.bidders[0].wk_cur_sub_node_id);"  ng-if="order.bidders[0].wk_cur_sub_node_id==51" data-target="#confirm8" data-toggle="modal" class="btn btn-sm btn-info tooltips orderBut" style="margin-top: 5px!important;" data-placement="top"  data-original-title="上传设计交付物">上传设计交付物</a>
				                                <a href="javascript:;" data-target="#confirm9" data-toggle="modal" style="margin-top: 5px!important;" class="btn btn-sm btn-primary tooltips orderBut"  data-placement="top" data-original-title="查看详情" ng-click="orderDetail(order.needs_id)">查看详情</a>
				                                <!-- <a href="javascript:;" ng-if="order.bidders[0].wk_cur_sub_node_id>=51" data-target="#confirm8" data-toggle="modal" class="btn btn-sm btn-info tooltips orderBut" style="margin-top: 5px!important;" data-placement="top" data-original-title="查看交付" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,1,order.community_name);">查看交付</a>
				                                <a href="javascript:;" data-target="#design-case-list" data-toggle="modal" class="btn btn-sm btn-info tooltips orderBut" style="margin-top: 5px!important;" data-placement="top" data-original-title="查看交付">查看交付(测试)</a> 
				                                <a href="javascript:;" data-target="#confirm8" data-toggle="modal" class="btn btn-sm btn-info tooltips orderBut" style="margin-top: 5px!important;" data-placement="top"  data-original-title="设计方案交付">设计方案交付</a> -->
				                                <!--detail.css 有控制  btn-primary 样式 -->
				                            </div>
				                        </td>
				                    </tr>
				                    </tbody>
				                </table>
				                	<div style="height:26px;position: relative;margin-bottom:-15px;margin-left:-15px;margin-right:-15px;">
						                <div class="DesignerInformation">
											<!-- <img alt="" src="${baseUrl}/images/global/arrow_up.png"> -->
										</div>
										<div class="Di-content col-md-12" id="DesignerInf_{{index}}" style="margin-bottom: -15px;">
													<div class="col-md-12">
														<div class="col-md-2 col-sm-2 Di-margin" ng-click="orderDetail(order.needs_id)">
															<div class="center" >
																<a href="javascript:void(0)" data-toggle="modal" data-target="#measureconfirm" data-placement="top" data-original-title="量房表单" ><img src="${baseUrl}/images/global/designerIcon(5).png"/></a>
																<div class="desgInfo-title">量房表单</div>
															</div>
														</div>
														<div class="col-md-2 col-sm-2 Di-margin" ng-if="order.bidders[0].wk_cur_sub_node_id==33&&order.bidders[0].delivery[0].files.length>0">
															<div class="center">
																<a href="javascript:void(0)" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#viewConfirm5" data-placement="top" data-original-title="量房交付" ><img src="${baseUrl}/images/global/designerIcon(6).png"/></a>
																<div class="desgInfo-title">量房交付</div>
															</div>
														</div>
														<div class="col-md-2 col-sm-2 Di-margin" ng-if="order.bidders[0].wk_cur_sub_node_id>=41">
															<div class="center">
																<a href="javascript:void(0)" ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,2,order.bidders[0].design_contract);" data-toggle="modal" data-target="#contract2" data-placement="top" data-original-title="设计合同"  ng-click="createContract(order.needs_id,order.bidders[0].wk_cur_sub_node_id,order.bidders[0].designer_id,1,order.bidders[0].design_contract);"><img src="${baseUrl}/images/global/designerIcon(7).png"/></a>
																<div class="desgInfo-title">设计合同</div>
															</div>
														</div>
														<div class="col-md-2 col-sm-2 Di-margin" ng-if="order.bidders[0].wk_cur_sub_node_id==61">
															<div class="center">
																<a href="javascript:void(0)" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm6" data-placement="top" data-original-title="渲染图" ><img src="${baseUrl}/images/global/designerIcon(1).png"/></a>
																<div class="desgInfo-title">渲染图</div>
															</div>
														</div>
														<div class="col-md-2 col-sm-2 Di-margin" ng-if="order.bidders[0].wk_cur_sub_node_id==61">
															<div class="center">
																<a href="javascript:void(0)" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm5" data-placement="top" data-original-title="设计图纸" ><img src="${baseUrl}/images/global/designerIcon(2).png"/></a>
																<div class="desgInfo-title">设计图纸</div>
															</div>
														</div>
														<div class="col-md-2 col-sm-2 Di-margin" ng-if="order.bidders[0].wk_cur_sub_node_id>=61">
															<div class="center">
																<a href="javascript:void(0);" ng-click="viewDeliveryService(order.needs_id,order.bidders[0].wk_cur_sub_node_id);" data-placement="top" data-toggle="modal" data-original-title="3D方案" ><img src="${baseUrl}/images/global/designerIcon(3).png"/></a>
																<div class="desgInfo-title">3D方案</div> 
															</div>
														</div>
														<div class="col-md-2 col-sm-2 Di-margin" ng-if="order.bidders[0].wk_cur_sub_node_id>=61">
															<div class="center">
																<a href="javascript:void(0)" ng-click="viewDelivery(order.needs_id,order.bidders[0].wk_cur_sub_node_id,2,order.community_name);" data-toggle="modal" data-target="#confirm4" data-placement="top" data-original-title="材料清单" ><img src="${baseUrl}/images/global/designerIcon(4).png"/></a>
																<div class="desgInfo-title">材料清单</div>
															</div>
														</div>
													</div>
											</div>
										</div>
				            </div>
				        </div>
				        <!-- end: BASIC TABLE PANEL -->
				    </div>
				</div>
				</div>
		         <!-- start: PAGE CONTENT -->
				 <pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)"></pagination>
						<!-- end: PAGE HEADER -->
				<!-- end: BASIC TABLE PANEL -->
				
			</div>

<script src="${baseUrl}/js/public/pgwslideshow.min.js"></script>
<script type="text/javascript">

$(function () { $("[data-toggle='tooltip']").tooltip(); });
$(function(){
	 var flag = true;
	 $(document).on('click', '.DesignerInformation', function(){
		 if( flag == true){
			 $(this).siblings().slideDown(300);
			 $(this).addClass('currenta');
			 flag = false;
		 }else{
			 $(this).removeClass('currenta');
			 $(this).siblings().slideUp(300);
			 flag = true;
		 }
	 });
	
	$(document).on('click', '.planfloater', function(){
    	$(this).find('.planSpanSelected').toggleClass('planSpanActive');
    	if($(this).find('.planSpanSelected').hasClass('planSpanActive')){
    		
    	   var inputVal=$(this).siblings('input').val();
    	   var id= $(this).find('.planSpanSelected').attr("id");
    	   if(inputVal.indexOf(id)==-1){
    		   var newVal=inputVal+=id+",";
        	   $(this).siblings('input').val(newVal);
    	   } 
    	}else{
    		var inputVal=$(this).siblings('input').val();
    		var id= $(this).find('.planSpanSelected').attr("id");
    		if(inputVal.indexOf(id)>-1){
    		   var newInput= inputVal.replace(id+",",'');
    		   $(this).siblings('input').val(newInput);
    		}
    	}
	});
	$('.panelAccordionHeading').click(function(){
		if($(this).parent('.panel-default').hasClass('default')){
			$(this).parent('.panel-default').removeClass('default');
		}else{
			$(this).parent('.panel-default').addClass('default');
		}
	}) 
   	$("select").focus(function(){
   	 	$(this).addClass('selected');
   	});
   	$("select").on('blur change', function(){
   	 	$(this).removeClass('selected');
   	});
   	$('#description').perfectScrollbar();
   	$(document).on('click','#scrollTopG .scrollTopG',function(){
 	    $('html,body').animate({scrollTop:0},'slow');
 	});
});
</script>
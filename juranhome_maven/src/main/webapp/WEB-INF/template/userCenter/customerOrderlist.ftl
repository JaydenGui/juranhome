	<#assign baseUrl=request.contextPath/>
	<#if users?exists & users.type=='member'>
	<#include '/common/modal.html'/>	
	<link rel="stylesheet" href="${baseUrl}/css/public/date-time/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="${baseUrl}/css/public/pgwslideshow.min.css">
	<div class="main-content">
	<div class="modal fade" id="pay_success" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog" style="width:500px;margin-top:5%;">
			<div class="modal-content">
				<div class="modal-header common-border-bottom" style="padding-left:20px">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title common-modal-title">支付完成</h4>
				</div>
				<div class="modal-body common-border-bottom">  			
					<div>
						<img src="${baseUrl}/images/userCenter/513.png" alt="支付完成">
					</div>
				</div>
				<div class="modal-footer common-modal-footer">
		            <button class="NewBtn btn-defaultClose" type="button" data-dismiss="modal" > 关闭 </button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>	
	<div id="refuse" class="modal fade confirmMain" aria-hidden="true" role="dialog" tabindex="-1" style="display: none;"  >
		<div class="modal-dialog end-needs">
			<div class="modal-content">
				<div class="modal-header" style="border:none;padding:25px;padding-bottom:0;"> 
				      <button class="close not-transparent" aria-hidden="true" data-dismiss="modal" type="button"> <img src="${baseUrl}/images/userCenter/m-close-icon.png"> </button>
				      <h4 class="modal-title">提示</h4>
				 </div>
				 <div class="modal-body"> 您确定要拒绝设计师 “<span>{{type}}</span>” 吗？</div>
				 <div class="modal-footer">
				      <button class="NewBtn btn-defaultClose" data-dismiss="modal" type="button"> 关闭 </button>
				      <button class="NewBtn btn-primarySubmit" type="button" ng-disabled="refuseAbleFlag"  ng-click="refuse(detail.needs_id,designer_id)"> 确定 </button>
				 </div>
			</div>
		</div>
	</div>   
	<div class="modal fade confirmMain" id="pay_first" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%;">
		<div class="modal-dialog" >
			<div class="modal-content">
				<div class="modal-header common-border-bottom" style="border:none;padding:25px;padding-left:45px">
					<button type="button" class="close not-transparent" data-dismiss="modal" aria-hidden="true">
						<img src="${baseUrl}/images/userCenter/m-close-icon.png">
					</button>
					<h4 class="modal-title common-modal-title">设计合同</h4>
				</div>
				<div class="modal-body common-border-bottom" style="height:500px"> 
				<!-- start: PAGE HEADER -->
				<!--<div class="row"><div><img class="alipay" src="${baseUrl}/images/userCenter/zhifubao.png" height="64" width="159" alt="支付宝" style="margin-right:20px;"><span class="pay-text">支付宝担保交易，请勿使用”找人付款“功能</span></div>
				</div>-->
					<div class="col-md-12 pay-img">
						<img class="alipay" src="${baseUrl}/images/userCenter/zhifubao.png" height="64" width="159" alt="支付宝" style="margin-right:20px;">
						<span class="pay-text"></span>
					</div>
	                <div class="col-md-12 pay-info">
						<div class="col-md-12">
							<div class="row"><div class="col-md-12 pay-tip">订单提交成功，请您尽快付款</div>
							</div>																					
						</div>
						<div ng-if="status==13">
							<div class="col-md-12" style="border:1px solid #eaeaea; border-top:none;">
									<div class="" style="margin-top:10px;">
										<p>姓名：{{memberInfo.real_name.real_name}}</p><p>手机：{{memberInfo.real_name.mobile_number}}</p>
									</div>
									<div class=""><p>总金额：{{expenses|currency : '￥'}}</p></div>
							</div>
							<div class="col-md-12" style="text-align:right;margin-top:15px;">应付金额：{{expenses|currency : '￥'}}
							</div>
						</div>
						<div class="col-md-12 pay-table" ng-if="status>13">
							<table class="table common" cellpadding="10">
								<tr><td>合同编号：</td><td class="rb">{{contractData[0].contract_no}}</td><td class="rp">总&nbsp金&nbsp额&nbsp&nbsp：</td><td>{{contractData[0].contract_charge|currency : '￥'}}</td></tr>
								<tr><td>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名：</td>	<td class="rb">{{memberInfo.real_name.real_name}}</td><td class="rp" style="color:#0084ff">设计首款：</td>	<td style="color:#0084ff">{{contractData[0].contract_first_charge|currency : '￥'}}</td>	</tr>
								<tr><td>手&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp机：</td><td class="rb">{{memberInfo.real_name.mobile_number}}</td><td class="rp">设计尾款：</td><td>{{contractData[0].contract_charge-contractData[0].contract_first_charge|currency : '￥'}}</td></tr>
							</table>
						</div>	
						<div  ng-if="status==31" style="text-align: right;line-height:50px; font-size:18px;">已扣除量房费:{{measurement_fee|currency : '￥'}}</div>
						<div  ng-if="status==31" style="text-align: right;line-height:50px; font-size:18px;">应该付金额:{{contractData[0].contract_first_charge-measurement_fee|currency : '￥'}}</div>
						<div  ng-if="status==41" style="text-align: right;line-height:50px; font-size:18px;">应该付金额:{{contractData[0].contract_charge-contractData[0].contract_first_charge|currency : '￥'}}</div>
					</div>
				</div>
				<div class="modal-footer common-modal-footer">
					<a href="javascript:void(0);" data-dismiss="modal" class="btn btn-default " style="height: 32px;padding:0px;width:100px;line-height: 32px;">稍后付款</a>
					<a href="javascript:void(0);" ng-if="status==13||status==31||status==41"  data-dismiss="modal" class="btn btn-primary" ng-click="PayFirst(status);" style="height: 32px;padding:0px;width:100px;line-height: 32px;">立即付款</a>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>		
	<div class="modal fade confirmMain" id="contract2" tabindex="-1" role="dialog" aria-hidden="true"  style="position: fixed; top: 10%; display: none;">
		<div class="modal-dialog" style="width:900px!important;margin-top:1%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title">设计合同</h4>
				</div>
				<!--startprint-->
				<div class="modal-body" style=" height:650px;overflow: auto;"> 
					<!-- start: PAGE HEADER -->
					<div id="sample-table-1" style="padding:3%;">
						<div class="col-sm-12"><div class="row"><div class="contract-title">住宅室内装饰设计合同</div></div></div>	
						<!-- start: PAGE CONTENT -->
						<div class="contract-logo col-sm-12"><img alt="设计家logo" src="${baseUrl}/images/userCenter/contracts_logo.png"></div>
						<div class="contract-info col-sm-12"><div class="l">合同编号：<span>{{contractData[0].contract_no}}</span></div><div class="r">签订时间：<span>{{contractData[0].contract_create_date|date:'yyyy-MM-dd'}}</span></div></div>
						<div class="row owner-designer-info">
							<div class="col-sm-6 contract-owner">
								<div class="name">甲方(消费者) : {{name}}</div>
								<div class="address">装修地址 ：<span class="address-info">{{addr}}</span></div>
								<div class="address">详细地址 ：<span class="address-info">{{addrDe}}</span></div>
								<div class="postcode">邮政编码 : <span class="postcode-info">{{zip|replaceNull}}</span></div>
								<div class="phone">手机号码 : <span class="phone-info">{{mobile}}</span></div>
								<div class="mail">电子邮箱 : <span class="mail-info"><a style="color:#333;text-decoration: none;" href="mailto:#">{{email|replaceNull}}</a></span></div>		
							</div>
							<div class="col-sm-6 pull-right contract-designer">
								<div class="name">乙方(设计师) : {{memberInfo.real_name.real_name}}</div>
								<div class="address">服务地址 : <span class="info">{{addr}}</span></div>
								<div class="address">详细地址 ：<span class="address-info">{{addrDe}}</span></div>
								<div class="postcode">邮政编码 : <span class="postcode-info">{{memberInfo.zip_code}}</span></div>
								<div class="phone">手机号码 : <span class="phone-info">{{memberInfo.real_name.mobile_number}}</span></div>
								<div class="mail">电子邮箱 : <span class="mail-info"><a style="color:#333;text-decoration: none;" href="mailto:#">{{memberInfo.email}}</a></span></div>
							</div>
						</div>
						<div class="row contract-rules">
							<div class="col-md-12">
								<div class="tit">1.设计工作内容</div>
								<div class="text-cont">
								<p class="txt"><span class="serial" style="margin-right: 15px;">1.1</span>平面规划设计: 量房后乙方设计师根据甲方提供的需求信息开始平面规划设计，包括设计理念阐述、平面布置图、概念参考图等。甲方书面确认后，平面规划设计完成。</p>
								<span class="serial" style="margin-right: 15px;">1.2</span>甲乙双方协商，乙方应提供给甲方
								<form role="form" class="form-horizontal Act-1-form" style="margin-left:6%;">
									<div class="form-group">
										<label class="col-sm-3 control-label" for="form-field-1">效果图 :</label>
										<div class="col-sm-2">{{contract_Data.design_sketch}} <span class="danw">张 </span></div></div>
								    <div class="form-group">
										<label class="col-sm-3 control-label" for="form-field-1">渲染图 :</label>
										<div class="col-sm-2">{{contract_Data.render_map}}<span class="danw"> 张 </span></div>
									</div>
								    <div class="form-group">
										<label class="col-sm-3 control-label" for="form-field-1">每增加一张效果图费用 :</label>
										<div class="col-sm-2">{{contract_Data.design_sketch_plus}} <span class="danw">元</span></div>
									</div>        
								</form>
							</div>
								<form role="form" class="form-horizontal Act-2-form">
								<div class="tit">2.本项目设计费</div>
									<div style="margin-left:6%">
									<div class="form-group">
										<label class="col-sm-3 control-label" for="form-field-1">本项目设计费总额：</label><span   class="serial" style="margin-right:66px;color:#999;font-size: 12px">设计首款不得低于80%</span>
										<div class="col-sm-2">{{contractData[0].contract_charge|currency : ''}} <span class="danw">元</span></div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="form-field-1">设计首款 :</label>
										<div class="col-sm-2">{{contractData[0].contract_first_charge|currency : ''}} <span class="danw">元</span></div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label" for="form-field-1">设计尾款 :</label>
										<div class="col-sm-2">{{contractData[0].contract_charge-contractData[0].contract_first_charge|currency : ''}}<span class="danw">元</span></div>
									</div>
									</div>        
								</form>	     
						</div>
					</div>
					<div class="row contract-detail" id="contract-accordion">
						<div class="col-md-12">
							<!-- start: DYNAMIC TABLE PANEL -->
							<div class="panel panel-default accordion-custom accordion-teal">
							<a class="showContent panel-default" href="javascript:void(0);">
								<div class="panelAccordionHeading" style="background-color:#0084ff;width: 828px;">合同详情
									<div class="contractAccordion">
										<span class="contract-accordion-icon">收起</span><span class="word">展开</span>
									</div>
								</div></a>
								<div class="panel-body panel-collapse collapse" id="contract-body" style="height:auto;">
									<div class="row">
										<div class="col-md-12 space20">
											<div class="btn-group pull-right">	
												<ul class="dropdown-menu dropdown-light pull-right"><li><a href="#" class="export-png" data-table="#sample-table-1">下载图档</a></li></ul>
											</div>
										</div>
									</div>
									<div class="table-responsive">
										<table class="table" >
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
												<tr>
													<td>
														<div class="sign-txt">
															<h4 class="tit">2.设计周期</h4>
															<div class="text-cont">
																<p class="txt"><span class="serial">2.2</span>甲方分两个阶段支付设计费，设计周期从甲方付款之日开始计算： </p>
																<table class="table">
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
												</tr>
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
						<!--<div class="col-sm-7 invoice-block" style="text-align:right">
							<label class="checkbox-inline"><input type="checkbox" class="red" value="" checked="checked">同意 "合同编号：{{contractData[0].contract_no}} "所有内容</label>
						</div>      
						<div class="col-sm-5">
							<label class="checkbox-inline"><input type="checkbox" class="red" value="" checked="checked">选择居然施工</label>
						</div>  -->
						<div style="text-align:center" class="col-sm-12 invoice-block">
						 	<label class="checkbox-inline ng-binding"><input type="checkbox" disabled="true" checked="checked" value="" class="red">同意 "合同编号：{{contractData[0].contract_no}}"所有内容</label> 
					    </div>
						<div class="col-sm-12 invoice-block contract-opeartion">								
							<!--<button data-toggle="dropdown" class="btn btn-green dropdown-toggle">下载 <i class="fa fa-angle-down"></i></button>-->
							<a onClick="doPrint()" class="contract-print"><img src="${baseUrl}/images/userCenter/print.png" alt="打印">&nbsp<span style="vertical-align:middle;cursor: pointer;">打印 </span></a>
							<a href="javascript:void();" class="contract-download" style="margin-left:30px;"><img src="${baseUrl}/images/userCenter/download.png" alt="下载"><span style="vertical-align:middle">下载</span></a>
						</div>
					</div>
				</div>
	<!-- end: PAGE CONTENT-->
			</div>
			<!--startprint-->
			<!-- <iframe src="contract.html" width="100%" height="500" style="border:none" ></iframe> -->
			<div class="modal-footer">
				<button class="NewBtn btn-defaultClose" aria-hidden="true"  data-dismiss="modal" type="button">取消</button>
				<button class="NewBtn btn-primarySubmit"  ng-if="status==31||status==41" aria-hidden="true" data-dismiss="modal" data-toggle="modal" data-target="#pay_first" type="button">确认并付款</button>
			</div>
		</div>
	<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
	</div>		
		<script>
			function doPrint() { 
				bdhtml=window.document.body.innerHTML; 
				sprnstr="<!--startprint-->"; 
				eprnstr="<!--endprint-->"; 
				prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
				prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
				window.document.body.innerHTML=prnhtml; 
				window.print(); 
				}
	    		$(document).ready(function(){    			
	    			$('#contract-body').on('show.bs.collapse', function () {
	         		//alert('嘿，当您展开时会提示本警告');
	   				});
	    		})
	    	</script>		
					
					<!-- end: SPANEL CONFIGURATION MODAL FORM -->
	                <div class="modal fade confirmMain" id="confirm" tabindex="-1" role="dialog" aria-hidden="true" >
						<div class="modal-dialog end-needs">
							<div class="modal-content">
								<div class="modal-header" style="border:none;padding:25px;padding-bottom:0;">
									<!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>-->
									<h4 class="modal-title">提示</h4>
								</div>
								<div class="modal-body" style="padding:15px 15px 15px 25px;">
	                              	您确定要终止需求么？
	                              
	                            </div>	
	                            <div class="modal-footer">
	                              	<div class="pull-right">
	                              	<button type="button" id="closeBtn" class="NewBtn btn-defaultClose" data-dismiss="modal" >
										关闭
									</button>
	                              	<button type="button" id="agreeBtn" class="NewBtn btn-primarySubmit" ng-click="terminate(detail.needs_id)" >
										确定
									</button>
									
	                              	</div>
								
								</div>						
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
					<!-- end: SPANEL CONFIGURATION MODAL FORM -->
	                <div class="modal fade" id="finial" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" style="width:1080px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title">最后设计结果确认</h4>
								</div>
								<div class="modal-body"> 
									<!-- start: PAGE HEADER -->
	                   				<div style="overflow:auto; overflow-x:hidden;width:100%; height:450px;">
					                    <div class="row">
											<div class="col-md-12">
												<!-- start: TABLE WITH ${baseUrl}/images/userCenter PANEL -->
												<div class="panel panel-default">
													<div class="panel-heading">
														<i class="fa fa-external-link-square"></i>
														交付档案列表
														<div class="panel-tools"></div>
													</div>
													<div class="panel-body">
														<table class="table table-striped table-bordered   " id="sample-table-2">
															<thead>
																<tr>
																	<th class="center">
																	<i class="clip-checkmark-2 " style=" color:#387B00"></i></th>
																	<th class="center">档案类别</th>
																	<th>档案名称</th>
																	<th class="hidden-xs">状态</th>
																	<th></th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="center">
																		<i class="clip-checkmark-2 " style=" color:#387B00"></i>
																	</td>
																	<td class="center">
																		<img src="${baseUrl}/images/userCenter/measure_icon.png" alt="image"/>
																	</td>
																	<td>量房交付档案</td>
																	<td class="hidden-xs">已完成交付</td>
																	<td class="center">
																		<div class="visible-md visible-lg hidden-sm hidden-xs">
																			<a href="#measure" data-toggle="modal"  id="finialbn01" class="btn btn-xs btn-green tooltips" data-placement="top" data-original-title="连接">		<i class="fa fa-share"></i>
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="center">
																		<i class="clip-checkmark-2 " style=" color:#387B00"></i>
																	</td>
																	<td class="center">
																		<img src="${baseUrl}/images/userCenter/contract.png" alt="image"/>
																	</td>
																	<td>设计合同</td>
																	<td class="hidden-xs">已完成交付</td>
																	<td class="center">
																		<div class="visible-md visible-lg hidden-sm hidden-xs">
																			<a href="#contract" data-toggle="modal"  id="finialbn02" class="btn btn-xs btn-green tooltips" data-placement="top" data-original-title="连接"><i class="fa fa-share"></i>
																			</a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="center">
																		<i class="clip-checkmark-2 " style=" color:#387B00"></i>
																	</td>
																	<td class="center">
																		<img src="${baseUrl}/images/userCenter/3d.png" alt="image"/>
																	</td>
																	<td>3D DIY档案</td>
																	<td class="hidden-xs">已完成交付</td>
																	<td class="center">
																		<div class="visible-md visible-lg hidden-sm hidden-xs">
																			<a href="homestyler.html" target="_blank" id="finialbn03" class="btn btn-xs btn-green tooltips" data-placement="top" data-original-title="连接"><i class="fa fa-share"></i></a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="center">
																		<i class="clip-checkmark-2 " style=" color:#387B00"></i>
																	</td>
																	<td class="center">
																		<img src="${baseUrl}/images/userCenter/album.png" alt="image"/>
																	</td>
																	<td>设计交付档案</td>
																	<td class="hidden-xs">已完成交付</td>
																	<td class="center">
																		<div class="visible-md visible-lg hidden-sm hidden-xs">
																			<a href="#design" data-toggle="modal" id="finialbn03" class="btn btn-xs btn-green tooltips" data-placement="top" data-original-title="连接"><i class="fa fa-share"></i></a>
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<!-- end: TABLE WITH ${baseUrl}/images/userCenter PANEL -->
											</div>
										</div>
									</div>
					            </div>
								<div class="modal-footer">
									<button type="button" class="NewBtn btn-defaultClose" data-dismiss="modal" onClick="location.href='javascript:;'" >
										关闭
									</button>
	                                <a href="javascript:;"  class="NewBtn btn-primarySubmit" >
										确认 <i class="fa fa-check"></i>
									</a>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
	                <div class="modal fade" id="finial2" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" style="width:1080px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title">最后设计交付确认</h4>
								</div>
								<div class="modal-body">
									<!-- start: PAGE HEADER -->
	                   				<div style="overflow:auto; overflow-x:hidden;width:100%; height:450px;">
					                    <div class="row">
											<div class="col-md-12">
												<!-- start: TABLE WITH ${baseUrl}/images/userCenter PANEL -->
												<div class="panel panel-default">
													<div class="panel-heading">
														<i class="fa fa-external-link-square"></i>
														交付档案列表
														<div class="panel-tools"></div>
													</div>
													<div class="panel-body">
														<table class="table table-striped table-bordered   " id="sample-table-2">
															<thead>
																<tr>
																	<th class="center">
																		<i class="clip-checkmark-2 " style=" color:#387B00"></i>
																	</th>
																	<th class="center">档案类别</th>
																	<th>档案名称</th>
																	<th class="hidden-xs">状态</th>
																	<th></th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td class="center">
																		<i class="clip-checkmark-2 " style=" color:#387B00"></i>   
																	</td>
																	<td class="center">
																		<img src="${baseUrl}/images/userCenter/measure_icon.png" alt="image"/>
																	</td>
																	<td>量房交付档案</td>
																	<td class="hidden-xs">已完成交付</td>
																	<td class="center">
																		<div class="visible-md visible-lg hidden-sm hidden-xs">
																			<a href="#measurefinial" data-toggle="modal"  id="finialbn01" class="btn btn-xs btn-green tooltips" data-placement="top" data-original-title="连接"><i class="fa fa-share"></i></a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="center">
																	<i class="clip-checkmark-2 " style=" color:#387B00"></i></td>
																	<td class="center"><img src="${baseUrl}/images/userCenter/contract.png" alt="image"/></td>
																	<td>设计合同</td>
																	<td class="hidden-xs">已完成交付</td>
																	<td class="center">
																		<div class="visible-md visible-lg hidden-sm hidden-xs">
																			<a href="#contractfinial" data-toggle="modal"  id="finialbn02" class="btn btn-xs btn-green tooltips" data-placement="top" data-original-title="连接"><i class="fa fa-share"></i></a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="center">
																		<i class="clip-checkmark-2 " style=" color:#387B00"></i>
																	</td>
																	<td class="center">
																		<img src="${baseUrl}/images/userCenter/3d.png" alt="image"/>
																	</td>
																	<td>3D DIY档案</td>
																	<td class="hidden-xs">已完成交付</td>
																	<td class="center">
																		<div class="visible-md visible-lg hidden-sm hidden-xs">	
																			<a href="homestyler.html" target="_blank" id="finialbn03" class="btn btn-xs btn-green tooltips" data-placement="top" data-original-title="连接"><i class="fa fa-share"></i></a>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td class="center">
																		<i class="clip-close  " style=" color:red"></i>
																	</td>
																	<td class="center">
																		<img src="${baseUrl}/images/userCenter/album.png" alt="image"/>
																	</td>
																	<td>设计交付档案</td>
																	<td class="hidden-xs">
																		<i class="fa fa-share" ></i>已完成交付
																	</td>
																	<td class="center">
																		<div class="visible-md visible-lg hidden-sm hidden-xs">
																			<a href="javascript:;" target="_blank" class="btn btn-xs btn-teal tooltips" data-placement="top" data-original-title="提醒交付"><i class="clip-bubble-dots "></i>
																			</a>	
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<!-- end: TABLE WITH ${baseUrl}/images/userCenter PANEL -->
											</div>
										</div>
									</div>
					            </div>
								<div class="modal-footer">
									<button type="button" class="NewBtn btn-defaultClose" >
										关闭
									</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
						
	
	                <div class="modal fade" id="payfinial" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" style="width:1080px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title">支付设计尾款</h4>
								</div>
								<div class="modal-body">
									<!-- start: PAGE HEADER -->
	                   				<div style=" display:block; width:946px; position:relative ">
	                   					<div style=" position:absolute; right:120px;top:120px ">
	                   						<a href="#finishpay" data-toggle="modal" class="btn btn-lg btn-blue hidden-print" id="paybnnow">
											立即支付 <i class="fa fa-check"></i>
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
									<h4 class="modal-title">支付设计尾款</h4>
								</div>
								<div class="modal-body">  
									<!-- start: PAGE HEADER -->
	                    			<div style=" display:block; width:946px; position:relative ">
	                    				<div style=" position:absolute; left:380px; bottom:150px ">
	                    					<a href="orderlist.html"  class="btn btn-lg btn-blue" >
											进入支付宝 <i class="fa fa-check"></i>
											</a>
										</div> 
										<img src="${baseUrl}/images/userCenter/10-1.jpg">
									</div>
								</div>
								<div class="modal-footer">
	                                <a href="javascript:;"  class="btn btn-lg btn-red hidden-print">
										稍后付款<i class="clip-close"></i>
									</a>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
	                <div class="modal fade" id="measurefinial" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" style="width:1080px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title"><span style="color:#00405C">XXXX</span>量房交付浏览</h4>
								</div>
								<div class="modal-body"> 
									<!-- start: PAGE HEADER -->
									<!-- <iframe src="pages_gallery2.html" width="100%" height="500" style="border:none"></iframe> -->
								</div>
								<div class="modal-footer">
									<button type="button" class="NewBtn btn-defaultClose" data-dismiss="modal" onClick="location.href='javascript:;'" >
										关闭
									</button>
	                                <button type="button" class="NewBtn btn-primarySubmit" onClick="location.href='#finial'" data-toggle="modal" id="finiallistbn">
										回最后结案清单
									</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
	
	                <div class="modal fade" id="measure" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" style="width:1080px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title"><span style="color:#00405C">XXXX</span>量房交付浏览</h4>
								</div>
								<div class="modal-body">
									<!-- start: PAGE HEADER -->
									<!-- <iframe src="pages_gallery.html" width="100%" height="500" style="border:none"></iframe> -->
								</div>
								<div class="modal-footer">
									<button type="button" class="NewBtn btn-defaultClose" onClick="location.href='orderlist.html'">
										关闭
									</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
	                <div class="modal fade" id="contract" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" style="width:1080px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title">设计合同</h4>
								</div>
								<div class="modal-body">  
									<!-- start: PAGE HEADER -->
									<div class="container" id="sample-table-1" style="width:100%;height:500px;overflow:auto;">
										<!-- start: PAGE HEADER -->
										<div class="row">
											<div class="col-sm-12">
												<div class="page-header">
													<h1>住宅室内装饰设计合同</h1>
												</div>
												<!-- end: PAGE TITLE & BREADCRUMB -->
											</div>
										</div>
										<!-- end: PAGE HEADER -->
										<!-- start: PAGE CONTENT -->
										<div class="invoice">
											<div class="row invoice-logo">
												<div class="col-sm-4">
													<img alt="设计家logo" src="">
												</div>
												<div class="col-sm-8">
													<p>
														合同编号 ：14151119471728
													</p>
							                        <p> 签订时间 ：2016-02-15 </p>
												</div>
											</div>
											<hr>
											<div class="row">
												<div class="col-sm-4">
													<h4>甲方(消费者) : OOO</h4>
													<div class="well">
														<address>
															<strong>装修地址 ：</strong>
															<br>
															北京市东城区东直门南大街甲8号 
															<br>
															<strong>邮政编码 :</strong> 100007
															<br>
															<abbr title="Phone"><strong>手机号码 :</strong></abbr> 18501718888
														</address>
														<address>
															<strong>电子邮箱 :</strong>
															<br>
															<a style="color:#333;text-decoration: none;" href="mailto:#">
																user@customer.cn
															</a>
														</address>
													</div>
												</div>
												<div class="col-sm-4 pull-right">
													<h4>乙方(设计师) : OOO</h4>
													<ul class="list-unstyled invoice-details">
							                        	<li>
															<strong>服务地址 :</strong> 100007 北京市东城区东直门南大街甲3号 
														</li>
														<li>
															<strong>手机号码 :</strong> 233243444
														</li>
														<li>
															<strong>电子邮箱 :</strong> designer@designer.cn
														</li>
														<li>
															<strong>合同有效期限:</strong> 2016-01-5 ~ 2016-01-12
														</li>
													</ul>
												</div>
											</div>
							                <div class="row">
												<div class="col-md-12">
							                      	<h4 class="tit">1.设计工作内容</h4>
							        				<div class="text-cont">
									                    <p class="txt">
									                        <span class="serial">1.1</span>平面规划设计 : 量房后乙方设计师根据甲方提供的需求信息开始平面规划设计，包括设计理念阐述、平面布置图、概念参考图等。甲方书面确认后，平面规划设计完成。
									                    </p>
							                           	<span class="serial">1.1.1</span>甲乙双方协商，乙方应提供给甲方
							                    		<form role="form" class="form-horizontal">
							               					<div class="form-group">
																<label class="col-sm-2 control-label" for="form-field-1">
																	张效果图 :
																</label>
																<div class="col-sm-7">
																	<span>12</span>
																</div>
																<span class="help-inline col-sm-2">  张 </span>
															</div>
							                				<div class="form-group">
																<label class="col-sm-2 control-label" for="form-field-1">
																	渲染图 :
																</label>
																<div class="col-sm-7">
																	<span>12</span>
																</div>
																<span class="help-inline col-sm-2">  张 </span>
															</div>
							                   				<div class="form-group">
																<label class="col-sm-2 control-label" for="form-field-1">
																	每增加一张效果图费用 :
																</label>
																<div class="col-sm-7">
																	<span>12</span>
																</div>
																<span class="help-inline col-sm-2">  元</span>
															</div>        
							             				</form>
							                        </div>
							                         <p class="txt">
								                        <span class="serial">2.1</span>本项目设计费总额：
								                        <input type="text" readonly value="" placeholder="20,000" class="inp-input sign-money" >元
								                    </p>
							                    </div>
							                </div>
											<div class="row">
												<div class="col-md-12">
													<!-- start: DYNAMIC TABLE PANEL -->
													<div class="panel panel-default">
														<div class="panel-heading"><em class="fa fa-external-link-square"></em> 		合同详情
															<div class="panel-tools">
																<a class="btn btn-xs btn-link panel-collapse collapses" href="#"> </a>
																<a class="btn btn-xs btn-link panel-expand" href="#"> <i class="fa fa-resize-full"></i></a>
															</div>
														</div>
														<div class="panel-body" style="display: none;">
															<div class="row">
																<div class="col-md-12 space20">
																	<div class="btn-group pull-right">
																		<button data-toggle="dropdown" class="btn btn-green dropdown-toggle">
																			下载 <i class="fa fa-angle-down"></i>
																		</button>
																		<ul class="dropdown-menu dropdown-light pull-right">
																			<li>
																				<a href="#" class="export-png" data-table="#sample-table-1">下载图档</a>
																			</li>
																		</ul>
																	</div>
																</div>
															</div>
															<div class="table-responsive">
																<table class="table" >
																	<tbody>
																		<tr>
																			<td>
																				<div class="sign-txt-head">根据《中华人民共和国合同法》，以及其他有关法律、法规规定的原则，结合室内装饰装修的特点，经甲、乙双方友好协商，现就甲方委托乙方承担室内装饰设计（不含结构设计、空调消防系统设计、智能系统设计）事宜达成如下协议。
							    												</div>
							    												<div class="sign-txt">
																                    <p class="txt">
																                        <span class="serial">1.2</span>效果设计：平面规划设计确定后，乙方开始效果设计，包括最终平面布置图、空间效果图或使用平台提供的DIY软件生成的渲染图。
																                    </p>
																                    <p class="txt-small">
																                    <p class="txt">
																                        <span class="serial">1.3</span>施工图设计：甲方书面确定方案设计后，乙方开始施工图设计，包括但不限于：（图纸目录、主材明 细表、设计说明、主材告知书、原始测量图、拆除图、新建图、平面布置图、强弱电插座图、开关控制灯具图、综合天花图、水路平面示意图图、地面布置周长面积图、排砖图、墙体饰面图、客厅背景墙详图、节点大样）。
																                    </p>
																                </div>
																        	</td>
																		</tr>
																		<tr>
																			<td>
																				<div class="sign-txt">
																	                <h4 class="tit">2.设计周期</h4>
																	                <div class="text-cont">
																	                    <p class="txt">
																	                        <span class="serial">2.2</span>甲方分两个阶段支付设计费，设计周期从甲方付款之日开始计算：
																	                    </p>
																	                    <table class="table">
																                            <thead>
																								<tr>
																	                                <th> 设计阶段</th>
																	                                <th> 设计费比例</th>
																	                                <th> 金额（元）</th>
																	                                <th> 付款说明</th>
																                            	</tr>
																                            </thead>
																                            <tr>
																                                <td>平面规划设计</td>
																                                <td>不低于<span class="red"> 20 %</span></td>
																                                <td></td>
																                                <td>线上签订设计合同订单，三日内</td>
																                            </tr>
																                            <tr>
																                                <td>效果及施工图设计</td>
																                                <td>设计尾款</td>
																                                <td></td>
																                                <td>完成效果图及施工图设计后，甲方进行支付尾款，乙方将所有图纸交给甲方</td>
																                            </tr>
																                        </table>
																	                    <p></p>
																	                    <p class="txt">
																	                        <span class="serial">2.3</span>甲方在签合同前已支付的定金或量房费从首期款中扣除。
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">2.4</span>甲方延期付款,设计周期自动顺延。
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">2.5</span>如工程地址为乙方服务区域范围以外地区，则乙方人员发生的差旅费用如：长途往返交通（飞机、高铁等）、当地交通、住宿（不低于经济型连锁酒店标准）等由甲方直接承担。    
																	                    </p>
																	                </div>
																	            </div>
																	        </td>
																	    </tr>
																		<tr>
																			<td>
																				<div class="sign-txt">
																	                <h4 class="tit">3.甲方责任</h4>
																	                <div class="text-cont">
																	                    <p class="txt">
																	                        <span class="serial">3.1</span>甲方应按乙方要求及时、准确且完整的提供设计所需原始户型图等项目建筑基本图纸等资料；
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">3.2</span>甲方应按约定的日期及金额向乙方支付设计费用；
																	                    </p>
																	                      
																	                    <p class="txt">
																	                        <span class="serial">3.3</span>甲方不得要求乙方设计师违反国家有关标准或规定进行设计；
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">3.4</span>本工程建筑材料、设备的加工订货如需乙方设计人员配合时，所需费用由甲方承担；
																	                    </p><p class="txt">
																	                        <span class="serial">3.5</span>甲方有权对乙方提交的设计方案提出修改调整意见，并享有最终确认权。甲方应于乙方提交设计方案（含修改后方案）后三日内以书面形式或邮件形式提出修改意见或签署确认，但修改调整限定于已选定主调装饰风格范畴内。逾期既未确认又未提出书面修改意见的，视为同意确认该设计图纸或方案；    
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">3.6</span>甲方如需改动承重结构图，由甲方向乙方提供原始结构及原始建筑图，结构改造图纸由专业设计院统一设计和盖章收费，如需乙方进行建筑设计的，则另行协商收费；
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">3.7</span>如甲方提供原始测量图（乙方未进行现场实地测量），乙方根据甲方提供的原始测量图数据，为甲方出具装饰施工图和约定效果图，相关设计图纸应标明尺寸、材质、用料、颜色 、图标以及设计说明等内容。
																	                    </p>
																	                </div>
																	            </div>
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<div class="sign-txt">
																	                <h4>4.乙方责任</h4>
																	                <div class="text-cont">
																	                    <p class="txt">
																	                        <span class="serial">4.1</span>如乙方进行现场实地测量，在收取设计费后，根据实际测量与设计方案需要，向甲方提供装饰施工图和约定效果图，相关设计图纸应标明尺寸、材质、用料、颜色 、图标以及设计说明等内容；
																	                    </p><p class="txt">
																	                        <span class="serial">4.2</span>乙方应尽职尽责完成设计方案，及时与甲方沟通征求意见并予以修改完善，按照约定向甲方交付和确认设计工程；
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">4.3</span>在施工过程中，乙方设计师根据具体施工情况与进度，有责任提供不少于3次的现场施工指导或协助解决与设计有关的技术问题，以实现原设计效果；
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">4.4</span>在装修过程中，如甲方需要，乙方有责任提供在居然在线进行线上推荐选购或陪同甲方在居然之家挑选装饰材料、家具配饰的服务；
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">4.5</span>对于现场施工服务指导服务和材料挑选服务，如发生在异地的情况，请甲乙双方自行协商。
																	                    </p>
																	                </div>
																	            </div>
																			</td>
																		</tr>
																		<tr>
																			<td> 
																				<div class="sign-txt">
																	                <h4 class="tit">5.合同顺延</h4>
																	                <div class="text-cont">
																	                    <p class="txt">
																	                        <span class="serial">5.1</span>甲方发生下列情形之一的，乙方有权顺延设计期限：
																	                    </p>
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
																	                    <p class="txt">
																	                        <span class="serial">6.1</span>因乙方设计未按国家有关设计规定、规范要求而发生错误造成甲方工程质量事故的，乙方除负责采取补救措施外，还应根据损失程度按照国家相关规定向甲方支付赔偿金。
																	                    </p><p class="txt">
																	                        <span class="serial">6.2</span>乙方未能按照合同约定的期限完成设计工作内容，甲方可在平台申请退款或向平台客服发起投诉。
																	                    </p>
																	                </div>
																	            </div>
																	        </td>
																	   	</tr>
																	    <tr>
																	    	<td>
																	    		<div class="sign-txt">
																	                <h4 class="tit">7.其他事项</h4>
																	                <div class="text-cont">
																						<p class="txt">
																                        	<span class="serial">7.1</span>本合同未包含的园林设计和配饰设计另行约定补充协议。
																                    	</p>
																                    	<p class="txt">
																	                        <span class="serial">7.2</span>乙方对其为甲方设计的成果依法享有版权，甲方支付全部费用后，设计成果的版权除署名权外均 转让给甲方；但是未经乙方书面允许，甲方不得将本项目设计成果用于其它项目；乙方享有仅在本项目推广及乙方汇编作品集、参展、参赛、出席研讨、行业内报刊投稿、乙方自身宣传中使用的权利，不得用于其它项目。
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">7.3</span>本合同在履行过程中发生纠纷，甲乙方应及时协商解决。协商不成时，向仲裁委员会申请仲裁；
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">7.4</span>本合同未尽事宜，双方可签订补充协议作为附件，补充协议与本合同同具有相等效力；
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">7.5</span>本合同于双方履行完毕各自义务后自动终止；
																	                    </p>
																	                    <p class="txt">
																	                        <span class="serial">7.6</span>本合同正本经甲乙双方签章后生效。本合同一式两份，甲方执一份，乙方执一份。
																	                    </p>
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
							                        <label class="checkbox-inline">
														<input type="checkbox" class="red" value="" checked="checked" disabled="true">
														同意 "合同编号：14151119471728 "所有内容
													</label>
												</div>      
							                    <div class="col-sm-6 ">
							                    	<!--<label class="checkbox-inline">
														<input type="checkbox" class="red" value="" checked="checked">
														选择居然施工
													</label>-->
												</div>
												<div class="col-sm-12 invoice-block">
													<br>
													<a onclick="javascript:window.print();" class="btn btn-lg btn-default hidden-print">
														打印 <i class="fa fa-print"></i>
													</a>
												</div>
											</div>
										</div>
										<!-- end: PAGE CONTENT-->
									</div>
									<!-- <iframe src="contract.html" width="100%" height="500" style="b:none" ></iframe> -->
								</div>
								<div class="modal-footer">
									<button type="button" class="NewBtn btn-defaultClose" onClick="location.href='orderlist.html'" >
										关闭
									</button>
	                                <a href="orderlist.html"  class="btn btn-lg btn-red hidden-print">
										拒绝<i class="clip-close"></i>
									</a>
									<a href="#pay" data-toggle="modal" class="NewBtn btn-primarySubmit" id="new" >
										确认并付款 <i class="fa fa-check"></i>
									</a>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					
					
					
	               <div class="modal fade" id="pay" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" style="width:1080px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title">设计合同</h4>
								</div>
								<div class="modal-body"> 
									<!-- start: PAGE HEADER -->
									<div class="row">
										<div style="line-height:64px;">
											<img src="" height="64" width="159" alt="支付宝" style="margin-bottom:-24px;">
											<span style="color:#E02222">支付宝担保交易，请勿使用”找人付款“功能</span>
										</div>
									</div>
	                    			<div class="row">
										<div style="line-height:20px;background:#F2F1F7">
											<div style="background:#F4F4F4">订单提交成功，请您尽快付款</div>
											<div class="col-md-12">
												<div class="col-md-4" style="border-right:1px solid #ccc">
													<p>合同编号：1245465465142456456</p>
													<p>姓名：张d张</p>
													<p>手机号码：185465845475</p>
												</div>
												<div class="col-md-4">
													<p>总金额：19,800(已扣200元量房费)</p>
													<p>设计首款：15,540</p>
													<p>设计尾款：3,960</p>
												</div>
											</div>
											<div class="col-md-12" style="text-align:right">应付金额：15,540</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
	                                <a href="orderlist.html" class="btn btn-lg btn-red hidden-print" style="background:#F24713;">
										稍后付款
									</a>
									<a href="javascript:void(0);" class="btn btn-lg btn-primary hidden-print">
										立即付款
									</a>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					
					
					
					
					
	               	<div class="modal fade" id="finish" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" style="width:1080px">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title">设计合同</h4>
								</div>
								<div class="modal-body">  
									<!-- start: PAGE HEADER -->
									<div style=" display:block; width:946px; position:relative ">
										<div style=" position:absolute; left:380px; bottom:150px ">
											<a href="orderlist.html"  class="btn btn-lg btn-blue" >
											进入支付宝 <i class="fa fa-check"></i>
											</a>
										</div> 
										<img src="${baseUrl}/images/userCenter/10.jpg">
									</div>
								</div>
								<div class="modal-footer">
	                                <a href="javascript:;"  class="btn btn-lg btn-red hidden-print">
										稍后付款<i class="clip-close"></i>
									</a>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					
					<!-- Pay for success -->
					<div class="modal fade" id="pay_success" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
										&times;
									</button>
									<h4 class="modal-title">设计合同</h4>
								</div>
								<div class="modal-body">  
									<!-- start: PAGE HEADER -->
									<div style=“margin:80px auto”>
										<img src="" alt="支付完成">
									</div>
								</div>
								<div class="modal-footer">
	                                <button class="NewBtn btn-defaultClose" onclick="location.href=''" type="button"> 关闭 </button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
			
						<div class="modal fade" id="picplayer3" tabindex="-1" role="dialog" aria-hidden="true">
							<div class="modal-dialog" style="width:800px;margin-top:8%;">
								<div class="modal-content">
									<div class="modal-header common-border-bottom" style="padding-left:20px">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title common-modal-title">图片轮播3</h4>
									</div>
									<div class="modal-body common-border-bottom">
										
						 				<div style="display:none;" class="html5gallery"  data-skin="light" data-width="700" data-height="402" showtitle="false" titleoverlay="false" titleheight="0" thumbshowtitle="false">
									   		<a href="${baseUrl}/images/userCenter/image01.jpg" ><img src="${baseUrl}/images/userCenter/image03.jpg"></a>
						       				<a href="${baseUrl}/images/userCenter/image02.jpg"><img src="${baseUrl}/images/userCenter/image03.jpg" ></a>
						    		   </div>
									</div>
								</div>
							</div>
						</div>			
						<div class="container">
							<!-- start: PAGE HEADER -->
							<div class="clearfix">
								<div class="col-sm-12">
									<ol class="breadcrumb" style="padding-left:30px;">
										<li>
											<a href="javascript:void(0);">个人中心 </a>
										</li>
										<li class="active"> 我的装修项目 </li>
									</ol>
									<!-- start: PAGE TITLE & BREADCRUMB -->
									<div class="olt-page-header">
										<h3>我的装修项目</h3>
									<!-- end: PAGE TITLE & BREADCRUMB -->
								</div>
								<div class="col-md-12 no-order" ng-if="isShow==true" ng-cloak>


								<div class="col-md-12">
									<div class="no-order-title">
										您还没有家装订单
									</div>	
									<div class="go-now">马上去</div>	
								</div>
								<div class="col-md-4">
									<a style="text-decoration: none;" href="${baseUrl}/caseBase/index/">
									<div class="main-part">
										<div class="e-i"></div>
										<div class="em-h">浏览真实设计案例</div>
										<div class="em-d"></div>
									</div></a>
								</div>
								<div class="col-md-4">
								<a style="text-decoration: none;" href="${baseUrl}/designer/index/">
									<div class="main-part">
										<div class="e-h"></div>	
										<div class="em-h">找到满意的设计师</div>
										<div class="em-d"></div>					
									</div></a>
								</div>
								<div class="col-md-4">
								<a style="text-decoration: none;" href="${baseUrl}/myOrder/addNeeds/">
									<div class="main-part">
										<div class="e-d"></div>
										<div class="em-h">发布设计需求</div>
										<div class="em-d"></div>
									</div></a>
								</div>
							</div>	
								<div class="modal fade" id="html5galleryplayer" tabindex="-1" role="dialog" aria-hidden="true">
									<div class="modal-dialog" style="width:800px;margin-top:8%;">
										<div class="modal-content">
											<div class="modal-header common-border-bottom" style="padding-left:20px">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
													&times;
												</button>
												<h4 class="modal-title common-modal-title">图片轮播3</h4>
												
											</div>
											<div class="modal-body common-border-bottom">	
											<!--  <script src="${baseUrl}/js/html5gallery/html5gallery.js"></script>-->		
								 				<div style="display:none;" class="html5gallery"  data-skin="light" data-width="700" data-height="402" showtitle="false" titleoverlay="false" titleheight="0" thumbshowtitle="false">
											   		<a href="${baseUrl}/images/userCenter/image02.jpg" ><img src="${baseUrl}/images/userCenter/image03.jpg"></a>
								       				<a href="${baseUrl}/images/userCenter/image03.jpg"><img src="${baseUrl}/images/userCenter/image02.jpg" ></a>
								    		   </div>	
											</div>
										</div>
									</div>
								</div>	
						</div>
						<!-- end: PAGE HEADER -->
						<!-- start: PAGE CONTENT -->
						<!--Demand order -->
	                    <div class="deco_order" ng-repeat="needs in orderLis" ng-init="dex = $index" ng-cloak>
							<div class="deco_order_inner" >
								<!-- start: BASIC TABLE PANEL -->
								<div class="panel panel-default od-panel" >
									<div class="od-panel-heading ordert-title">
									    <img ng-if="needs.is_beishu==0" style="float:left;position:relative;left:-7px;top:-2px;" alt="" src="${baseUrl}/images/userCenter/098.png">
										<span ng-if="needs.is_beishu==0" style="float:left;font-size:14px;"></span>
										<div style="float:left; font-size:14px;">{{needs.community_name}} </div>
										<div id="orderItemNum"> 项目编号:{{needs.needs_id}}</div><!--  -->
									</div>
									<div class="panel-body od-panel-body">
	                                	<div  style=" background:#fff;">
	                                		<center class="needs-step" ng-if="needs.custom_string_status == 1 && needs.is_public !=1"><img src="${baseUrl}/images/userCenter/step01.png"></center>
	                                 		<center class="needs-step" ng-if="needs.custom_string_status ==3&&needs.is_public !=1&&(needs.bidders|workflowNode)==0"><img src="${baseUrl}/images/userCenter/step02.png"></center>
	                                 		<center class="needs-step" ng-cloak ng-if="(needs.bidders|workflowNode)==1"><img src="${baseUrl}/images/userCenter/step005.png"></center>
		                                 	<!--<div class="col-md-12" style="background:#F1DEDE;color:#A8493F;line-height:15px;padding:10px 0;border-radius:5px;padding-left:15px;" ng-if="needs.custom_string_status ==2 && needs.is_public !=1">
												<span style="width:15px;background:#A54540;color:#fff;text-align:center;border-radius:8px;display:inline-block;font-size:0.7em;float:left;margin-top:1px">&times;</span>
												
												<span style="float:left"> &nbsp;未通 &nbsp; [审核-未通过] 此发布项目已被检举为不实项目</span>
											</div>-->
	                                		<table class="table">
												
												<tbody>
													<tr class="older-d-title older-d-title_line" >
															
														<td class="col-md-2">
														      <span ng-if="needs.is_beishu==1">装修预算</span>
														      <span ng-if="needs.is_beishu==0">客户姓名</span>
														</td>
														<td class="col-md-3">
														    <span ng-if="needs.is_beishu==1">发布时间</span>
														    <span ng-if="needs.is_beishu==0">联系电话</span>
														</td>
		                                                <td class="col-md-3">
		                                                    <span ng-if="needs.is_beishu==1">房屋类型</span>
														    <span ng-if="needs.is_beishu==0">创建时间</span>
		                                                </td>
		                                                <td class="col-md-3">
		                                                	<span ng-if="needs.is_beishu==1">项目状态</span>
														    <span ng-if="needs.is_beishu==0">项目地址</span>
		                                                </td>
														<td class="col-md-3" ng-if="needs.is_beishu==1" style="text-align:center">操作</td>
													</tr>
													<tr class="older-d-body">
														<td class="col-md-2">
															<span ng-if="needs.is_beishu==1">￥{{needs.decoration_budget}}</span>
														    <span ng-if="needs.is_beishu==0">{{needs.contacts_name}}</span> 
														</td>
														<td class="col-md-3">
														    <span ng-if="needs.is_beishu==1">{{needs.publish_time}}</span>
														    <span ng-if="needs.is_beishu==0">{{needs.contacts_mobile}}</span> 
														</td>
		                                                <td class="hidden-xs col-md-3">
		                                                	<span ng-if="needs.is_beishu==1">{{needs.house_type|replaceHouseType}}</span>
														    <span ng-if="needs.is_beishu==0">{{needs.publish_time}}</span> 
		                                                
		                                                  </td>
		                                               	<td class="col-md-2">											
											                <span ng-if="needs.is_beishu==0">{{needs.province_name}}{{needs.city_name}}{{needs.district_name|replaceNone}}</span>
		                                               	    <span ng-if="needs.custom_string_status ==1 && needs.is_public !=1 && needs.is_beishu==1" style="display:block;">[审核中]</span>
		                                               	    <span ng-if="needs.custom_string_status ==3 && needs.is_public !=1 && needs.is_beishu==1" style="display:block;">[进行中]</span>
		                                               	    <span ng-if="needs.custom_string_status ==2 && needs.is_public !=1 && needs.is_beishu==1" style="display:block;">[未通过审核]</span>
		                                               	    <span ng-if="needs.is_public ==1 && needs.is_beishu==1" style="color:red;display:block;">[需求已终止]</span>
															<span ng-if="needs.is_public !=1 && needs.is_beishu==1">目前投标人数:{{needs.bidder_count}}</span><br/>
															<span ng-if="needs.is_public !=1 && needs.is_beishu==1">在{{needs.end_day}}天内过期</span>			
														</td>
														<td class="col-md-1">
															<div class="visible-md visible-lg hidden-sm hidden-xs" style="margin-bottom:10px" >
																<a href="javascript:void(0);" class="btn btn-for-detail tooltips orderBut"  ng-if="needs.is_beishu==1"  data-toggle="modal" data-target="#orderDetail" data-placement="top" data-original-title="查看详情" ng-click="orderDetail(needs.needs_id,blist.designer_id,1,0,0);">查看详情</a>
																<a href="javascript:void(0);" ng-if="(needs.custom_string_status ==1 || needs.custom_string_status ==2) && (needs.is_public !=1 && needs.is_beishu != 0)" class="btn btn-for-detail tooltips orderBut" data-toggle="modal" data-target="#needs-not-passed" data-placement="top" data-original-title="修改需求" ng-click="orderDetail(needs.needs_id,blist.designer_id,1,0,0)" style="margin-top:10px">修改需求</a>
															</div>
															<div class="visible-md visible-lg hidden-sm hidden-xs" ng-if="needs.bidder_count==0 && needs.is_public !=1">
																<a  class="btn btn-for-detail tooltips orderBut" data-original-title="终止需求" data-placement="top" data-toggle="modal" href="javascript:;"  data-dismiss="modal" data-target="#confirm" ng-click="ends(needs.needs_id);">  
							                                                    	终止需求 </a>
							                                </div>
														</td>
													</tr>
													<tr ng-if="needs.custom_string_status==2">
														<td class="col-md-12" colspan="5" style="font-size:14px;color:#333;padding:0;">
													   		审核意见 : <span  ng-if="needs.audit_desc.length>0" ng-bind="needs.audit_desc"></span><span  ng-if="needs.audit_desc==null">无</span>
													   </td>
													</tr>
												</tbody>
											</table>
	                               		</div>
	                                	<div class="panel-group accordion-custom accordion-teal" id="accordion" ng-repeat="blist in needs.bidders"  ng-if="needs.is_beishu==1" ng-init="indexs=$index">
											<div class="panel panel-default accordionToggleOrder">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a class="accordion-toggleOrder" ng-click="getDesignInfo(blist.uid,blist.designer_id,blist.wk_cur_sub_node_id,blist.measurement_fee,blist.declaration,needs.needs_id);">
															<img  ng-if="blist.avatar!=''" ng-src="{{blist.avatar}}" width="30px" height="30px"/> 
															<img  ng-if="blist.avatar==''" src="${baseUrl}/images/global/avatar_def.jpg" width="30px" height="30px" /> 
															<i class="icon-arrow"></i>
															 {{blist.user_name}}
														</a>
													</h4>
												</div>
												<div id="collapseOne_{{needs.needs_id}}_{{blist.designer_id}}" class="accordionToggleCollapse">
													<div class="panel-body od-panel-body customer-order-designer">
														 <div class="panel-body">
														 <div class="swMain" ng-if="blist.wk_cur_sub_node_id>11||blist.wk_cur_sub_node_id==11">
														<ul>
															<li>
																<a href="javascript:void(0)" class="selected selecting">
																	<div class="stepNumber">
																		1
																		<i class="clip-checkmark-2" ng-if="blist.wk_cur_sub_node_id>=13"></i>
																	</div>
																	<span class="stepDesc"> 确认量房 </span>
																</a>
															</li>
															<li>
			
																<a href="javascript:void(0)" class="selecting" ng-class="{'selected selecting':blist.wk_cur_sub_node_id>=13}">
																	<div class="stepNumber">
																		2
																		<i class="clip-checkmark-2" ng-show="blist.wk_cur_sub_node_id>=21"></i>
																	</div>
																	<span class="stepDesc"> 支付量房费
																	</span>
																</a>
															</li>
															<li>
																<a href="javascript:void(0)" ng-class="{'selected selecting':blist.wk_cur_sub_node_id>=21}">
																	<div class="stepNumber">
																		3
																		<i class="clip-checkmark-2" ng-show="blist.wk_cur_sub_node_id>=41"></i>
																	</div>
																	<span class="stepDesc"> 接收设计合同
																	</span>
																</a>
															</li>
															<li>
																<a href="javascript:void(0)" ng-class="{'selected selecting':blist.wk_cur_sub_node_id>=41}">
																	<div class="stepNumber">
																		4
																		<i class="clip-checkmark-2" ng-if="blist.wk_cur_sub_node_id>=41"></i>
																	</div>
																	<span class="stepDesc"> 支付设计首款
																	</span>
																</a>
															</li>
															<li>
																<a href="javascript:void(0)" ng-class="{'selected selecting':blist.wk_cur_sub_node_id>=41}">
																	<div class="stepNumber">
																		5
																		<i class="clip-checkmark-2" ng-if="blist.wk_cur_sub_node_id>=51"></i>
																	</div>
																	<span class="stepDesc"> 支付设计尾款	</span>
																</a>
															</li>
														    <li>
																<a href="javascript:void(0)" ng-class="{'selected selecting':blist.wk_cur_sub_node_id>=51}">
																	<div class="stepNumber">
																		6
																		<i class="clip-checkmark-2" ng-if="blist.wk_cur_sub_node_id>=61"></i>
																	</div>
																	<span class="stepDesc"> 接收设计交付物</span>
																</a>
															</li>
															</ul>
													 	</div>
													 	<table class="table bid-designer-info">
														 	<tr class="older-d-title older-d-title_line" ng-if="blist.wk_cur_sub_node_id>=11" >	
																
																<td class="col-md-3">
																      <span ng-if="needs.is_beishu==1">项目金额</span>
																</td>
																<td class="col-md-4" style="padding-left: 12%;">
																    <span ng-if="needs.is_beishu==1">创建时间</span>
																</td>
				                                                <td class="col-md-4"  style="padding-left: 2%;" ng-if="blist.wk_cur_sub_node_id>=13">
				                                                    <span ng-if="needs.is_beishu==1">操作</span>
				                                                </td>
														    </tr>
														    <tr ng-if="blist.wk_cur_sub_node_id>=11">
														 		<td ng-if="blist.wk_cur_sub_node_id>=31" class="col-md-3" id="spanheigh">
															 		<span>总&nbsp;&nbsp;金&nbsp;&nbsp;额&nbsp;&nbsp;:&nbsp;</span>
															 		<span ng-if="blist.wk_cur_sub_node_id>=31">{{blist.design_contract[0].contract_charge|currency : '￥'}}</span> <br>
															 		<div ng-if="blist.design_contract.length>0 && blist.wk_cur_sub_node_id>=41">
															 		   <span>已付金额&nbsp;&nbsp;:&nbsp;&nbsp;</span>
															 		      <!--   <span ng-if="blist.wk_cur_sub_node_id<41">{{blist.measurement_fee|currency : '￥'}}</span> -->
															 		        <span ng-if="blist.wk_cur_sub_node_id==41">{{blist.design_contract[0].contract_first_charge|currency : '￥'}}</span>
															 		        <span ng-if="blist.wk_cur_sub_node_id>=51">{{blist.design_contract[0].contract_charge|currency : '￥'}}</span><br>
															 		
															 		   <span>未付金额&nbsp;&nbsp;:&nbsp;&nbsp;</span>
															 		        <!-- <span ng-if="blist.wk_cur_sub_node_id>41">￥0.00</span> -->
															 		        <span ng-if="blist.wk_cur_sub_node_id==41">{{blist.design_contract[0].contract_charge-blist.design_contract[0].contract_first_charge|currency : '￥'}}</span>
															 		       <!--  <span ng-if="blist.wk_cur_sub_node_id==31">{{blist.design_contract[0].contract_first_charge-blist.measurement_fee|currency : '￥'}}</span> -->
															 		        <span  ng-if="blist.wk_cur_sub_node_id>=51">{{'0'|currency : '￥'}}</span>
															 		</div>
															 		<p style="font-size:12px;color:#818181;"><img style="display: inline-block;width:15px;height: 16px;margin-top: -2px;" src="${baseUrl}/images/userCenter/iii.png"/>已付量房费{{blist.measurement_fee|currency : '￥'}}</p><br>
														 			
														 		</td>
														 		<td ng-if="blist.wk_cur_sub_node_id<31" class="col-md-3">
															 	    量房费&nbsp;:&nbsp;{{blist.measurement_fee|currency : '￥'}}	
														 		</td>
													 		    <td   class="col-md-4" style="padding-left: 12%;">{{blist.join_time}}</td>
													 		    <td ng-if="blist.wk_cur_sub_node_id>=13" class="col-md-5"  style="padding-left: 2%;">
													 		         
													 
												 		    		<a href="javascript:void(0);" class="btn btn-for-detail tooltips orderBut"  ng-if="needs.is_beishu==1&&blist.wk_cur_sub_node_id==13||blist.wk_cur_sub_node_id==41"  data-toggle="modal" data-target="#pay_first" data-placement="top" data-original-title="查看详情" ng-click="orderDetail(needs.needs_id,blist.designer_id,3,blist.wk_cur_sub_node_id,blist.measurement_fee,blist.uid,blist.orders,blist.design_contract)" >支付</a>
												 		    	
																	<a href="javascript:void(0);" ng-if="blist.wk_cur_sub_node_id==31"  ng-click="contract(needs,blist.design_contract,blist.orders,blist.designer_id,blist.uid,blist.wk_cur_sub_node_id,blist.measurement_fee);" class="btn btn-for-detail tooltips orderBut" data-toggle="modal" data-target="#contract2" data-placement="top" data-original-title=""  style="margin:10px 0">接收设计合同</a> 															
																	<a href="javascript:void(0);" ng-if="blist.wk_cur_sub_node_id>=61"  class="btn btn-for-detail tooltips orderBut" data-toggle="modal" data-target="#design-case-list" data-placement="top" data-original-title="" ng-click="viewDelivery(needs.needs_id,blist.designer_id,blist.wk_cur_sub_node_id,needs.community_name)" style="margin-top:10px">设计交付查看</a>
																	<a href="javascript:void(0);" ng-if="blist.delivery[0].files.length>0&&blist.wk_cur_sub_node_id==33"  class="btn btn-for-detail tooltips orderBut" data-toggle="modal" data-target="#design-case-list" data-placement="top" data-original-title="" ng-click="viewDelivery(needs.needs_id,blist.designer_id,blist.wk_cur_sub_node_id,needs.community_name)" style="margin-top:10px">量房交付查看</a>
																	<span ng-if="blist.wk_cur_sub_node_id==14">抱歉！设计师因案件过多，拒绝了您的量房申请</span>
																	<span ng-if="blist.wk_cur_sub_node_id==33&&blist.delivery[0].files.length==0">[项目结束]</span>
																	<span ng-if="blist.wk_cur_sub_node_id==51">[等待上传交付物]</span>
													 		    </td>
													 		</tr>
														</table>
														<div id="UserDetail_{{needs.needs_id}}_{{blist.designer_id}}" class="col-md-12" ng-if="blist.wk_cur_sub_node_id<11"></div>
													 	<table class="table " ng-if="blist.bidder_count != 0 && blist.wk_cur_sub_node_id<11">
															<tbody>
																<tr class="older-d-body">
																	<td></td>	
																	<td></td>																																		
																	<td></td>
																	<td></td>
																	<td class="center"></td>
																	<td class="center order-select-ta-tr" style="text-align:right">
																		<div class="visible-md visible-lg hidden-sm hidden-xs sadoasop" ng-if="blist.wk_cur_sub_node_id<11||wk_cur_sub_node_id==''">
						                                                    <a href="javascript:void(0)" ng-if="needs.is_beishu!=0" data-toggle="modal" data-target="#refuse" class="btn btn-for-detail tooltips order-select-ta-but" data-placement="top" data-original-title="拒绝" ng-click="orderDetail(needs.needs_id,blist.designer_id,blist.user_name)">拒绝</a>
						                                                    <a href="javascript:void(0)" id="vsddop" ng-if="needs.is_beishu!=0"  class="btn btn-for-detail tooltips order-select-ta-but"  data-toggle="modal" data-target="#orderDetail" data-placement="top"  ng-click="orderDetail(needs.needs_id,blist.designer_id,2,blist.wk_cur_sub_node_id,blist.measurement_fee);"  data-original-title="选择TA量房">选TA量房</a>
																		</div>
																		<div class="visible-md visible-lg hidden-sm hidden-xs" ng-if="blist.wk_cur_sub_node_id==21">
																			<!--<a class="btn btn-for-detail tooltips" data-original-title="设计合同确认" data-placement="top" data-toggle="modal" href="javascript:void(0);">设计合同确认</a><br /><br/>
																			<a class="btn btn-for-detail tooltips" data-original-title="支付量房费" data-placement="top" data-toggle="modal" href="javascript:void(0);" data-target="#pay_first" ng-click="prePay(needs.needs_id,blist.designer_id)">量房支付</a></div>  -->
																		</div>	
																	</td>
																</tr>
																<tr class="older-d-body" ng-if="blist.wk_template_cur_node_id>11">
																	<td>已付金额:￥0000.00</td><td></td><td></td>
																</tr>
																<tr class="older-d-body" ng-if="blist.wk_template_cur_node_id>11">
																	<td>未付金额:￥0000.00</td><td></td><td></td>
																</tr>
																<tr class="older-d-body" ng-if="blist.wk_template_cur_node_id>11">
																	<td>本次待付金额:￥0000.00</td><td></td><td></td>
																</tr>
															</tbody>
														</table>
													</div>
													<div style="height:26px;position: relative;margin-bottom:-18px;">
							                <div class="DesignerInformation">
												<!-- <img alt="" src="${baseUrl}/images/global/arrow_up.png"> -->
											</div>
											<div class="Di-content col-md-12" id="DesignerInf_{{index}}">
														<div class="col-md-12">
															<div class="col-md-2 col-sm-2 Di-margin" ng-click="orderDetail(needs.needs_id,blist.designer_id,3,blist.wk_cur_sub_node_id,blist.measurement_fee,blist.measure_time)">
																<div class="center" >
																	<a href="javascript:void(0);" data-toggle="modal" data-target="#orderDetail" data-placement="top" data-original-title="量房表单" ><img src="${baseUrl}/images/global/designerIcon(5).png"/></a>
																	<div class="desgInfo-title">量房表单</div>
																</div>
															</div>
															<div class="col-md-2 col-sm-2 Di-margin" ng-if="blist.wk_cur_sub_node_id==33&&blist.delivery[0].files.length>0" ng-click="viewDelivery(needs.needs_id,blist.designer_id,blist.wk_cur_sub_node_id,needs.community_name);">
																<div class="center">
																	<a href="javascript:void(0);" data-toggle="modal" data-target="#confirm5" data-placement="top" data-original-title="量房交付" ><img src="${baseUrl}/images/global/designerIcon(6).png"/></a>
																	<div class="desgInfo-title">量房交付</div>
																</div>
															</div>
															<div class="col-md-2 col-sm-2 Di-margin" ng-if="blist.wk_cur_sub_node_id>=41" ng-click="viewDelivery(needs.needs_id,blist.designer_id,blist.wk_cur_sub_node_id,needs.community_name);">
																<div class="center">
																	<a href="javascript:void(0);" data-toggle="modal" data-target="#contract2" ng-click="contract(needs,blist.design_contract,blist.orders,blist.designer_id,blist.uid,blist.wk_cur_sub_node_id);" data-placement="top" data-original-title="设计合同" ><img src="${baseUrl}/images/global/designerIcon(7).png"/></a>
																	<div class="desgInfo-title">设计合同</div>
																</div>
															</div>
															<div class="col-md-2 col-sm-2 Di-margin" ng-if="blist.wk_cur_sub_node_id>=61" ng-click="viewDelivery(needs.needs_id,blist.designer_id,blist.wk_cur_sub_node_id,needs.community_name);">
																<div class="center">
																	<a href="javascript:void(0);" data-toggle="modal" data-target="#confirm6" data-placement="top" data-original-title="渲染图" ><img src="${baseUrl}/images/global/designerIcon(1).png"/></a>
																	<div class="desgInfo-title">渲染图</div>
																</div>
															</div>
															<div class="col-md-2 col-sm-2 Di-margin" ng-if="blist.wk_cur_sub_node_id>=61" ng-click="viewDelivery(needs.needs_id,blist.designer_id,blist.wk_cur_sub_node_id,needs.community_name);">
																<div class="center">
																	<a href="javascript:void(0);" data-toggle="modal" data-target="#confirm5" data-placement="top" data-original-title="设计图纸" ><img src="${baseUrl}/images/global/designerIcon(2).png"/></a>
																	<div class="desgInfo-title">设计图纸</div>
																</div>
															</div>
															<div class="col-md-2 col-sm-2 Di-margin" ng-if="blist.wk_cur_sub_node_id>=61" ng-click="viewDeliveryService(needs.needs_id,blist.designer_id);">
																<div class="center">
																	<a href="javascript:void(0);" data-placement="top" data-original-title="3D DIY方案" ><img src="${baseUrl}/images/global/designerIcon(3).png"/></a>
																	<div class="desgInfo-title">3D设计</div>
																</div>
															</div>
															<div class="col-md-2 col-sm-2 Di-margin" ng-if="blist.wk_cur_sub_node_id>=61" ng-click="viewDelivery(needs.needs_id,blist.designer_id,blist.wk_cur_sub_node_id,needs.community_name);">
																<div class="center">
																	<a href="javascript:void(0);" data-toggle="modal" data-target="#confirm4" data-placement="top" data-original-title="材料清单" ><img src="${baseUrl}/images/global/designerIcon(4).png"/></a>
																	<div class="desgInfo-title">材料清单</div>
																</div>
															</div>
														</div>
												</div>
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
						<pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" ></pagination>
					
					<!-- end: PAGE -->
				<!--量房资料-->
				
								<div class="modal fade confirmMain" id="needs-not-passed" tabindex="-1" role="dialog" aria-hidden="true">
									<div class="modal-dialog" style="width:802px;" id="hsasdop">
										<div class="modal-content">
											<div class="modal-header common-border-bottom" style="border:none;padding:30px;padding-bottom:0px">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="font-size:20px">
													<img src="${baseUrl}/images/userCenter/m-close-icon.png"/>
												</button>
												<h4 class="modal-title common-modal-title">修改设计需求</h4>
											</div>
											<div class="row">
						                            <div class="col-md-12" style="display:none">
						                            	<div class="not-passed">
						                            		<img src="${baseUrl}/images/userCenter/needs-not-passed.png" alt=""/>
						                            	</div>
						                            	<div class="not-passed-tip">
						                            		<span class="opsdff">项目审核未通过</span><br>
						                            		<span class="opsdf uopenmy">您的联系电话填写错误，请改正后重新提交</span>
						                            	</div>
													</div>
										 		</div>
											<div class="modal-body common-border-bottom" >
					                            <div class="panel-group accordion-custom accordion-teal" id="accordion">
					                            	<div class="panel panel-default">
														<form action="pages_messages2.html" role="form" >
															<div class="row">
																<div class="col-md-6">
																	<div class="form-group">
																		<span class="symbol required"></span> <label class="control-label">姓名 : </label>
																		<input type="text"  readonly="true" placeholder="吴XX(若我发布设计需求已填资料直接显示）" class="form-control input-new-color" id="firstname" name="firstname"  value="" ng-model="detail.contacts_name" style="background-color:#fff;"/>
																		<span class="tips_false"></span>
																	</div>	
																</div>
					                                            <div class="col-md-6">
																	<div class="form-group">
																		<span class="symbol required"></span> <label class="control-label">手机号码 : </label>
																		<input type="text" placeholder="" class="form-control input-new-color" maxlength="11" id="phone" name="phone" value="" ng-model="detail.contacts_mobile" onkeyup="return ValidateNumber(this,value)" required=""/>
																		<span class="tips_false"></span>
																	</div>	
																</div>
					                                            <div class="col-md-6">
																	<div class="form-group">
																		<span class="symbol required"></span> <label class="control-label">房屋类型 : </label>
																		<select name="dd" id="dd" class="form-control selectasdop" ng-model="detail.house_type" ng-selected="detail.house_type" required=""> 
																		<option value="house" >住宅空间</option>
										                                <option value="catering">餐饮空间</option>
										                                <option value="office">办公空间</option>
										                                <option value="hotel">酒店空间</option>
										                                <option value="business">商业展示</option>
										                                <option value="entertainment">娱乐空间</option>
										                                <option value="leisure">休闲场所</option>
										                                <option value="culture">文化空间</option>
										                                <option value="healthcare">医疗机构</option>
										                                <option value="sale">售楼中心</option>
										                                <option value="finace">金融场所</option>
										                                <option value="sport">运动场所</option>                             
										                                <option value="education">教育机构</option>
										                                <option value="other">其他</option>
																		</select>
																		<span class="tips_false"></span>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<span class="symbol required"></span> <label class="control-label">房屋面积（m²）: </label>
																		<input type="text" placeholder="m²" class="form-control input-new-color" maxlength="7" id="h_mesure" name="project-price" ng-model="detail.house_area" onkeyup="return ValidateFloat(this,value)">
																		<span class="tips_false"></span>
																	</div>	
																</div>
																<div class="col-md-6">
																	<div class="form-group selectF">
						                                                <span class="symbol required"> </span> <label class="control-label"> 设计预算: </label>
						                                                <!-- <div style="position:relative"><input type="text" placeholder="" class="form-control" id="money" name="project-price" ng-model="decoration_budget" style="ime-mode:disabled" onkeyup="return ValidateFloat(this,value)" required="" /><span style="position:absolute;right:-30px;top:8px;color:#666">万元</span></div> -->
						                                                <select class="form-control selectasdop" id="design_budget" name="design_budget" ng-model="detail.design_budget" ng-selected="detail.design_budget">
						                                                	  <option value="3000元以下"> 3000元以下 </option> 
						                                                	 <option value="3000元-6000元"> 3000元-6000元 </option> 
						                                                	 <option value="6001元-10000元"> 6001元-10000元 </option> 
						                                                	 <option value="10001元-50000元"> 10001元-50000元 </option> 
						                                                	 <option value="50000元以上"> 50000元以上 </option>
						                                               	</select>
						                                                <span class="tips_false"> </span>
		                                            				</div>
		                                            			</div>	
					                                            
					                                            <div class="col-md-6">
																	<div class="form-group">
																		<span class="symbol required"></span> <label class="control-label">装修预算（元）: </label>
																		<select  class="form-control selectasdop"  id="decoration_budget" name="Decoratebudget" ng-selected="detail.decoration_budget" ng-model="detail.decoration_budget">																	
																			<option value="5万以下"> 5万以下 </option> 
						                                                	<option value="5万-10万"> 5万-10万 </option> 
						                                                	<option value="10万-15万"> 10万-15万 </option> 
						                                                	<option value="15万-20万"> 15万-20万 </option> 
						                                                	<option value="20万以上"> 20万以上 </option>
																		</select>
																		<span class="tips_false"></span>
																		<!--<input type="text" placeholder="万元" class="form-control input-new-color" id="money"  value="{{detail.decoration_budget}}" name="万元"/>-->
																	</div>	
																</div>
					                                             <div class="col-md-6">
																	<div class="form-group">
																		<span class="symbol required"></span> <label class="control-label">风格 : </label>																		
																		<select  class="form-control selectasdop" id="renovationStylereq" name="renovationStylereq" ng-model="detail.decoration_style" ng-selected="detail.decoration_style">
					                                						<option value="Japan">日式</option>
			                                								<option value="korea">韩式</option>
			                                								<option value="Mashup">混搭</option>
						                                					<option value="european">欧式</option>
						                                					<option value="chinese">中式</option>
						                                					<option value="neoclassical">新古典</option>
						                                					<option value="ASAN">东南亚</option>
						                                					<option value="US">美式</option>
						                                					<option value="country">田园</option>
						                                					<option value="modern">现代</option>
						                                					<option value="mediterranean">地中海</option>
						                               						<option value="other">其他</option>
														               	</select>
														               	<span class="tips_false"></span>
																	</div>
																</div>
																<div class="col-md-6">
					                                            	<div class="form-group connected-group">
																		 <span class="symbol required"></span> <label class="control-label">户型 :</label>
																		<div class="row">
																			<div class="col-md-4" style="padding:0px;padding-left:5px">
																				<select name="type_lv_room" id="room" class="form-control selectashu" ng-model="detail.room" ng-selected="detail.room">
					                                								<option value="one">一室</option>
													                                <option value="two" >二室</option>
													                                <option value="three">三室</option>
													                                <option value="four">四室</option>
													                                <option value="five">五室</option>
													                                <option value="loft">LOFT</option>
													                                <option value="multiple">复式</option>
													                                <option value="villa">别墅</option>
													                                <option value="other">其他</option>
					                                							</select>
					                                							<span class="tips_false"></span>
																			</div>
																			<div class="col-md-4" style="padding:0px;padding-left:5px">
																				<select name="type_room" id="livingroomCountreq" class="form-control selectashu" ng-model="detail.living_room" ng-selected="detail.living_room">	
																					<option value="one" >一厅</option>
							                                 						<option value="two">二厅</option>
							                                 						<option value="three">三厅</option>
							                                 						<option value="four">四厅</option>
							                                 						<option value="five">五厅</option>
					                                                  			</select>
					                                                  			<span class="tips_false"></span>
																			</div>
																			<div class="col-md-4" style="padding:0px;padding-left:5px">
																				<select name="type_rst_room" id="bathroomCountreq" class="form-control selectashu" ng-model="detail.toilet" ng-selected="detail.toilet">
					                            									<option value="one" >一卫</option>
							                                						<option value="two">二卫</option>
							                                						<option value="three">三卫</option>
							                                						<option value="four">四卫</option>
							                                						<option value="five">五卫</option>
					                                                        	</select>	
					                                                        	<span class="tips_false"></span>
					                                                        </div>
																		</div>
																	</div>
					                                            </div>
					                                            <div class="col-md-12">
					                                            	<div class="form-group connected-group">
																		<span class="symbol required"></span> <label class="control-label">项目地址 : </label>
																		<div class="row" id="sapdasd">
																			<div class="col-md-3">
																				<select id="seachprov" name="s_province" class="form-control select-none siteaa"  onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>
																				<span class="tips_false TipsFalse TipsFal"></span>
																			</div>
																			<div class="col-md-3">
																				<select name="s_city" id="seachcity" class="form-control select-none siteaa" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>
																				<span class="tips_false TipsFalse TipsFal"></span>
																			</div>
																			<div class="col-md-3">
																				<select id="seachdistrict" name="s_county" class="form-control select-none siteaa" ></select>
																				<span class="tips_false TipsFalse TipsFal"></span>
																			</div>
																			<div class="col-md-3">
																				<input type="text" placeholder="地址" id="house-name" name="house-name" class="form-control input-new-color" maxlength="32" ng-model="detail.community_name" required="">
																				<span class="tips_false TipsFalse TipsFal"></span>
																			</div>
																		</div>
																	</div>
					                                            </div>
															</div>
														</form>
													</div>
												</div>			                                           
											</div>
											<div class="modal-footer common-modal-footer">
												<button type="button" class="NewBtn btn-defaultClose"   data-dismiss="modal">关闭</button>
												<button type="button" class="NewBtn btn-primarySubmit button"  ng-click="modify(detail.needs_id)" >提交</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>	
										
								
							<div class="modal fade confirmMain" id="design-case-list" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:7%;">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header" style="padding:25px 25px 10px 25px">
											<button class="close not-transparent" aria-hidden="true" type="button" data-dismiss="modal">
								                <img src="${baseUrl}/images/userCenter/m-close-icon.png"/>
								            </button>
											<h4 class="modal-title">{{community_name}}</h4>
										</div>			
										<div class="modal-body" style="overflow:hidden">
											<div class="row">
									           <div class="col-sm-12">
													<div class="dclist-panel">
														<div class="panel-heading dclist-paner-heading" style="background:#f4f4f4;">交付档案列表
														</div>
														<div class="panel-body">
															<table class="table">
																<thead><tr><th>档案类别</th><th>档案名称</th><th>操作</th></tr>
																</thead>
																<tbody style="min-height:260px;">
																	<tr ng-if="status!=33">
																		<td class="center"><img alt="image" src="${baseUrl}/images/userCenter/design_case_icon_01.png" height="48" width="40">
																		</td>
																		<td>3D 设计方案</td>
																		<td class="center" style="color:#1fbad6" ng-click="viewDeliveryService(needs_id,designer_id)">
																			<a href="javascript:void();">
																			<img src="${baseUrl}/images/userCenter/design_case_eye_icon.png" title="查看" alt="查看">
																			</a>
																		</td>
																	</tr>
																	<tr ng-if="status!=33">
																		<td class="center">
																			<img alt="image" src="${baseUrl}/images/userCenter/design_case_icon_02.png" height="48" width="40">
																		</td>
																		<td>渲染图</td>
																		<td class="center">
																			<a id="finialbn02" data-target="#confirm6" data-toggle="modal" title="查看" href="javascript:void(0)" >
																				<img src="${baseUrl}/images/userCenter/design_case_eye_icon.png" alt="查看" title="查看">
																			</a>
																		</td>
																	</tr>
																	<tr>
																		<td class="center">
																			<img alt="image" src="${baseUrl}/images/userCenter/design_case_icon_03.png" height="48"  title="查看" width="40">
																		</td>
																		<td>设计图纸</td>
																		<td class="center">
																			<a id="finialbn03" data-target="#confirm5" data-toggle="modal"  data-placement="bottom" data-toggle="modal" title="查看" href="javascript:void(0)" >
																				<img src="${baseUrl}/images/userCenter/design_case_eye_icon.png" alt="查看" title="查看">
																			</a>
																		</td>
																	</tr>
																	<tr ng-if="status!=33">
																		<td class="center">
																			<img alt="image" src="${baseUrl}/images/userCenter/design_case_icon_04.png" height="48" width="40">
																		</td>
																		<td>材料清单</td>
																		<td class="center">
																			<a id="finialbn03" data-target="#confirm4" data-toggle="modal"  title="查看" href="javascript:void(0)" >
																				<img src="${baseUrl}/images/userCenter/design_case_eye_icon.png" alt="查看" title="查看">
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
											<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose"  data-placement="bottom" data-original-title="关闭">关闭</a>
											<!--<a href="javascript:void(0);" class="NewBtn btn-primarySubmit tooltips" data-placement="bottom" data-original-title="提交">提交</a>-->
										</div>
									</div>
									<!-- .modal-content -->
								</div>
									<!-- .modal-dialog -->
							</div>
							
							
		<div class="modal fade confirmMain" id="confirm5" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog"  style="width:640px;">
			<div class="modal-content">
				<div class="modal-header" style="padding:25px;">
					<button class="close" aria-hidden="true" type="button" data-dismiss="modal">
		                <img src="${baseUrl}/images/userCenter/m-close-icon.png"/>
		            </button>
					<h4 class="modal-title">{{community_name}}</h4>
				</div>
				<div class="modal-body" style="overflow:hidden" style="padding:25px!important;">
		           <div class="col-sm-12" style="padding:0;">
						<div class="panel panel-default" style="border:2px solid #f4f4f4;height:400px;">
							<div class="panel-heading" style="border:none;">
									设计图纸
								<div class="panel-tools"> </div>
							</div>
							<div class="panel-body wrapper" id="description" style="padding:0 10px;">
								<a href="javascript:void(0)" class="planfloat" data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==3">
									<div class="plan vonfirm5">
										<img ng-src="{{scheme.url}}" alt="" ng-click="enlargePicture(scheme.usage_type);">
									</div>
									<div class="center">设计图纸</div>
								</a>
							</div>
						</div>
		           </div>
				</div>
				<div class="modal-footer">
					<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				</div>
			</div>
		</div>
	</div> 
				
	<div class="modal fade confirmMain" id="confirm4" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog"  style="width:640px;">
			<div class="modal-content">
				<div class="modal-header" style="padding:25px;">
		             <button type="button" class="close" aria-hidden="true" data-dismiss="modal">
		                  <img src="${baseUrl}/images/userCenter/m-close-icon.png"/>
		            </button>
					<h4 class="modal-title">{{community_name}}</h4>
				</div>
				<div class="modal-body" style="overflow:hidden" style="padding:25px!important;">
		           <div class="col-sm-12" style="padding:0;">
						<div class="panel panel-default" style="border:2px solid #f4f4f4;height:400px;">
							<div class="panel-heading" style="border:none;">
									材料清单
								<div class="panel-tools"> </div>
							</div>
							<div class="panel-body wrapper" id="description">
								<div href="javascript:void(0)" class="planfloat" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==2" >
									<div class="plan vonfirm4">
										<img ng-src="{{scheme.url|deliveryFileUrl}}" ng-if="scheme.name|deliveryFileBom" alt="" class="materials" ng-click="enlargePicture(scheme.usage_type);" data-dismiss="modal" data-target="#confirm10" data-toggle="modal">
										<a href="{{scheme.url}}"><img ng-src="{{scheme.url|deliveryFileUrl}}" ng-if="scheme.name|deliveryFileType" alt="" class="materials"></a>
									</div>
									<div class="center">材料清单</div>
								</div>
							</div>
						</div>
		           </div>
				</div>
				<div class="modal-footer">
					<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	
	<div class="modal fade confirmMain" id="confirm6" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog"  style="width:640px;">
			<div class="modal-content">
				<div class="modal-header" style="padding:25px;">
					<button class="close" aria-hidden="true" type="button" data-dismiss="modal">
		               <img src="${baseUrl}/images/userCenter/m-close-icon.png"/>
		            </button>
					<h4 class="modal-title">{{community_name}}</h4>
				</div>
				<div class="modal-body" style="overflow:hidden" style="padding:25px!important;">
		           <div class="col-sm-12" style="padding:0;">
						<div class="panel panel-default" style="border:2px solid #f4f4f4;height:400px;">
							<div class="panel-heading" style="border:none;">
									居然大厦方案一 &gt; 渲染图
								<div class="panel-tools"> </div>
							</div>
							<div class="panel-body wrapper" id="description" style="padding:0 10px;">
								<a href="javascript:void(0)" class="planfloat"  data-dismiss="modal" data-target="#confirm10" data-toggle="modal" ng-repeat="scheme in deliveryFiles" ng-init="index=$index" ng-if="scheme.usage_type==0" >
									<div class="plan vonfirm6">
										<img ng-src="{{scheme.url}}" alt="" ng-click="enlargePicture(scheme.usage_type);">
									</div>
									<div class="center">渲染{{index+1}}</div>
								</a>
							</div>
						</div>
		           </div>
				</div>
				<div class="modal-footer">
					<a href="javascript:void(0);" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
				</div>
			</div>
		</div>
	</div> 	
	
	<div class="modal fade confirmMain" id="confirm10" tabindex="-1" role="dialog" aria-hidden="true" style="margin-top:5%">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" style="padding:25px;">
				<button class="close" aria-hidden="true" type="button" data-dismiss="modal" style="font-size:34px;color:#000;" >
	                &times;
	            </button>
	            <div class="close clase1" aria-hidden="true" style="color:#000;font-size:60px;display:none;">&times;退出全屏</div>
				<h4 class="modal-title">{{community_name}}</h4>
			</div>
			<div class="modal-body" style="overflow:hidden" style="padding:25px!important;">
	           <div class="col-sm-12" style="padding:0;">
					<div class="panel panel-default col-md-12" style="padding:20px;">
						<ul class="pgwSlideshow" style="min-width:2000px;">
						    <li ng-repeat="scheme in deliveryFiles" ng-init="inde=$index" ng-if="scheme.usage_type==type">
						      <img ng-src="{{scheme.url}}" alt="" data-description="" ng-if="scheme.name|deliveryFileBom">
						    </li>
						</ul>
					</div>
	           </div>
			</div>
		</div>
	</div>
</div> 	


<div id="windowImg" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="z-index:999999999999;background:#09091A;hieght:100vh;">
	<div style="position:absolute;right:35px;top:20px;">
		<button class="close" aria-hidden="true" type="button" data-dismiss="modal" data-toggle="modal" data-target="#confirm10" style="font-size:34px;color:#fff;" onclick="setTimeout('$(window).resize()', 10)">
            <img src="${baseUrl}/images/userCenter/m-close-icon1.png">
        </button>
	</div>
	<div class="windowImages" style="width:90%;margin:50px auto 0;overflow:hidden;">
		<ul class="pgwSlideshow" style="min-width:2000px;">
		    <li ng-repeat="scheme in deliveryFiles" ng-init="indexs=$index" ng-if="scheme.usage_type==type">
		        <img ng-src="{{scheme.url}}" alt="" data-description="" ng-if="scheme.name|deliveryFileBom">
		    </li>
		</ul>
	</div>
</div>
<#else>
	<script >
	$(function(){
		location.href = baseUrl+"/";
	});
	</script>
</#if>
<script src="${baseUrl}/js/userCenter/addNeeds.js"></script>
<script src="${baseUrl}/js/public/date-time/bootstrap-datetimepickeruser.min.js"></script>
<script src="${baseUrl}/js/public/date-time/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${baseUrl}/js/public/Area.js"></script>
<script src="${baseUrl}/js/public/AreaData_min.js"></script>
<script src="${baseUrl}/js/public/pgwslideshow.min.js"></script>
<script>
$(function(){
	$('.panelAccordionHeading').click(function(){
		if($(this).parent('.panel-default').hasClass('default')){
			$(this).parent('.panel-default').removeClass('default');
			
		}else{
			$(this).parent('.panel-default').addClass('default');
		}
	});
})

</script>
<script type="text/javascript">
$(function(){
     initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '0', '0', '0');
});
$(function(){
	$(document).ready(function(){
		  $(".showContent").click(function(){
		    $("#contract-body").slideToggle();            
		  });
		});
});
</script>
								 
	<script language="javascript">
		 function testnull(){
		     if (document.getElementById('dateop').value==''){
		     	//emporalsupport.innerHTML="<font class='tips_false'>请输入内容</font>";
		         $("#transmit").attr({"disabled":"disabled"});
		         document.getElementById('dateop').focus();
		     }else{
		    	 $("#time").attr('style','display:none');
		    	 $("#dateop").attr('style','background-color: #fff;border-radius: 5px;');
		     	 $('#transmit').removeAttr("disabled"); 
		     }
		 } 
		 testnull();
	</script>
	<script type="text/javascript">
    	$(document).ready(function(){
    		 pageActive("prodect");
    	   var datejsop=new Date();
    	   $("#info-datetimepicker").attr('data-date',datejsop);
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
			 
			//$("#info-datetimepicker").datetimepicker('show');
			$(document).on('click', '#info-datetimepicker', function(){
				$(this).datetimepicker({
  			   		language:  'zh-CN',
  			   		autoclose: true,
    	   			startDate: datejsop,
          			minuteStep: 10,
          			pickerPosition: "bottom-right"
  			    });
				console.log('---->' + $(this).height());
				$(this).datetimepicker('show');
				
			    var height= $('#info-datetimepicker').offset().top;
			    var hh="-260px";
				$('.datetimepicker').css({
					 top:height,
					 marginTop:hh,
					});
			});
			$(document).on('click','#scrollTopG .scrollTopG',function(){
		 	    $('html,body').animate({scrollTop:0},'slow');
		 	});
    	});   
    </script> 
    <script type="text/javascript">
    	
		$(document).on('click','.accordionToggleOrder .accordion-toggleOrder',function(){
			//alert();
			$(this).parents('#accordion').toggleClass('AccordionToggleOrder');
		})
	</script>
 </div>
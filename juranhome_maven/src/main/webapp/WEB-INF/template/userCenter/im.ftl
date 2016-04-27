<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#assign baseUrl=request.contextPath/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>IM Tester v1.0</title>
  <link rel="stylesheet" type="text/css" href="${baseUrl}/css/im.css"> 
  <script src="${baseUrl}/js/im/notificationWebSocket.js"></script>
  <script src="${baseUrl}/js/im/chat_cus.js"></script>  
</head>
<body>
<div class="main-content">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
	              <li>
	              	<i class="clip-file"> </i> <a href="../../frontend/clip-one/index.html"> 个人中心</a>
	              </li>
	              <li class="active">
	              		 即时通讯
	              </li>
            	</ol>
				<div class="page-header">
					<h3>即时通讯</h3>
				</div>	
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="main-penal">
					<div class="msg-penal-heading">
						<div class="panal-issue"><i class="fa-i issue-icon"></i></div>即时通讯
						<div class="panal-refresh">			
						</div>				
					</div>
					<div class="msg-penal-body">
						<ul class="mpb-left">
							<li class="msg-search">
								<form action="#" class="msgform">
									<div class="seah-input">
										<input class="input-box" type="text" placeholder="搜索..."></input>
										<div class="msg-input-submit search"><div class="mis-search-icon"></div></div>
									</div>	
								</form>
							</li>
							<li class="msg-item" id="20728733">
								<div class="msg-item-left"><div class="msg-item-star"></div><div class="msg-item-avatar"></div>	
								</div>
								<div class="msg-item-rightop">
									<div class="rt-left"><img class="msg-item-img" src="${baseUrl}/images/im/photo.jpg" alt=""/>
									</div>
									<div class="rt-rightop">
										<span class="msg-item-from">创展国际Peter..</span><div class="msg-item-time">下午02:44</div>
									</div>
									<div class="rt-right-bottom"><span class="msg-item-title">最新对话标题...</span>
									</div>
								</div>
								<div class="msg-item-right-bottom"><span class="msg-item-cont">最新对话内容...</span>
								</div>
							</li>	
						</ul> 
						<div class="mpb-right">
							<div class="msg-header">
								<div class="msg-from"><h4 class="title">创展国际Peter Lo</h4></div>
								<div class="msg-progress">	
									<ul>
										<li><a class="selected" href="#"><div class="stepNumber">1</div><span class="stepDesc">沟通</span></a></li>
										<li><a href="#"><div class="stepNumber">2</div><span class="stepDesc">量房</span></a></li>
										<li><a href="#"><div class="stepNumber">3</div><span class="stepDesc">设计合同</span></a></li>
										<li><a href="#"><div class="stepNumber">4</div><span class="stepDesc">支付设计首款</span></a></li>
										<li><a href="#"><div class="stepNumber">5</div><span class="stepDesc">设计方案</span></a></li>
										<li><a href="#"><div class="stepNumber">6</div><span class="stepDesc">设计尾款</span></a></li>
									</ul>						
								</div>
								<div class="msg-actions">
									<div class="maMain">
										<ul><li><a data-toggle="modal" data-target="#panel-step1">我要量房</a></li></ul>	
									</div>	
									<div class="modal fade in" id="panel-step1" tabindex="-1" role="dialog" aria-hidden="false">
										<div class="modal-dialog">									
											<div class="modal-content">
												<div class="modal-header"><button class="close" aria-hidden="true" data-dismiss="modal" type="button">×</button><h4 class="modal-title">我要量房</h4>
												</div>
												<div class="modal-body">
													<form action="#" role="form" id="form">
														<div class="row">
															<div class="col-md-12"></div>
																<div class="col-md-6">
																	<div class="form-group"><label class="control-label">姓名 :<span class="symbol required"></span></label><input type="text" id="firstname" class="form-control" type="text" name="firstname" placeholder="吴XX(若我发布设计需求已填资料直接显示)"></input>
																	</div>														
																</div>
																<div class="col-md-6">
																	<div class="form-group"><label class="control-label">联系电话 :<span class="symbol required"></span></label><input type="number" id="firstname" class="form-control" type="text" name="firstname" placeholder="185017(若我发布设计需求已填资料直接显示)"></input>
																	</div>														
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label class="control-label">房屋类型 :</label>
																		<select name="dd" id="dd" class="form-control">
																			<option>请选择</option><option selected="selected" value="residential">住宅空间</option><option value="catering">餐饮空间</option><option value="office">办公空间</option><option value="hotel">酒店空间</option><option value="commercial">商业展示</option>
																			<option value="entertainment">娱乐空间</option><option value="leisure">休闲场所</option><option value="culture">文化空间</option><option value="medical">医疗机构</option><option value="salescenter">售楼中心</option><option value="financial">金融场所</option>
																			<option value="movenent">运动场所</option><option value="education">教育机构</option><option value="other">其他</option>
																		</select>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group"><label class="control-label">房屋面积 :</label><input type="text" id="㎡" name="㎡" class="form-control" placeholder="100㎡"/>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group"><label class="control-label"><label class="control-label">装修预算 : </label><input placeholder="20,000万元" class="form-control" id="money" name="万元" type="number"></label>
																	</div>
																</div>
																<div class="col-md-6">
																	<div class="form-group">
																		<label class="control-label">风格 : </label>
																		<select class="form-control" id="renovationStylereq" name="renovationStylereq">
			                                								<option value="" selected="selected">选择风格</option><option value="japanese">日式</option><option value="kora">韩式</option>
												                            <option value="mashup">混搭</option><option value="european">欧式</option><option value="chinese">中式</option><option value="newClassical">新古典</option>
												                            <option value="eastSourthAsia">东南亚</option><option value="america">美式</option><option value="countryside">田园</option><option value="mediterranean">地中海</option><option value="modern">现代</option><option value="other">其他</option>
												                        </select>
																	</div>
																</div>
															 <div class="col-md-12">
		                                            			<div class="form-group connected-group"><label class="control-label">户型 : <span class="symbol required"></span></label>
																	<div class="row">
																		<div class="col-md-3">
																			<select name="dd" id="room" class="form-control">
			                                									<option value="">室</option><option value="1">一室</option><option value="2">二室</option><option value="3">三室</option>
			                                                             		<option value="4" selected="selected">四室</option><option value="5">五室</option><option value="loft">LOFT</option>
			                                                             		<option value="complex">复式</option><option value="villadom">别墅</option><option value="little">小户型</option><option value="other">其他</option>
			                                                             	</select>
																		</div>
																		<div class="col-md-3">
																			<select name="mm" id="livingroomCountreq" class="form-control"><option value="">厅</option><option value="1">一厅</option><option value="2" selected="selected">二厅</option><option value="3">三厅</option><option value="4">四厅</option><option value="5">五厅</option>
				                                                    		</select>
																		</div>
																		<div class="col-md-3">
																			<select name="mm" id="bathroomCountreq" class="form-control"><option value="">卫</option><option value="1">一卫</option><option value="2" selected="selected">二卫</option><option value="3">三卫</option><option value="4">四卫</option><option value="5">五卫</option>
				                                                    		</select>
																		</div>
																	</div>
																</div>
		                                            		</div>
		                                            		<div class="col-md-12">
																<div class="form-group"><label class="control-label">预约量房时间 : <span class="symbol required"></span></label>
																	<div><div class="input-group"><input placeholder="2016/01/22 下午3:00" data-date-format="dd-mm-yyyy" data-date-viewmode="years" class="form-control date-picker" type="text"><span class="input-group-addon"> <i class="fa fa-calendar"></i> </span></div>
																	</div>
																</div>
															</div>
															<div class="col-md-12">
																<div class="form-group">
																	<label class="checkbox-inline">
																		<div style="position: relative;" class="icheckbox_minimal-red checked"><input style="position: absolute; top: -10%; left: -10%; display: block; width: 120%; height: 120%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="red" value="" checked="checked" type="checkbox"><ins style="position: absolute; top: -10%; left: -10%; display: block; width: 120%; height: 120%; margin: 0px; padding: 0px; background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: 0px none; opacity: 0;" class="iCheck-helper"></ins></div>
																		Tony设计师量房费用为 <span style="color:#511405; font-weight:bold">200</span> 元
																	</label>
																</div>
															</div>
															<div class="modal-footer"><button type="button" class="NewBtn btn-defaultClose" data-dismiss="modal">关闭</button>
																<button type="button" class="NewBtn btn-primarySubmit" onclick="location.href='pages_messages3.html'">修改并发布</button>
															</div>
													 	</div>
													</form>
												</div>
												<div class="modal-footer"></div>
											</div>	
										</div>   
									</div>
								</div>
							</div>
							<div class="msg-cont"><input class="form-control msg-input input-box" type="text" placeholder="留言..."></input>
								<div class="msg-input-submit msg-board ">	
									<div class="mis-icon" type="button"></div>						
								</div>
								<ul class="msg-detail">
									<li class="other">
										<div class="avatar"><img src="${baseUrl}/images/im/photo.jpg" alt=""/>
										</div>
										<div class="massages"><div class="tip"></div><p>设计师沟通内容</p><span class="time"> 下午04:52 </span>
										</div>
									</li>
									<li class="self">
										<div class="avatar"><img src="${baseUrl}/images/im/photo.jpg" alt=""/>
										</div>
										<div class="massages">	<div class="tip"></div>	<p>消费者沟通内容</p><span class="time"> 下午04:53 </span>
										</div>										
									</li>
								</ul>
		                        <div class="ChatBoaard"></div>
		  						<input type="hidden" class="form-control session-id" value="C103DC80-202A-4F3A-9672-492F4BA65DE4" />
		  						<input type="hidden" id="ClientID" />
		  						<input type="hidden" id="ClientName" />
		  						<textarea class="form-control log" rows="12">debug log...</textarea>
							</div>	
						</div>  
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	

</body>
</html>
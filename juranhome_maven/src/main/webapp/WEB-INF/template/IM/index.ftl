<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html ng-app="app" id="ng-app" ng-cloak>
<head ng-controller="seoCtrl">
	<link rel="stylesheet" href="${baseUrl}/css/im/index_im.css" >
	<link rel="stylesheet" href="${baseUrl}/css/im/perfect-scrollbar-0.4.10.min.css">		
</head>
	<body ng-controller="ctrl">
	<#include '/common/userheader.html'/>
	<#include '/common/modal.html'/>
	    <div class="xfj_content">
	    	<div class="xfj_tit1">我的聊天</div>
	    	<div class="xfj_content1">
	    		<div class="xfj_left1">
	    			<div class="xfj_search">
	    				<input type="text" placeholder="搜索" class="xfj_inp1"/>
	    				<div class="xfj_btn1"></div>
	    				<div class="xfj_close"></div>
	    				<div class="xfj_search_float1">
	    					<div class="xfj_nofound" ng-if="threads==0">找不到符合条件的资料</div>
	    					<div class="xfj_here01" ng-repeat="thread in threads" ng-if="threads>0">
			    				<div class="xfj_left2">
									<div class="xfj_img1">
			    						<img ng-src="{{thread.sender.profile_image}}" width="50" height="50" class="img-circle"/>
										<div class="xfj_img2"></div>
										<div class="xfj_num1" ng-if="thread.unread_message_count>0" >{{thread.unread_message_count}}</div>
									</div>
			    				</div>
			    				<div class="xfj_right2">
			    					<div class="xfj_tit2">
			    						<span>{{thread.created_date|date:'yy/MM/dd'}}</span>
			    						{{thread.sender.name}}
			    					</div>
			    					<p ng-if="thread.message_media_type=='TEXT'">{{thread.latest_message.body}}</p>
			    					<p ng-if="thread.message_media_type=='IMAGE'">[图片]</p>
			    				</div>
			    			</div>
	    				</div>
	    			</div>
	    			<div class="Default wrapper1">
	    			<div class="content1">
		    			<div ng-class="{'xfj_here01':indexs>0,'xfj_here1':indexs==0}"  ng-repeat="thread in threads" ng-click="changeRoom(thread.thread_id,0)"  ng-init="indexs=$index">
		    				<div class="xfj_left2">
								<div class="xfj_img1">
		    						<img ng-src="{{thread.sender.profile_image}}" width="50" height="50" class="img-circle"/>
									<div class="xfj_img2"></div>
									<div class="xfj_num1" ng-if="thread.unread_message_count>0" >{{thread.unread_message_count}}</div>
								</div>
		    				</div>
		    				<div class="xfj_right2">
		    					<div class="xfj_tit2">
		    						<span>{{thread.created_date|str2date|date:'yy/MM/dd'}}</span>
		    						{{thread.sender.name|substr:6}}
		    					</div>
		    					<p ng-if="thread.latest_message.message_media_type=='TEXT'">{{thread.latest_message.body|substr:12}}</p>
		    					<p ng-if="thread.latest_message.message_media_type=='IMAGE'">[图片]</p>
		    					<p ng-if="thread.latest_message.message_media_type=='AUDIO'">[语音]</p>
		    				</div>
		    			</div>
		    		</div>
		    		</div>
				</div>
	    		<div class="xfj_right1">
	    			<div class="xfj_tit3">
	    				<p ng-if="current_thread">{{current_thread.sender.name}}</p>
	    				<div class="xfj_tit3_float1"></div>
	    				<div class="xfj_tit3_float2" data-toggle="modal" data-target="#picture_chat"></div>
	    				<div class="xfj_num2">3</div>
	    			</div>
	    			<div class="xfj_content2">
	    				<div class="xfj_content2_float1">确认量房</div>
	    				<div class="Default wrapper" scroll-to-top="scrollToTop()" has-more="messageOptions.hasMore" ret-count="messageOptions.retCount" total="messages.length">
	    				<div class="content">
	    				<div ng-repeat="message in messages">
		    				<div class="xfj_date1" ng-if="isNotSameDay(message.sent_time)">{{message.sent_time|str2date|date:"MM月dd日"}}</div>
		    		
		    				<div class="xfj_him" ng-if="message.sender_member_id!=member_id && message.message_media_type=='TEXT'">
		    					<div class="xfj_him_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_him_text1">
		    						<div class="xfj_him_float1"></div>
		    						<div class="xfj_him_text">
			    						<div class="xfj_him_text2">{{message.body|decodeURIComponent}}</div>
		    						</div>
		    						<div class="xfj_date2">{{message.sent_time|str2date|date:"HH:mm"}}</div>
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_him" ng-if="message.sender_member_id!=member_id && message.message_media_type=='AUDIO'" ng-click="playAudio(message)">
		    					<div class="xfj_him_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_him_text1 xfj_padd0">
		    						<div class="xfj_media">
		    							<div class="xfj_media1"></div>
		    							<div class="xfj_media2" style="width:4px;"></div>
		    							<div class="xfj_media3">
		    								<div class="xfj_min" ng-if="message.read_time==''"></div>
		    								1''
		    							</div>
		    						</div>
		    						<div class="xfj_date2">{{message.sent_time|str2date|date:"HH:mm"}}</div>
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_him" ng-if="message.sender_member_id!=member_id && message.message_media_type=='IMAGE'">
		    					<div class="xfj_him_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_him_text1">
		    						<div class="xfj_him_float1 xfj_him_left"></div>
		    						<div class="xfj_him_text" data-toggle="modal" data-target="#addhot"><img ng-src="{{message.body.file_url}}Medium.jpg"/></div>
		    						<div class="xfj_date2">{{message.sent_time|str2date|date:"HH:mm"}}</div>
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_him" ng-if="message.sender_member_id!=member_id && message.message_media_type=='COMMAND' && message.body.sub_node_id==11">
		    					<div class="xfj_him_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_him_text1 xfj_padd0">
		    						<div class="xfj_him_text3">量房表单</div>
		    						<div class="xfj_date2">{{message.sent_time|str2date|date:"HH:mm"}}</div>
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_him" ng-if="message.sender_member_id!=member_id && message.message_media_type=='COMMAND' && message.body.sub_node_id==31">
		    					<div class="xfj_him_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_him_text1 xfj_padd0">
		    						<div class="xfj_him_text4">设计合同</div>
		    						<div class="xfj_date2">{{message.sent_time|str2date|date:"HH:mm"}}</div>
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_him" ng-if="message.sender_member_id!=member_id && message.message_media_type=='COMMAND' && message.body.sub_node_id==61">
		    					<div class="xfj_him_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_him_text1 xfj_padd0">
		    						<div class="xfj_him_text5">设计交付</div>
		    						<div class="xfj_date2">{{message.sent_time|str2date|date:"HH:mm"}}</div>
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_me" ng-if="message.sender_member_id==member_id && message.message_media_type=='TEXT'">
		    					<div class="xfj_me_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_me_text1">
		    						<div class="xfj_me_text">
			    						<div class="xfj_me_text2">
			    							<div class="xfj_date3">{{message.sent_time|str2date|date:"HH:mm"}}</div>
			    							{{message.body|decodeURIComponent}}
			    						</div>
		    						</div>
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_me" ng-if="message.sender_member_id==member_id && message.message_media_type=='IMAGE'">
		    					<div class="xfj_me_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_me_text1">
		    						<div class="xfj_me_text">
			    						<div class="xfj_me_text2" data-toggle="modal" data-target="#addhot">
			    							<div class="xfj_date3">{{message.sent_time|str2date|date:"HH:mm"}}</div>
			    							<img ng-src="{{message.body.file_url}}Medium.jpg"/>
			    						</div>
		    						</div>
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_me" ng-if="message.sender_member_id==member_id && message.message_media_type=='AUDIO'" ng-click="playAudio(message)">
						        <div class="xfj_me_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle" /></div>
						        <div class="xfj_me_text2">
						            <div class="xfj_media">
						                <div class="xfj_media6"></div>
						                <div class="xfj_media5" style="width:4px;"></div>
						                <div class="xfj_media4">
						                    <div class="xfj_date3">{{message.sent_time|str2date|date:"HH:mm"}}</div>
						                    10''
						                </div>
						            </div>
						        </div>
						        <div class="clear"></div>
						    </div>
		    		
		    				<div class="xfj_me" ng-if="message.sender_member_id==member_id && message.message_media_type=='COMMAND' && message.body.sub_node_id==11">
		    					<div class="xfj_me_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_me_text3">
		    						<div class="xfj_date3">{{message.sent_time|str2date|date:"HH:mm"}}</div>
		    						量房表单
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_me" ng-if="message.sender_member_id==member_id && message.message_media_type=='COMMAND' && message.body.sub_node_id==31">
		    					<div class="xfj_me_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_me_text4">
		    						<div class="xfj_date3">{{message.sent_time|str2date|date:"HH:mm"}}</div>
		    						设计合同
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_me" ng-if="message.sender_member_id==member_id && message.message_media_type=='COMMAND' && message.body.sub_node_id==61">
		    					<div class="xfj_me_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
		    					<div class="xfj_me_text5">
		    						<div class="xfj_date3">{{message.sent_time|str2date|date:"HH:mm"}}</div>
		    						设计交付
		    					</div>
								<div class="clear"></div>
		    				</div>
		    				<div class="xfj_system_message" ng-if="message.sender_member_id==member_id && message.message_media_type=='COMMAND' && message.body.sub_node_id==21">
			    				<div class="xfj_sys1">
			    					<div class="l"><img src="${baseUrl}/images/im/designer.png" /></div>
			    					<div class="r">
			    						<div class="xfj_sys2" ng-if="">设计师确认了您的量房预约，请您支付量房订单。</div>
			    						<span class="xfj_sys2_but1">立即支付</span>
			    					</div>
			    					<div class="clear"></div>
			    				</div>
			    			</div>
			    			<div class="xfj_system_message" ng-if="message.sender_member_id==member_id && message.message_media_type=='COMMAND' && message.body.sub_node_id==21">
			    				<div class="xfj_sys1">
			    					<div class="l"><img src="${baseUrl}/images/im/designer.png" /></div>
			    					<div class="r">
			    						<div class="xfj_sys2" ng-if="message.body.sub_node_id==51">支付设计首款成功，请支付尾款。</div>
			    						<span class="xfj_sys2_but1">立即支付</span>
			    					</div>
			    					<div class="clear"></div>
			    				</div>
			    			</div>
	    				</div>						
	    				</div>
	    				</div>
	    			</div>
	    			<ul class="xfj_list1">
	    				<li class="li1" data-target="#sendimage" ng-click="showSendWindow()">发送图片</li>
	    				<li class="li2" data-toggle="modal" data-target="#orderDetail">我要量房</li>
	    				<li class="li3">
	    					<div class="xfj_min"></div>
	    					我要支付
	    				</li>
	    			</ul>
	    			<div class="modal fade confirmMain" id="sendimage" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
		    				<div class="modal-content xfj_sendimage">
								<button class="close not-transparent xfj_close1" aria-hidden="true" type="button" ng-click="cancel('sendimage')"></button>
								<div class="xfj_sendimage_tit1">选择图片</div>
								<div class="xfj_sendimage_content">
									<ul>
										<li class="li1">从云端选择图片</li>
										<li class="li2" id="button1">从本地选择图片</li>
									</ul>
								</div>							
								<div class="xfj_button1"><button type="button" class="btn btn-default btn-sm xfj_but3" ng-click="cancel('sendimage')">关闭</button></div>
							</div>
						</div>
					</div>
					<input id="button2" type="file" file-model="myFile" class="xfj_none"/>
					<div class="modal fade confirmMain" id="preview" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog xfj_picture_preview1"> 
							<div class="modal-content xfj_picture_preview">
								<button class="close not-transparent xfj_close1" aria-hidden="true" type="button" ng-click="cancel('preview')"></button>
								<div class="xfj_center1">
									<div class="xfj_hot" data-toggle="tooltip" data-placement="left" title="添加热点"></div>
									<div class="xfj_center">
										<img ng-src="{{imageSrc}}" />
									</div>
								</div>
								<div class="xfj_button2">
									<button type="button" class="btn btn-default btn-sm xfj_but3" ng-click="cancel('preview')">关闭</button>
									<button type="button" class="btn btn-primary btn-sm xfj_but3" ng-click="upLoadMedia()" ng-disabled="!send_image_btn_enabled">发送</button>
								</div>
							</div>
						</div>
					</div>					
					<div class="modal fade confirmMain modal-opacity" id="addhot" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="add_hot_chat">
							<div class="add_hot_chat1">
								<div class="xfj_hot_close" data-dismiss="modal"></div>
							</div>
							<div class="add_hot_picture">
								<div class="add_hot_picture1">
									<img src="${baseUrl}/images/im/1116x738.png" width="1116" height="738" />
									<div class="xfj_hot_default" style="left:100px;top:100px;">
										<div class="xfj_num3">2</div>
										<div class="xfj_delete3" data-toggle="modal" data-target="#Confirm_Delete"></div>
									</div>
									<div class="xfj_hot_default" style="left:300px;top:150px;">
										<div class="xfj_num3">3</div>
										<div class="xfj_delete3" data-toggle="modal" data-target="#Confirm_Delete"></div>
									</div>
									<div class="xfj_hot_default" style="left:600px;top:400px;">
										<div class="xfj_num3">1</div>
										<div class="xfj_delete3" data-toggle="modal" data-target="#Confirm_Delete"></div>
									</div>
									<div class="xfj_hot_default" style="left:400px;top:100px;">
										<div class="xfj_num3">1</div>
										<div class="xfj_delete3" data-toggle="modal" data-target="#Confirm_Delete"></div>
									</div>
									<div class="xfj_hot_active" style="left:600px;top:500px;display:none;" data-toggle="modal" data-target="#NoDelete">
										<div class="xfj_num3" style="display:none;">2</div>
										<div class="xfj_delete3" ></div>
									</div>
								</div>
								<div class="add_button">
									<div class="xfj_delete">点击此处开启<br /><span>删除</span>热点功能</div>
									<div class="xfj_add1">点击此处开启<br />添加热点功能</div>
									<div class="clear"></div>
									<div class="xfj_teching1"></div>
									<div class="xfj_teching2"></div>
									<div class="xfj_teching3">如何添加热点？</div>
								</div>
							</div>
							<div class="r">
								<div class="xfj_hot_tit1">赵大宝设计师</div>
								<div class="xfj_hot_chat_content">
									<div class="Default wrapper2">
					    				<div class="content">
						    				<div class="xfj_date1"  ng-if="message.sender_member_id!=member_id && message.message_media_type=='AUDIO'" ng-click="playAudio(message)"></div>
						    				<div class="xfj_him1">
						    					<div class="xfj_him_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
						    					<div class="xfj_him_text01">
						    						<div class="xfj_him_float1"></div>
						    						<div class="xfj_him_text">
							    						<div class="xfj_him_text2">{{message.body|decodeURIComponent}}</div>
						    						</div>
						    						<div class="xfj_date2">{{message.sent_time|str2date|date:"HH:mm"}}</div>
						    					</div>
												<div class="clear"></div>
						    				</div>
						    				<div class="xfj_him1">
						    					<div class="xfj_him_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
						    					<div class="xfj_him_text01 xfj_padd0">
						    						<div class="xfj_media">
						    							<div class="xfj_media1"></div>
						    							<div class="xfj_media2"></div>
						    							<div class="xfj_media3">
						    								<div class="xfj_min"></div>
						    								1''
						    							</div>
						    						</div>
						    						<div class="xfj_date2 xfj_date4">{{message.sent_time|str2date|date:"HH:mm"}}</div>
						    					</div>
												<div class="clear"></div>
						    				</div>
						    				<div class="xfj_me1">
						    					<div class="xfj_me_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
						    					<div class="xfj_me_text01">
						    						<div class="xfj_me_text">
							    						<div class="xfj_me_text2">
							    							<div class="xfj_date3">{{message.sent_time|str2date|date:"HH:mm"}}</div>
							    							{{message.body|decodeURIComponent}}
							    						</div>
						    						</div>
						    					</div>
												<div class="clear"></div>
						    				</div>
						    				<div class="xfj_me1">
						    					<div class="xfj_me_pic"><img ng-src="{{message.sender_profile_image}}" width="50" height="50" class="img-circle"/></div>
						    					<div class="xfj_me_text02">
						    						<div class="xfj_media">
						    							<div class="xfj_media6"></div>
						    							<div class="xfj_media5" style="width:4px;"></div>
						    							<div class="xfj_media4">
						    								<div class="xfj_date3">{{message.sent_time|str2date|date:"HH:mm"}}</div>
						    								10''
						    							</div>
						    						</div>
						    					</div>
												<div class="clear"></div>
						    				</div>
						    			</div>
						    		</div>
								</div>
								<div class="xfj_form">
									<textarea class="xfj_textarea2"></textarea>
									<div class="xfj_button3">
										按Enter键发送消息，Ctrl+Enter换行
										<button type="button" class="btn btn-primary btn-sm xfj_but4">发送</button>
									</div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>	 
					<div class="modal fade confirmMain modal-sure" id="Confirm_Delete" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog  xfj_sure">
							<div class="modal-content xfj_sure"> 
								<div class="xfj_sure_content">
									<button class="close not-transparent xfj_close1" aria-hidden="true" type="button" data-dismiss="modal"></button>
									<div class="xfj_sure_tit1">提示</div>
									<div class="xfj_sure_tit2">您确定要删除此聊天热点吗？ </div>
									<div class="xfj_sure_button1">
										<div class="l"><input type="checkbox" /> 不再提示</div>
										<div class="r">
											<button type="button" class="btn btn-default btn-sm xfj_but5" data-dismiss="modal">取消</button>
											<button type="button" class="btn btn-primary btn-sm xfj_but4" id="xfj_sure">确定</button>
										</div>
									</div>
								</div>
								<div class="xfj_sure_delete1">
									<button class="close not-transparent xfj_close1 xfj_sure_close" aria-hidden="true" type="button" data-dismiss="modal"></button>
									<div class="xfj_sure_tit3">该热点已删除成功</div>
									<div class="xfj_sure_button1">
										<div class="r">
											<button type="button" class="btn btn-default btn-sm xfj_but5 xfj_sure_close" data-dismiss="modal">关闭</button>
										</div>
									</div>
								</div>
							</div>  	
						</div>
					</div>	
					<div class="modal fade confirmMain modal-sure" id="NoDelete" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog  xfj_sure">
							<div class="modal-content xfj_sure"> 
								<div class="xfj_sure_content">
									<button class="close not-transparent xfj_close1" aria-hidden="true" type="button" data-dismiss="modal"></button>
									<div class="xfj_sure_tit1">提示</div>
									<div class="xfj_sure_tit2">当前热点正在操作，不能删除，请切换后再试！ </div>
									<div class="xfj_sure_button1">
										<div class="l"><input type="checkbox" /> 不再提示</div>
										<div class="r">
											<button type="button" class="btn btn-default btn-sm xfj_but5" data-dismiss="modal">关闭</button>
										</div>
									</div>
								</div>
							</div>  	
						</div>
					</div>		
					<div class="modal fade confirmMain picture_chat" id="picture_chat" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog  xfj_picture">
							<div class="modal-content xfj_picture"> 
								<button class="close not-transparent xfj_close1" aria-hidden="true" type="button" data-dismiss="modal"></button>
								<div class="xfj_picture_content">
									<div class="xfj_sure_tit1">提示</div>
									<div class="xfj_picture_list">
										<div class="xfj_picture_list1">
											<div class="l">
												<img src="${baseUrl}/images/im/1116x738.png"width="60" height="60"/>
												<div class="xfj_num2">3</div>
											</div>
											<div class="c">
												<div class="tit1">赵大宝设计</div>
												<div class="cont1">针对热点的聊天记录，这里是针对热点的聊天记录...</div>
												<div class="date1">12/05</div>
											</div>
											<div class="r" data-toggle="modal" data-target="#addhot">
												<div class="xfj_check" data-toggle="tooltip" data-placement="bottom" title="查看"></div>
											</div>
										</div>
										<div class="xfj_picture_list1">
											<div class="l">
												<img src="${baseUrl}/images/im/1116x738.png"width="60" height="60"/>
												<div class="xfj_num2">3</div>
											</div>
											<div class="c">
												<div class="tit1">赵大宝设计</div>
												<div class="cont1">针对热点的聊天记录，这里是针对热点的聊天记录...</div>
												<div class="date1">12/05</div>
											</div>
											<div class="r" data-toggle="modal" data-target="#addhot">
												<div class="xfj_check" data-toggle="tooltip" data-placement="bottom" title="查看"></div>
											</div>
										</div>
										<div class="xfj_picture_list1">
											<div class="l">
												<img src="${baseUrl}/images/im/1116x738.png"width="60" height="60"/>
												<div class="xfj_num2">3</div>
											</div>
											<div class="c">
												<div class="tit1">赵大宝设计</div>
												<div class="cont1">针对热点的聊天记录，这里是针对热点的聊天记录...</div>
												<div class="date1">12/05</div>
											</div>
											<div class="r" data-toggle="modal" data-target="#addhot">
												<div class="xfj_check" data-toggle="tooltip" data-placement="bottom" title="查看"></div>
											</div>
										</div>
										<div class="xfj_picture_list1">
											<div class="l">
												<img src="${baseUrl}/images/im/1116x738.png"width="60" height="60"/>
												<div class="xfj_num2">3</div>
											</div>
											<div class="c">
												<div class="tit1">赵大宝设计</div>
												<div class="cont1">针对热点的聊天记录，这里是针对热点的聊天记录...</div>
												<div class="date1">12/05</div>
											</div>
											<div class="r" data-toggle="modal" data-target="#addhot">
												<div class="xfj_check" data-toggle="tooltip" data-placement="bottom" title="查看"></div>
											</div>
										</div>
										<div class="xfj_picture_list1">
											<div class="l">
												<img src="${baseUrl}/images/im/1116x738.png"width="60" height="60"/>
												<div class="xfj_num2">3</div>
											</div>
											<div class="c">
												<div class="tit1">赵大宝设计</div>
												<div class="cont1">针对热点的聊天记录，这里是针对热点的聊天记录...</div>
												<div class="date1">12/05</div>
											</div>
											<div class="r" data-toggle="modal" data-target="#addhot">
												<div class="xfj_check" data-toggle="tooltip" data-placement="bottom" title="查看"></div>
											</div>
										</div>
										<div class="xfj_picture_list1">
											<div class="l">
												<img src="${baseUrl}/images/im/1116x738.png"width="60" height="60"/>
												<div class="xfj_num2">3</div>
											</div>
											<div class="c">
												<div class="tit1">赵大宝设计</div>
												<div class="cont1">针对热点的聊天记录，这里是针对热点的聊天记录...</div>
												<div class="date1">12/05</div>
											</div>
											<div class="r" data-toggle="modal" data-target="#addhot">
												<div class="xfj_check" data-toggle="tooltip" data-placement="bottom" title="查看"></div>
											</div>
										</div>
										<div class="xfj_picture_list1">
											<div class="l">
												<img src="${baseUrl}/images/im/1116x738.png"width="60" height="60"/>
												<div class="xfj_num2">3</div>
											</div>
											<div class="c">
												<div class="tit1">赵大宝设计</div>
												<div class="cont1">针对热点的聊天记录，这里是针对热点的聊天记录...</div>
												<div class="date1">12/05</div>
											</div>
											<div class="r" data-toggle="modal" data-target="#addhot">
												<div class="xfj_check" data-toggle="tooltip" data-placement="bottom" title="查看"></div>
											</div>
										</div>
									</div>
									<div class="xfj_button4"><button type="button" class="btn btn-default btn-sm xfj_but5" data-dismiss="modal">关闭</button></div>
								</div>
							</div>  	
						</div>
					</div>		
					<div class="xfj_textarea">
	    				<textarea name="textarea" placeholder="你好，请你帮我做设计。" ng-keyup="onKeyUp($event)" ng-model="send_msg"></textarea>
	    			</div>
	    			<dl class="xfj_button">
						<dd class="dropdown dd1">
		    				<button type="button" class="btn-primary dropdown-toggle xfj_but2" id="dropdownMenu1" data-toggle="dropdown">
		    					<span class="caret"></span>
		    				</button>
		    				 <ul class="dropdown-menu xfj_list2" role="menu" aria-labelledby="dropdownMenu1">
							     <li ng-click="changeWay('enter')" class="li1">按Enter键发送消息，按Ctrl+Enter键换行</li>
							     <li ng-click="changeWay('ctrl_enter')">按Ctrl+EEnter键发送消息，按nter键换行</li>
						     </ul>
	    				</dd>
	    				<dd><button type="button" class="btn btn-primary btn-sm xfj_but1" ng-click="replyMessage()">发送</button></dd>
	    			</dl>
	    		</div>
	    		<div class="clear"></div>
	    	</div>
	    </div>	    
	    <#include '/common/footer.html'/>
	    <script src="${baseUrl}/js/im/bootstrap.min.js"></script>
	    <script src="${baseUrl}/angularjs/im/socket.js"></script>
	    <script src="${baseUrl}/angularjs/im/audioPlayer.js"></script>
	    <script src="${baseUrl}/angularjs/im/directives.js"></script>
		<script src="${baseUrl}/angularjs/im/im-app.js"></script>
	    <script src="${baseUrl}/js/im/perfect-scrollbar-0.4.10.min.js"></script>
		<script src="${baseUrl}/js/im/perfect-scrollbar-0.4.10.with-mousewheel.min.js"></script>
		<script src="${baseUrl}/js/im/index.js"></script>
	</body>
</html>
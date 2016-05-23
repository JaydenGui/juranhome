<#assign baseUrl=request.contextPath/>
<!DOCTYPE html>
<html ng-app="app" id="ng-app" ng-cloak>
<head lang="en" ng-controller="seoCtrl">
        <link rel="stylesheet" href="${baseUrl}/css/markHall/markHall.css"/>
        <link href="${baseUrl}/css/public/paging.css" rel="stylesheet" type="text/css">
	    <#include '/common/commonhead.html'/>
	   
	    <!-- Modernizer for detect what features the user’s browser has to offer -->  
	    <script type="text/javascript" src="${baseUrl}/js/markHall/modernizr.js"></script>
	    <script type="text/javascript" src="${baseUrl}/angularjs/markHall/category-app.js"></script>
</head>
<body ng-controller="ctrl">
<#include '/common/header.html'/>
<div class=" markhall-main-content">
    <div class="markhall-container">
        <div class="markhall-container-bg" >
            <img src="${baseUrl}/images/markHall/markHall-bg.png" alt="" style="width:100%;"/>
        </div>
        <div class="markhall-container-header">
            <div class="markhall-container-header-content">
                 <div class="Mscreening col-md-12">
                    <div class="col-md-3 margin-rightMscreening">
                        <span class="col-sm-4">面积：</span>
                        <select name="dd"  class="form-control markhall-form-control col-sm-8 " ng-model="spaces" ng-change="search()" >
                            <option value="">全部面积</option>
                            <option value="one">60m²以下</option>
                            <option value="two">60-80m²</option>
                            <option value="three">80-120m²</option>
                            <option value="five">120m²以上</option>
              			 </select>
                    </div>
                    <div class="col-md-3 margin-rightMscreening">
                        <span class="col-sm-4">风格：</span>
                        <select name="dd"  class="form-control markhall-form-control col-sm-8 " ng-model="styles" ng-change="search()">
                            <option value="">全部风格</option>
                            <option value="Japan">日式</option>
                            <option value="korea">韩式</option>
                            <option value="Mashup">混搭</option>
                            <option value="european">欧式</option>
                            <option value="chinese">中式</option>
                            <option value="neoclassical">新古典</option>
                            <option value="ASAN">东南亚</option>
                            <option value="US">美式</option>
                            <option value="country">田园</option>
                            <option value="mediterranean">地中海</option>
                            <option value="modern">现代</option>
                            <option value="other">其他</option>
                        </select>
                    </div>
                    <div class="col-md-3 margin-rightMscreening">
                        <span class="col-sm-4">户型：</span>
                        <select name="dd"  class="form-control markhall-form-control col-sm-8 " ng-model="layouts" ng-change="search()">
                            <option value="">全部户型</option>
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
                    </div>
                   </div> 

                    <!-- <div class="col-md-3">
                        <button type="button" class="btn btn-success markhall-btn" style="background-color:#0084ff;border:1px solid #0084ff; width:70%" ng-click="search()">
                            搜索
                        </button>
                    </div>
                </div> 
            </div>
        </div>-->
        <div class="markhall-container-body">
            <div class="markhall-container-body-content">
                <div class="row" style="margin-left:0px;">
                    <ul class="rowMarhall">
                        <li class="col-md-3" ng-repeat="need in needList" ng-init="index=$index">
                           <div class="row">
                                <div class="col-md-12 markhall-container-body-content-middle">
                                    <h3 style="display:block;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">{{need.community_name}}</h3>
                                    <p>{{need.room|replaceRoomType}}{{need.living_room|replaceBedRoom}}{{need.toilet|replaceRestRoom}}<span>|</span>{{need.decoration_style|replaceStyle}}<span>|</span>{{need.house_area|replaceArea}}m²</p>
                                </div>
                            </div>
                            <div class="row">
                             
                                <div class="col-md-11 markhall-container-body-content-topright" style="margin-left:-5px;padding-right:3px;padding-left: 25px;">
                                	<p class="markhall-release-time" style="display:block;white-space:nowrap; overflow:hidden;">发布时间：<span>{{need.publish_time|limitTo:10}}</span></p>
                                    <p class="markhall-budget" style="display:block;white-space:nowrap; overflow:hidden;">装修预算：<span style="color:#0084ff;">{{need.decoration_budget}}</span></p>
                                    <!-- 
                                     <p class="markhall-pnum" ng-if="need.bidder_count<5">应标人数：<span>{{need.bidder_count}}</span></p>
                                     <p class="markhall-pnum" ng-if="need.bidder_count>=5">应标人数：<span style="color:#ff9a01;">已满5人</span></p>  -->
                                </div>
                            </div>
                         
                            <div class="row center markhall-list-botton">
                               
                                <div class="center" >
                                    <button class="btn btn-teal button markhall-button" type="submit" style="background-color:#fff;color:#0084ff;border:1px solid #0084ff; "
                                            data-toggle="modal" data-target="#orderReceiving" ng-click="gotoGetOrder(need.needs_id)"> 查看详情</button>
                                </div> 
                                
									<!-- 
                                    <!--提示未认证
                                    <button ng-if="show==1" class="btn btn-teal button markhall-button" type="submit" style="background-color:#0084ff;color:#fff;" data-toggle="modal"
                                            data-target="#certification"> 去接单</button>
                                   
                                    <!--提示应标人数已经上线
                                    <!--<button ng-if="show==2" class="btn btn-teal btn-block button markhall-button" type="submit" style="background-color:#0084ff;color:#fff;" data-toggle="modal"
                                            data-target="#fullbid"> 去接单</button>
                                    <!--已接单
                                    <button  ng-show="nneed.bidding_status" class="btn btn-teal btn-block button markhall-button" type="submit" style="background-color:#0084ff;color:#000;"> 
                                    		已接单</button>
                                    <!--去接单
                                    <button ng-show="show!=1||nneed.bidding_status" ng-disabled="need.bidding_status==3||need.bidder_count>=5"  ng-click="gotoGetOrder(need.needs_id,need.bidder_count,need.after_bidding_status)" class="btn btn-teal button markhall-button" type="submit" style="background-color:#0084ff;color:#000;" data-toggle="modal"
                                            data-target="#orderReceiving"> 去接单</button> -->
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
					<!-- .row -->
	             	 <pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" style="width:71%;margin:0 auto;"></pagination>
        </div>

     
        <!--Modal Window of  Order Receiving-->
        <div  class="needDetail modal fade" id="orderReceiving" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true" style="margin:auto;">
            <div class="needDetail-header">
                <div class="col-md-11">
                    <h4>{{detail.community_name}}</h4>
                    <p>编号：{{detail.needs_id}}</p>
                </div>
                <div class="col-md-1" style="margin-top: -10px;"data-dismiss="modal">
                    <img src="${baseUrl}/images/markHall/close-btn_03.png" style="cursor: pointer; " alt=""/>
                </div>
            </div>
            <div class="needDetail-body">
                <div class="col-md-3 text-left">客户姓名:</div>
                <div class="col-md-9 text-left">{{detail.contacts_name}}</div>
                <div class="col-md-3 text-left">联系电话:</div>
                <div class="col-md-9 text-left" ng-show="detail.bidding_status">{{detail.contacts_mobile}}</div>
                <div class="col-md-9 text-left" ng-show="!detail.bidding_status">设计师应标后可见</div>
                <div class="col-md-3 text-left">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</div>
                <div class="col-md-9 text-left">{{detail.province_name}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{detail.city_name}}&nbsp;&nbsp;&nbsp;{{detail.district_name|replaceNone}}</div>
                <div class="col-md-3 text-left">设计预算:</div>
                <div class="col-md-9 text-left">{{detail.design_budget}}</div>
                <div class="col-md-3 text-left">装修预算:</div>
                <div class="col-md-9 text-left">{{detail.decoration_budget}}</div>
                <div class="col-md-3 text-left">房屋类型:</div>
                <div class="col-md-9 text-left">{{detail.house_type|replaceHouseType}}</div>
                <div class="col-md-3 text-left">房屋面积:</div>
                <div class="col-md-9 text-left">{{detail.house_area|replaceArea}} m²</div>
                <div class="col-md-3 text-left">户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</div>
                <div class="col-md-9 text-left">{{detail.room|replaceRoomType}}{{detail.living_room|replaceBedRoom}}{{detail.toilet|replaceRestRoom}}</div>
                <div class="col-md-3 text-left">风&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格:</div>
                <div class="col-md-9 text-left">{{detail.decoration_style|replaceStyle}}</div>
                <div class="col-md-3 text-left">发布时间:</div>
                <div class="col-md-9 text-left">{{detail.publish_time}}</div>
                <div class="col-md-3 text-left">应标人数:</div>
                <div class="col-md-9 text-left">{{detail.bidder_count}}</div>
            </div>
            <div class="needDetail-footer">
                <div><h3>我来应标</h3></div>
                <!-- 
                <div class="row">
                    <div class="col-md-2" style="height: 30px;padding-left:0;">
                        <p>姓名:<span>{{member.real_name}}</span></p>
                    </div>
                    <div class="col-md-5" style="height: 30px">
                        <p>手机号:<span>{{member.mobile_number}}</span></p>
                    </div>
                </div> -->
                <div class="row">
                    <textarea maxlength="150" ng-keyup="size()" ng-init="numberCount=0" ng-trim="true"  ng-model="markDeckaration" name="" id="" cols="30" rows="10" placeholder="请填写接单宣言"></textarea>
                    <p class="bid-people-num"><span>{{numberCount}}</span>/150</p>
                </div>
                <div class="row">
                    <button class="NewBtn btn-primarySubmit needDetail-body-btn "  data-toggle="modal" data-target="#certification" ng-disabled="detail.bidding_status||detail.bidder_count>=5||detail.after_bidding_status==3" ng-click="mark(detail.needs_id)" data-dismiss="modal"  style="margin-right:0;">开始应标</button>
                    <button class="NewBtn btn-defaultClose needDetail-body-btn " data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
        <!--Modal Window of no  Certification-->
        <div ng-show="show==1" class="no-certification modal fade" id="certification" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true" style="top:30%;">
            <div class="no-certification-header text-right">
            <span style="cursor:pointer;" data-dismiss="modal">×</span>
            </div>
            <div class="no-certification-body">
            	<div class="col-md-3">
                    <img  style="float:right;" src="${baseUrl}/images/markHall/tip-nocertife_03.png" alt=""/>
                </div>
                <div class="col-md-9">
                    <h3 >您还尚未完成实名认证</h3>
                    <p >请先到个人中心完成实名认证</p>
                </div>
                <button class="NewBtn btn-primarySubmit no-certification-body-btn " data-dismiss="modal" ng-click="gotoauthentication()"  style="background-color: #0084ff;"><a href="${baseUrl}/user/authentication" style="text-decoration: none;">立即验证</a></button>
                <button class="NewBtn btn-defaultClose no-certification-body-btn " data-dismiss="modal">关闭</button>
            </div>
        </div>
		<!--mark success start-->
	<div class="modal fade" ng-show="visible" id="oredernow2" tabindex="-1" role="dialog" >
	    <div class="modal-dialog" style="overflow:hidden">
		       <div class="modal-content">
		           <div class="modal-body">
			            	<center>
			            		<a class="btn btn-border" href="${baseUrl}/mark/category">[X]</a>	
			            	</center>				
							<div class="inline-cont">
								<div class="inline-cont" style="position:relative">
						          <a href="${baseUrl}/user/index/#mybidlist" target="_blank" class="btn btn-blue pull-right" style=" position:absolute; top:200px; right:10%">查看结果 </a>
						          <a href="${baseUrl}/mark/category"  class="btn btn-blue pull-right" style=" position:absolute; top:200px; right:30%">继续接单 </a>
								  <a href="#" class="remind2" style="width:500px; display:inline-block"><img src="${baseUrl}/images/markHall/ordernow1.jpg"></a>
								</div>
							</div>
						</div>
						<div class="modal-footer" style="border:none"></div>
					</div>
				</div>
			</div>
	<!--mark success end-->
        <!--Modal Window of full bid-->
        <div class="full-bid modal fade" id="fullbid" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
            <div class="full-bid-header">
            </div>
            <div class="full-bid-body">
                <p>应标人数已满</p>
                <button class="NewBtn btn-defaultClose full-bid-body-btn" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
    </div>

</div>
<script>
   $(document).on('click','#scrollTopG .scrollTopG',function(){
      //console.log( $('#scrollTopG .scrollTopG').html() );
	  //alert();
      $('html,body').animate({scrollTop:0},'slow');
  });
  
</script>
</script>
</body>
<#include '/common/footer.html'/>
</html>
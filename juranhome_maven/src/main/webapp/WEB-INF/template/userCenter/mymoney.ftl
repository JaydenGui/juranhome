<#assign baseUrl=request.contextPath/>
<div class="main-content">
    <div class="container" style="min-height: 730px;">
        <!-- start: PAGE HEADER -->
        <div class="">
            <div class="col-sm-12">
                <!-- start: PAGE TITLE & BREADCRUMB -->
                <ol class="breadcrumb">
                    <li><a href="javascript:document.getElementById('mybidlist').click()">
                       	 个人中心
                    </a>  </li>
                    <li class="active">我的资产</li>
                </ol>
                <div class="homestyler-title">
                    <h3>我的资产</h3>
                </div>
                <!-- end: PAGE TITLE & BREADCRUMB -->
            </div>
        </div>
        <!-- end: PAGE HEADER -->
        <!-- start: PAGE CONTENT -->
        <div class="">
            <div class="col-sm-12">
                <!-- start: PANLEL TABS -->
                <div>
                    <!--  <div class="panel-heading">
                        <i class="fa fa-reorder"></i>
                    </div>-->
                    <div class="panel-body"  ng-cloak>
                        <div class="tabbable panel-tabs">
                            <div class="tab-content">
                                <div class="tab-pane active" id="panel_tab_example1" style="position: relative;" ng-cloak>
                                    <!--replace with images start-->
                                    <div class="row">
                                        <div class="guarantee">
                                             <h3 style="padding-top: 15px;">账户余额 : 
                                             <a class="balance" ng-if="designerMoneyInfo.amount>=0">￥{{designerMoneyInfo.amount}}</a>
                                             <a class="balance" ng-if="designerMoneyInfo.amount==null">￥0</a>
                                             </h3></br>
                                           	 <a class="btn btn-blue " ng-if="designerMoneyInfo.amount>0" href="#drawcash" style="position:absolute;top: 35px; left:300px; width: 80px; letter-spacing: 2px; background-color:#0084ff;border:1px solid #0084ff">提现 </a>
                                       		 <a class="btn btn-blue " ng-if="designerMoneyInfo.amount==0||designerMoneyInfo.amount==null" style="position:absolute;top: 35px; left:300px; width: 80px; letter-spacing: 2px; cursor:pointer; background-color:#ccc;color:#fff;border:1px solid #ccc">提现 </a> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                          	 <div class="" >
                          	 	<ul class=" col-md-12 money-record">
                          	 		<li id="1" class="current" ng-click="switchs(1)"><a>交易记录</a></li>
                          	 		<li style="border:0 none;border:0 none;color:#666;font-weight:100; background-color: #999;height: 18px !important;margin: 13px 5px;padding: 0; overflow: hidden;width:1px!important;"></li>
                          	 		<li id="2" ng-click="switchs(2)"><a>提现记录</a></li>
                          	 	</ul>
                          	  </div>
                            <div class="row transaction-record" style="margin-top:10px;">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class=" panel-scroll ordera" style="height:auto;">
                                            <div style="border: 1px solid #eee;">
                                                <table id="sample-table-1" class="table table-hover" ng-cloak>
                                                    <thead style="background-color:#f5f5f5;">
                                                    <tr>
                                                        <th class="center">交易日期</th>
                                                        <th>项目名称</th>
                                                        <th>订单编号</th>
                                                        <th>交易名称</th>
                                                        <th>交易金额</th>
                                                        <th>状        态</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody> 
                                                    <tr ng-repeat="finance in transactionRecordList" ng-init="index=$index" ng-cloak>
                                                        <td class="center">{{finance.create_date|date:'yyyy-MM-dd'}}</td>
                                                        <td class="center">{{finance.name}}</td>
                                                        <td class="center">{{finance.order_line_id}}</td>
                                                        <td class="center">{{finance.title}}</td>
                                                        <td class="center">{{finance.adjustment}}</td>
                                                        <td class="center" ng-if="finance.type==0">待支付</td>
                                                        <td class="center" ng-if="finance.type==1">已支付</td>
                                                        <td class="center" ng-if="finance.type==2">量房转设计</td>
                                                        <td class="center" ng-if="finance.type==3">已入账</td>
                                                     </tr>
                                                    </tbody>
                                                </table>
	                                            <div id="noMatch" style="text-align:center;display:none;" ng-show="transactionRecordList.length==0" ng-cloak>
							                       <div><img src="${baseUrl}/images/userCenter/rreyeryer_03.png"></div>
												   <div style="margin-top:15px; color:#000;padding-bottom: 3%;">您目前还没有进行交易</div>
							                    </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                            <!-- Withdrawal record -->
                            <div class="row withdrawal-record" style="margin-top:10px;">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class=" panel-scroll ordera">
                                            <div>
                                                <table id="sample-table-1" class="table table-hover">
                                                    <thead style="background-color:#f5f5f5;">
                                                    <tr>
                                                        <th class="center">申请日期</th>
                                                        <th>提现流水号</th>
                                                        <th>提现银行</th>
                                                        <th>提现金额</th>
                                                        <th>处理状态</th>
                                                        <th>备注</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr ng-repeat="withdraw in withdrawalRecordList">
                                                        <td class="center">{{withdraw.date}}</td>
                                                        <td class="center">{{withdraw.transLog_id}}</td>
                                                        <td class="center">{{withdraw.bank_name}}</td>
                                                        <td class="center">{{withdraw.amount}}元</td>
                                                        <td class="center">
                                                        	<p ng-if="withdraw.status==-1">未处理</p>
                                                        	<p ng-if="withdraw.status==0">处理中</p>
                                                        	<p ng-if="withdraw.status==1">处理成功</p>
                                                        	<p ng-if="withdraw.status==2">处理失败</p>
                                                        </td>
                                                        <td class="center">{{withdraw.remark}}</td>
                                                     </tr>
                                                  </tbody>
                                                </table>
                                                <div style="text-align:center;" ng-if="withdrawalRecordList.length<=0" ng-cloak>
						                            <div><img src="${baseUrl}/images/userCenter/rreyeryer_03.png"></div>
												    <div style="margin-top:15px; margin-bottom:15px;color:#000;">您目前还没有提现记录</div>
						                        </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--replace with images end-->
                             <pagination ng-if="conf.totalItems>conf.itemsPerPage"  conf="conf" go-page="page.go_page(num)" style="margin-bottom:50px; width:100%;'"></pagination>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- end: PANLEL TABS -->
    </div>
    <!-- end: PANLEL TABS -->
   
</div>
<script src="${baseUrl}/js/userCenter/my-money.js"></script>
<script>
$(document).on('click','#scrollTopG .scrollTopG',function(){
    $('html,body').animate({scrollTop:0},'slow');
});
</script>
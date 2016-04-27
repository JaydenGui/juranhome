<#assign baseUrl=request.contextPath/>
<div class="main-content">
    <div class="container" style="min-height: 760px;">
    <!-- start: PAGE HEADER -->
    <div class="">
        <div class="col-sm-12">
            <!-- start: PAGE TITLE & BREADCRUMB -->
            <ol class="breadcrumb">
                <li><!--  <em class="clip-file"></em>  --><a href="orderlist2.html">
                    个人中心
                </a>  </li>
                <li> <em class="clip-file"></em> <a href="#mymoney">
                    我的资产
                </a>  </li>
                <li class="active">提现</li>
            </ol>
            <div class="page-header">
                <h3>我的资产</h3>
            </div>
            <!-- end: PAGE TITLE & BREADCRUMB -->
        </div>
    </div>
    <!-- end: PAGE HEADER -->
    <!-- start: PAGE CONTENT -->
    <div class="row">
        <div class="col-sm-12">
            <!-- start: PANLEL TABS -->
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="tabbable panel-tabs">
                        <div class="tab-content">
                            <div class="tab-pane active" id="panel_tab_example1">
                                <div class="money3-body">
                                        <form name="form" action="" ng-submit="submit($event)">
                                            <div class="guarantee">
                                             <h3>账户余额 : <span class="balance">￥{{designerMoneyInfo.amount}}</span></h3></br>
                                           	 <h3>提现金额 : <span class="balance" ng-model="amount">￥{{designerMoneyInfo.amount}}</span></h3></br>
                                        	</div>
                                            <div class="form-group bank-card" style="margin-top:30px;">
                                                <label class="col-sm-2  text-right" for="form-field-1">
                                                    	开户人姓名：
                                                </label>
                                                <div class="col-sm-9 inputwid">
                                                    <input ng-disabled="disable"  id="lastname" type="text" ng-model="account_user_name" /><span></span>
                                                    <span ng-if="isShow" style="margin-left:10px; color:#0084ff;cursor: pointer;" ng-click="updateBankCardInfo()"><img src="${baseUrl}/images/userCenter/banckimg_03.png">更换银行卡</span>
                                                </div>
                                            </div>
                                            <div class="form-group bank-card">
                                                <label class="col-sm-2  text-right" for="form-field-1">
                                                   	开户银行：
                                                </label>
                                                <div class="col-sm-9 inputwid">
                                                    <select name="bank_name" id="bank" class="col-sm-9 form-control search-select elect-none" ng-disabled="disable" ng-model="bank_name" ng-selected="bank_name"> 
                                                        <option value="">选择</option>
                                                       	<option value="中国银行" >中国银行</option>
                                                       	<option value="中国工商银行" >中国工商银行</option>
                                                        <option value="中国建设银行" >中国建设银行</option>
                                                        <option value="中国农业银行" >中国农业银行</option>
                                                        <option value="中国交通银行"  >中国交通银行</option>
                                                        <option value="中信银行" >中信银行</option>
                                                        <option value="中国光大银行" >中国光大银行</option>
                                                        <option value="中国华夏银行" >中国华夏银行</option>
                                                        <option value="中国民生银行" >中国民生银行</option>
                                                        <option value="广发银行" >广发银行</option>
                                                        <option value="深圳发展银行" >深圳发展银行</option>
                                                        <option value="招商银行" >招商银行</option>
                                                        <option value="兴业银行" >兴业银行</option>
                                                        <option value="北京银行" >北京银行</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group bank-card">
                                                <label class="col-sm-2  text-right" for="form-field-1">
                                                    	支行名称：
                                                </label>
                                                <div class="col-sm-9 inputwid">
                                                    <input ng-disabled="disable" type="text" id="bankname" ng-model="branch_bank_name" /><span></span>
                                                </div>
                                            </div>
                                            <div class="form-group bank-card">
                                                <label class="col-sm-2  text-right" for="form-field-1">
                                                   	银行卡号：
                                                </label>
                                                <div class="col-sm-9 inputwid">
                                                    <input ng-disabled="disable" id="banknum" type="text" ng-model="deposit_card"/><span></span>
                                                </div>
                                            </div>
                                             <div class="form-group bank-card">
												<button  style="margin-left: 45%;" href="javascript:;" data-target="#surepayment" data-toggle="modal" class="commit NewBtn btn-primarySubmit" data-placement="top" >确认并提交</button>
                                             </div>                                             
                                        </form>
                                </div>
                                
                                <div ng-show="OK" class="modal-dialog modal fade" id="surepayment" style="position:fixed; top:20%;display:none;">
                                    <div class="modal-content doapsder">
                                    	<img alt="支付完成" src="${baseUrl}/images/userCenter/fdstere_03.png">
                                    	<h3>提现申请成功</br>请在提现记录中查看状态</h3>
                                    <div class="adspsdl">
										<a ng-click="gotomymoney()" data-dismiss="modal" class="NewBtn btn-defaultClose tooltips" data-placement="bottom" data-original-title="关闭" >关闭</a>
										<!-- <a  data-dismiss="modal" ng-click="gotomymoney()" class="NewBtn btn-primarySubmit tooltips" data-placement="bottom" data-original-title="提交" >提现记录</a> -->
									</div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end: PANLEL TABS -->
        </div>
        <!-- end: PANLEL TABS -->
    </div>
</div>
</div>
<script src="${baseUrl}/js/userCenter/my-money.js"></script>
<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html ng-app="app" ng-cloak>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
	<title>友情链接</title>
	<link rel="stylesheet" href="${baseUrl}/css/userCenter/main.css">
	<#include '/common/commonhead.html'/>
	<script src="${baseUrl}/angularjs/floorlink/friendlink-app.js" charset="utf-8" ></script>

</head>
<body style="background:#f3f3f3;" ng-controller="ctrl">
<#include '/common/header.html'/>

	<div class="friy-link">
		<ol class="breadcrumb">
			<li><a href="${baseUrl}/">首页</a></li>
			<li class="active">友情链接</li>
		</ol>
		<h3>友情链接</h3>
		<div class="brands">
			<div class="panel panel-default friy-link-panel" style="border: 1px solid #d7d7d7 !important;">
				<div class="panel-heading">
					设计家品牌
				</div>
				<div class="panel-body">
					<ul class="col-sm-12">
						<li class="col-sm-2"><a href="javascript:void(window.open('http://etdc.juran.com.cn'))">顶层设计</a></li>
						<li class="col-sm-2"><a href="javascript:void(window.open('http://www.juranhm.com'))">红木大会堂</a></li>
						<li class="col-sm-2"><a href="javascript:void(window.open('http://www.gorgeoushome.com.cn'))">家之尊馆</a></li>
						<li class="col-sm-2"><a href="javascript:void(window.open('http://coho.juran.com.cn'))">丽屋超市</a></li>
						<li class="col-sm-2"><a href="javascript:void(window.open('http://lohohd.juran.com.cn'))">乐屋家装</a></li>
						<li class="col-sm-2"><a href="javascript:void(window.open('http://www.juran.com.cn'))">居然之家</a></li>
						<li class="col-sm-2"><a href="javascript:void(window.open('http://www.juran.cn'))">居然在线</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="fast-mail" >
			<div class="panel panel-default friy-link-panel" style="min-height:140px;border: 1px solid #d7d7d7 !important;">
				<div class="panel-heading">
					快递服务
				</div>
				<div class="panel-body">
					
					
						<ul class="col-sm-12">						
							<li class="col-sm-2"><a href="javascript:void(window.open('http://m.kuaidi100.com/index_all.html'))">快递查询</a></li>
						</ul>
					
					
				</div>
			</div>
		</div>
		<div class="add-friy-link">
			<div class="panel panel-default friy-link-panel" style="border: 1px solid #d7d7d7 !important;"> 
				<div class="panel-heading">
					申请友情链接
				</div>
				<div class="panel-body">
					<div class="pull-left col-sm-5 ">
						<p>申请步骤：</p>
						<p class="step">1.请先在贵网站做好设计家的文字友情链接<br>
						链接文字：设计家 链接地址：<a href="javascript:void(window.open('http://www.shejijia.com'))">http://www.shejijia.com</a></p>
						<p class="step">2.做好链接后，请在右侧填写申请信息。设计家只接受申请文字友情链接。</p>
						<p class="step">3.已经开通我站友情链接且内容健康，符合本站友情链接要求的网站，经设计家管理员审核后，可以显示在此友情链接页面。</p>
					</div>
					<div class="pull-right col-sm-6 col-md-offset-1">
						<form action="mailto:leediancn@leediancn.com" mothod="get" enctype='text/plain'>
							<div class="col-sm-12">
								<span class="add-friy-link-label"><span style="color:red">*</span>网站名称：</span>	<input id="add-friy-link-input" type="text" class="tos form-control" placeholder="" class="form-control" name='网站名称:'/>					
							</div>
							<div class="col-sm-12">
								<span class="add-friy-link-label"><span style="color:red">*</span>网站网址：</span>	<input id="add-friy-link-input" type="text" placeholder="http://" class="ccs form-control">					
							</div>
							<div class="col-sm-12">
								<span class="add-friy-link-label"><span style="color:red">*</span>网站分类：</span>	<input type="text" id="add-friy-link-input"  class="bccs form-control">					
							</div>
							<div class="col-sm-12">
								<span class="add-friy-link-label"><span style="color:red">*</span>电子邮箱：</span>	<input type="text" id="add-friy-link-input"  class="titles form-control">					
							</div>
							<div class="col-sm-12">
								<span class="add-friy-link-label"><span style="color:red">*</span>网站介绍：</span>	
								 <textarea id="add-friy-link-input" placeholder="网站介绍不能为空" class="message form-control" rows="3"></textarea>					
							</div>
							<div class="col-sm-12 friy-link-btn">
								<!-- <a class="send btn friy-link-btn"  href="mailto:yourname@163.com">申请提交</a> -->
								<a class="send NewBtn btn-primarySubmit" href="mailto:@leediancn.com">申请提交</a>
							</div>						
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
<#include '/common/footer.html'/>
<script src="${baseUrl}/js/public/jquery.mailto.js" charset="utf-8"></script>
<script>
$('textarea.message').val('');
$('a.send').on('click', function(){
    $.mailto.call({
        to : $('input.to').val(),
        cc : $('input.cc').val(),
        bcc : $('input.bcc').val(),
        subject : $('input.title').val(),
        callFromIFrame : false,
        body :$('input.tos').val()+ '\r'+$('input.ccs').val()+ '\r'+$('input.bccs').val()+ '\r'+$('input.titles').val()  + '\r' + $('textarea.message').val()
    });
});</script>
</body>
</html>
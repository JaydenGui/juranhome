<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<html ng-app="app" ng-cloak>
<head lang="en">
    <meta charset="UTF-8">
    <title>合作伙伴</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <link rel="stylesheet" href="${baseUrl}/css/footer/aboutus.css"/>
	<#include '/common/commonhead.html'/>
	<script src="${baseUrl}/angularjs/floorlink/partners-app.js" charset="utf-8" ></script>
</head>
<body ng-controller="ctrl">
<#include '/common/header.html'/>
    <div class="partner-container">
        <div class="partner-breadcrumbs">
            <a href="${baseUrl}/">首页</a> &gt;
            <a href="">合作伙伴</a>
        </div>
        <div class="partner-content">
            <div class="partner-body">
                <h3 >合作伙伴</h3>
                <p class="partner-body-p">拍摄服务</p>
                <ul class="clearfix">
                    <li class="col-md-5" >
                        <div><img src="${baseUrl}/images/footer/sina_03.png" alt=""/></div>
                        <h4>绿浪视觉</h4>
                        <p style="text-indent: 2em;">作为国内商品数字化服务领域的先行者和领导者，绿浪致力于为商超百货的020转型升级提供最专业的商品数字化解决方案。（http://www.greensea.com.cn）</p>
                        <p>公司地址：嘉兴市昌盛南路36号嘉兴智慧产业创新园2号楼6楼</p>
                        <p>联系电话：400-000-9411</p>
                    </li>
                
                   
                    <li class="col-md-5">
                        <div><img src="${baseUrl}/images/footer/shine_03.png" alt=""/></div>
                        <h4>北京星艺恒河文化艺术传播有限公司</h4>
                        <p style="text-indent: 2em;">星艺恒河成立于2008年，专注于摄影、摄像、平面后期、设计等视觉呈现领域，一直服务于国内外众多知名品牌以及国内各大型电商平台，一切从客户角度出发。
                            公司网址：（www.youngshine.com.cn）</p>
                        <p>公司地址：北京市朝阳区工体南路东口核桃园东南独栋A座</p>
                        <p>联系电话：010-66668888</p>
                    </li>
                    
                </ul>
                <p class="partner-body-p" style="height:20px;line-height: 20px;">技术支持</p>
                <ul class="clearfix">
				<li class="col-md-5">
                        <div><img src="${baseUrl}/images/footer/auto_03.png" alt=""/></div>
                        <h4>Autodesk</h4>
                        <p style="text-indent: 2em;">欧特克有限公司（欧特克或Autodesk）是全球最大的二维和三维设计、工程与娱乐软件公司，为制造业、工程建设行业、基础设施业以及传媒娱乐业提供卓越的数字化设计、工程与娱乐软件服务和解决方案。</p>
                        <p>公司地址：上海市浦东新区浦电路399号</p>
                        <p>联系电话：021-38653333</p>
                    </li>
                    <li class="col-md-5">
                        <div><img src="${baseUrl}/images/footer/hitachi_03.png" alt=""/></div>
                        <h4>日立咨询</h4>
                        <p style="text-indent: 2em;">日立咨询（中国）有限公司于2010年成立，总部位于上海,主要开展BPR（Business
                            ProcessReengineer业务流程重组）咨询； ERP、SCM、CRM、PLM等建立在企业解决方案基础上的业务咨询服务；制定IT战略方案、 建立IT管理体系，加强IT体系结构等IT咨询服务；对客户引进的系统提供维护和支持的服务。</p>
                        <p>公司地址：上海市徐汇区武康路202号</p>
                        <p>联系电话：021-54659911</p>
                    </li>
                 
                    
                </ul>
            </div>
        </div>
    </div>
<#include '/common/footer.html'/>
</body>
</html>
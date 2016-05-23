<#assign baseUrl=request.contextPath />
<!DOCTYPE html>
<!--[if gt IE 9]><!--><html class="no-js" lang="en"><!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
        <meta http-equiv="X-UA-Compatible" content="IE=9" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <meta name="author" content="Codrops" />
       
        <link rel="stylesheet" type="text/css" href="${baseUrl}/css/index/demo.css" />
        <link rel="stylesheet" type="text/css" href="${baseUrl}/css/index/style1.css" />
        <script type="text/javascript" src="${baseUrl}/js/index/jquery.min.js"></script>
		<script type="text/javascript" src="${baseUrl}/js/index1/modernizr.custom.86080.js"></script>
        <style>
        .container{padding-left:0px!important;}
		.morecaselibrary a{ display:block; background:url(${baseUrl}/images/index/more_d.png); width:150px; height:32px}
        .morecaselibrary a:hover{ background:url(${baseUrl}/images/index/more_d_on.png);}
        </style>
    </head>
    
    <body id="page" >
        <ul class="cb-slideshow" style="cursor:pointer;">
             <li><a class="hrefiad" curl="${baseUrl}/caseBase/casedetail/caseid/1558534/uid/41769b62-8f96-4794-85bb-135c7b22d8cc/"><span></span></a></li>
             <li><a class="hrefiad" curl="${baseUrl}/caseBase/casedetail/caseid/1557982/uid/44a39d8b-54de-4d83-9a65-84a5f8c6a565/"><span></span></a></li>
             <li><a class="hrefiad" curl="${baseUrl}/caseBase/casedetail/caseid/1558621/uid/44a39d8b-54de-4d83-9a65-84a5f8c6a565/"><span></span></a></li>
             <li><a class="hrefiad" curl="${baseUrl}/caseBase/casedetail/caseid/1553917/uid/71fe7f7e-2c45-4ef2-9d82-d51326a4812a/"><span></span></a></li>
             <li><a class="hrefiad" curl="${baseUrl}/caseBase/casedetail/caseid/1558765/uid/96403d96-65be-4988-81d7-83e5e4dbd01a/"><span></span></a></li>
        </ul>
        <div class="container" >
          <div class="morecaselibrary" style=" position:absolute; top:100px; left:70px;  z-index:10000 "><a href="${baseUrl}/caseBase/index/" target="_blank"></a></div>
            <header>
                <h1>看“最棒”的作品</h1>
                <h2>风格多样&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;户型齐全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;设计精湛</h2>
            </header>
        </div>
    </body>
    <script>
    var currentCaseUrl = '';
    $(function() {
    	setInterval(function() {
    		$('.cb-slideshow li a span').each(function(index, item) {
    			if(parseFloat($(item).css('opacity')) >= 1)
    				currentCaseUrl = $(item).parent().attr('curl');
    		});	
    	}, 100);
    	
    	$('#page .cb-slideshow').on('click', function() {
    		if(currentCaseUrl.length <= 0)
    			return false;
    			
    		window.open(currentCaseUrl, '_blank');
    	});
    });
    </script>
</html>
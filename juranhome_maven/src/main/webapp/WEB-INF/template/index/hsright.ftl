<#assign baseUrl=request.contextPath />
<!doctype html>
<html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/index/styleapp.css"/>
    <script type="text/javascript" src="${baseUrl}/js/index1/jquery.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/index1/jquery.fullscreenBackground.js"></script>
	<style type="text/css">
		.container{padding-left:0px!important;}
	</style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#background-image").fullscreenBackground();
        });
    </script>
</head>

<body>

    <div id="contenths">
     <ul class="hotimage">
        <li></li>
        <li>
          <h1>做“最准”的3D云设计</h1>
		 <h2>真实商品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;快速渲染&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一键出图</h2>
		 <p><a href="${baseUrl}/3Dscheme/create3D" target="_blank">立即开启设计之旅</a></p></li>
    </ul>

    </div>
    <div class="Cframe">
    	<iframe src="${baseUrl}/hs" width="670" height="591" scrolling="no" allowtransparency="true" frameborder="0" style="border:none"></iframe>
    </div>
    <div id="background-image">
        <img src="${baseUrl}/images/index/cityscape.jpg" width="1920" height="980" />
    </div>

</body>
</html>
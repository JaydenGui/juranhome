<#assign baseUrl=request.contextPath />
<!doctype html>
<html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/index/styleapp.css"/>
    <script type="text/javascript" src="${baseUrl}/js/index1/jquery.js"></script>
    <script type="text/javascript" src="${baseUrl}/js/index1/jquery.fullscreenBackground.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#background-image").fullscreenBackground();
        });
       
    </script>
</head>

<body>

    <div id="content">
  
    <ul class="hotimage">
 
    <li> <img style="width:140px;height:158px;"src="${baseUrl}/images/index/qrcode.png"></li>
       <li style="margin-top:30px"> <h1>用“最新”的沟通模式</h1><h2>
            随时联络&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图片标签&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;语音互动
        </h2></li>
    </ul>


    </div>
    <div class="hand_app">
    	<iframe src="${baseUrl}/mobile" width="600" height="600" scrolling="no" allowtransparency="true" frameborder="0" style="border:none"></iframe>
    </div>
    <div id="background-image">
        <img src="${baseUrl}/images/index/cityscapea.jpg" width="1920" height="980" />
    </div>

</body>
</html>
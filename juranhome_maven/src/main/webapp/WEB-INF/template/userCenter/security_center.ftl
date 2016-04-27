<#assign baseUrl=request.contextPath />
    <link rel="stylesheet" type="text/css" href="${baseUrl}/css/userCenter/edit_avatar.css">

	<div class="main-content">
		<div class="container" style="min-height: 760px;">
	    <!-- start: PAGE HEADER -->
	        <div class="col-sm-12">
	            <!-- start: PAGE TITLE & BREADCRUMB -->
	            <ol class="breadcrumb">
	                <li>
	                   <#if users.type=='member'>
	                      <a href="javascript:document.getElementById('myorder').click()">个人中心</a>
	                   <#else>
	                      <a href="javascript:document.getElementById('mybidlist').click()">个人中心</a>
	                   </#if>
	                </li>
	                <li class="active">安全中心</li>
	            </ol>
	            </div>

	          <iframe id="logInOutFrame" style="border:none; padding:2%; margin-top:2%; width:100%; height:950px;" src="http://cas.juranzaixian.com.cn/myspace/member/account_security.htm"></iframe>
	          </div>          
	        <div>
	       </div>
	    </div>
  <script type="text/javascript">
      $(function() {
        $(".selectDu select").focus(function(){
      	 	$(this).addClass('selected');
      	});
      	$(".selectDu select").on('blur change', function(){
      	 	$(this).removeClass('selected');
      	});
      });
    </script>
    
    
    <script type="text/javascript">
      $(document).ready(function() {
          //Default Action
          $(".tab_content").hide(); //Hide all content
          $("ul.tabs li:first").addClass("active").show(); //Activate first tab
          $(".tab_content:first").show(); //Show first tab content

          //On Click Event
          $("ul.tabs li").click(function() {
              $("ul.tabs li").removeClass("active"); //Remove any "active" class
              $(this).addClass("active"); //Add "active" class to selected tab
              $(".tab_content").hide(); //Hide all tab content
              var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
              $(activeTab).fadeIn(); //Fade in the active content
              return false;
          });
      });
  	</script>
 
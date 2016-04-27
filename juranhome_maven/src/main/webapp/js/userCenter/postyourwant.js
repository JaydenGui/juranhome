// Release requirements form validation 发布需求验证
	 $(function(){
		 
        var ok1=false;
        var ok2=false;
        var ok3=false;
        var ok4=false;
        var ok5=false;
        var ok6=false;

        // 姓名
        $('input[name="pro-name"]').focus(function(){       	
            $(this).next().text('请输入姓名').removeClass('state1').addClass('state2');
        }).blur(function(){
            if($(this).val().length >= 2 && $(this).val().length <=12 && $(this).val()!=''){
                $(this).next().text('输入成功').removeClass('state1').addClass('state4');
                ok1=true;
                $(this).attr('style','border: 1px #ddd solid');
            }
            else{
                $(this).next().text('姓名长度应在2-12个字').removeClass('state1').addClass('state3');
                $(this).attr('style','border: 1px red solid');
            }

        });
        //电话
        $('input[name="phone"]').focus(function(){
            $(this).next().text('请输入手机号码').removeClass('state1').addClass('state2');
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if(pattern.test($(this).val())){
                $(this).next().text('输入成功').removeClass('state1').addClass('state4');
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).next().text('格式错误').removeClass('state1').addClass('state3');
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //房屋类型
        $('select[name="dd"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //风格
        $('select[name="renovationStylereq"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //项目地址1
        $('select[name="s_province"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //项目地址2
        $('select[name="s_city"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //项目地址3
        $('select[name="s_county"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //戶型1
        $('select[name="type_lv_room"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //戶型2
        $('select[name="type_room"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //戶型3
        $('select[name="type_rst_room"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });
          
      //设计预算
        $('select[name="design_budget"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });
        
      //装修预算
        $('select[name="Decoratebudget"]').focus(function(){
        }).blur(function(){	
            var pattern = /^1[34578]\d{9}$/;
            if($(this).val().length > 0){
                ok2=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });
        
        //小区名称校验
        $('input[name="house-name"]').focus(function(){
           // $(this).next().text('小区名称不能为空,且字数在3-20位之间').removeClass('state1').addClass('state2');
        }).blur(function(){
            if($(this).val().length >= 3 && $(this).val().length <=20 && $(this).val()!=''){
                //$(this).next().text('输入成功').removeClass('state1').addClass('state4');
                ok3=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                //$(this).next().text('格式错误').removeClass('state1').addClass('state3');
                $(this).attr('style','border: 1px red solid');
            }

        });
        //面积验证 项目价格
        $('input[name="project-price"]').blur(function(){
            if($(this).val()>= 0 && $(this).val().length <=20 && $(this).val()!=''){
                $('div[name="project-price-tip"]').text('输入成功').removeClass('state1').addClass('state4');

                ok4=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $('div[name="project-price-tip"]').text('请输入大于0的数字').removeClass('state1').addClass('state3');
                $(this).attr('style','border: 1px red solid');
            }
        });
        $('input[name="dwelling-area"]').blur(function(){
            if($(this).val()>= 0 && $(this).val().length <=20 && $(this).val()!=''){
                $('div[name="dwelling-area-tip"]').text('输入成功').removeClass('state1').addClass('state4');

                ok5=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                $('div[name="dwelling-area-tip"]').text('请输入大于0的数字').removeClass('state1').addClass('state3');
                $(this).attr('style','border: 1px red solid');
            }
        });

        //装修地址
        $('div[name="select-name"]').blur(function(){
            /!*if($(this).find('option').text('省份'||'地级市'||'县级市')){*!/
            if($(this).find('select').text()!=$(this).find('option').eq(0).text()){
                alert('请选择装修地址11');
                ok10=true;
                $(this).attr('style','border: 1px #ddd solid');
            }else{
                alert('请选择装修地址');
                $(this).attr('style','border: 1px red solid');
            }
            var text = $('select option:selected').text();


            if( text=='省份'||'地级市'||'县级市'||'室'||'厅'||'卫'||'选择风格'||'选择颜色'){
                return false ;
            }else{
                ok6=true;//不写此返回值也行，此时就直接提交了
            }

        });

        //提交按钮,所有验证通过方可提交
        $('.button').click(function(){
            if(ok1 && ok2 && ok3 &&  ok4 && ok5 && ok6){
                $('form').submit();
            }else{
                alert('请将表单填写完整');
                return false;
            }
        });

    });
	 

	//普通js function 
	function ValidateNumber(e, pnumber)
	{
	    if (!/^\d+$/.test(pnumber))
	    {
	        var newValue =/^\d+/.exec(e.value);         
	        if (newValue != null)         
	        {             
	            e.value = newValue;        
	        }      
	        else     
	        {          
	            e.value = "";    
	        } 
	    }
	    return false;
	}
	function ValidateFloat(e, pnumber)
	{
	if (!/^\d+[.]?\d*$/.test(pnumber))
	{
	    var newValue = /^\d+[.]?\d*/.exec(e.value);         
	    if (newValue != null)         
	    {             
	        e.value = newValue;        
	    }      
	    else     
	    {          
	        e.value = "";    
	    } 
	}
	return false;
	}

	 
	 
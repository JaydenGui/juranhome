// Release requirements form validation 发布需求验证
	 $(function(){
		var reg = /^[1-9]\d*$/;
        var ok1=false;
        var ok2=false;
        var ok3=false;
        var ok4=false;
        var ok5=false;
        var ok6=false;
        var ok7=false;
        var ok8=false;
        var ok9=false;
        var ok10=false;
        var ok11=false;
        var ok12=false;

        $('input[name="pro-name"]').focus(function(){       	
            $(this).next().text('请输入案例名称').removeClass('state1').addClass('state2');
        }).blur(function(){
            if($(this).val().length >= 2 && $(this).val().length <=12 && $(this).val()!=''){
                $(this).next().text('输入成功').removeClass('state1').addClass('state4');
                ok1=true;
                $(this).css({"border": "1px #eaeaea solid","border-radius":"5px!important"});
            }
            else{
                $(this).next().text('名称长度应在2-12个字').removeClass('state1').addClass('state3');
                $(this).css({"border": "1px red solid","border-radius":"5px!important"});
            }

        });
        //小区名称
        $('#dwelling-name').focus(function(){       	
            $(this).next().text('请输入小区名称').removeClass('state1').addClass('state2');
        }).blur(function(){
            if($(this).val().length >= 2 && $(this).val().length <=12 && $(this).val()!=''){
                $(this).next().text('输入成功').removeClass('state1').addClass('state4');
                ok11=true;
                $(this).css({"border": "1px #eaeaea solid","border-radius":"5px!important"});
            }
            else{
                $(this).next().text('名称长度应在2-12个字').removeClass('state1').addClass('state3');
                $(this).css({"border": "1px red solid","border-radius":"5px!important"});
            }

        });
        
        //房屋类型
        $('select[name="house-style"]').focus(function(){
        }).blur(function(){	
            if($(this).val().length > 0){
                ok2=true;
                $(this).css({"border": "1px #eaeaea solid","width":"248px"});
            }else{
            	 $(this).css({"border": "1px red solid","width":"248px"});
            }
        
        });

        //风格
        $('#select_style').focus(function(){
        }).blur(function(){	
            
            if($(this).val().length > 0){
                ok3=true;
                $(this).css({"border": "1px #eaeaea solid","width":"248px"});
            }else{
                $(this).css({"border": "1px red solid","width":"248px"});
            }
        
        });

        //项目地址1
        $('select[name="s_province"]').focus(function(){
        }).blur(function(){	
           
            if($(this).val() > 0){
                ok4=true;
                $(this).attr('style','border: 1px #eaeaea solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //项目地址2
        $('select[name="s_city"]').focus(function(){
        }).blur(function(){	
            
            if($(this).val() > 0){
                ok5=true;
                $(this).attr('style','border: 1px #eaeaea solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //项目地址3
        $('select[name="s_county"]').focus(function(){
        }).blur(function(){	
            
            if($(this).val() > 0){
                ok6=true;
                $(this).attr('style','border: 1px #eaeaea solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //戶型1
        $('select[name="s_house"]').focus(function(){
        }).blur(function(){	
            
            if($(this).val().length > 0){
                ok7=true;
                $(this).attr('style','border: 1px #eaeaea solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //戶型2
        $('select[name="t_house"]').focus(function(){
        }).blur(function(){	
            
            if($(this).val().length > 0){
                ok8=true;
                $(this).attr('style','border: 1px #eaeaea solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });

        //戶型3
        $('select[name="w_house"]').focus(function(){
        }).blur(function(){	
            
            if($(this).val().length > 0){
                ok9=true;
                $(this).attr('style','border: 1px #eaeaea solid');
            }else{
                $(this).attr('style','border: 1px red solid');
            }
        
        });
       //房间面积
        $("#dwelling-area").focus(function(){
            $(this).next().text('请输入大于0的数字').removeClass('state1').addClass('state2');
        }).blur(function(){
            if(!reg.test($(this).val())){
                $(this).next().text('请输入大于0的数字').removeClass('state1').addClass('state3');
                $(this).css({"border": "1px red solid","border-radius":"5px!important"});
              
            }else{
                ok10=true;
                $(this).next().text('输入成功').removeClass('state1').addClass('state4');
                $(this).css({"border": "1px #eaeaea solid","border-radius":"5px!inportant"});
            }

        });
        //项目报价
        $("#project-price").focus(function(){
            $(this).next().text('请输入大于0的数字').removeClass('state1').addClass('state2');
        }).blur(function(){
            if(!reg.test($(this).val())){
                $(this).next().text('请输入大于0的数字').removeClass('state1').addClass('state3');
                $(this).css({"border": "1px red solid","border-radius":"5px!important"});
              
            }else{
                ok12=true;
                $(this).next().text('输入成功').removeClass('state1').addClass('state4');
                $(this).css({"border": "1px #eaeaea solid","border-radius":"5px!inportant"});
            }

        });

        //提交按钮,所有验证通过方可提交
        $('.button').click(function(){
        	$("#btnSubmit, #btnClose").attr("disabled", "disabled");
        	$('#province_name').val($('#seachprov').find("option:selected").text());
        	$('#city_name').val($('#seachcity').find("option:selected").text());
        	$('#county_name').val($('#seachdistrict').find("option:selected").text());

            $('form').submit();
        });
       
        $("#case_describe").keydown(function(){
            var len = $(this).val().length;
            
            if(len > 200)
                $(this).val($(this).val().substring(0,200));
        });
    });
	 
	 
	 
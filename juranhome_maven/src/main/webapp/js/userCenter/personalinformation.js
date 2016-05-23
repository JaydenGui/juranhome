 $(function(){ 
    var ok1=true;
    var ok2=true;
    var ok3=true;
    var ok4=false;
    var ok5=false;
    var ok20=true;
    var ok21=true;
    var ok22=true;
    var ok30=true;
    var ok31=true;
    var ok32=true;
    
    //昵称
    $('#nickname').focus(function(){
    	$(this).attr('style','border: 1px #ddd solid');
		$('.prompts').css({'display':'none'});
    }).blur(function(){	
    	  var rf_reg=/^[\w\u4e00-\u9fa5]+$/gi;
    		if(rf_reg.test($(this).val())&&$(this).val().length>=2){
				ok1=true;
				$(this).attr('style','border: 1px #ddd solid');
				$('.prompts').css({'display':'none'});
			}else{
				ok1=false;
				$(this).attr('style','border: 1px red solid');
				$('.prompts').css({'display':'block'});
    		}
    
    });
    
    //住宅电话
    $('#home_phone').focus(function(){
    	$(this).attr('style','border: 1px #ddd solid');
	    $('.promptPhone').css({'display':'none'});
    }).blur(function(){	
    	var fe_reg = /^[0-9]+$/;
    	var value=document.getElementById("home_phone").value.trim();
    	//alert(value + "," +fe_reg.test(value));
   	    if((fe_reg.test(value) && value.length>=7) || value.length==0){
			ok2=true;
			$(this).attr('style','border: 1px #ddd solid');
   	    	$('.promptPhone').css({'display':'none'});
   	    }else{
   	    	ok2=false;
   	    	$(this).attr('style','border: 1px red solid');
			$('.promptPhone').css({'display':'block'});
   	    }
    });
    
    
    
  //邮编
    $('#zip_code').focus(function(){
    	$(this).attr('style','border: 1px #ddd solid');
		$('.promptCode').css({'display':'none'});
    }).blur(function(){	
   	    var fe_reg = /^[0-9]{6}$/;
   		if(fe_reg.test($(this).val())||$(this).val().length==0){
			ok3=true;
			$(this).attr('style','border: 1px #ddd solid');
			$('.promptCode').css({'display':'none'});
		}else{
			ok3=false;
			$(this).attr('style','border: 1px red solid');
			$('.promptCode').css({'display':'block'});
   		}
    });
    
    //生日
    $('select[name="year1"]').focus(function(){
    }).blur(function(){	
        if($(this).val() > 0){
        	ok20=true;
            $(this).attr('style','border: 1px #ddd solid');
        }else{
        	ok20=false;
            $(this).attr('style','border: 1px red solid');
        }
    
    });
    $('select[name="month1"]').focus(function(){
    }).blur(function(){	
        if($(this).val() > 0){
			ok21=true;
            $(this).attr('style','border: 1px #ddd solid');
        }else{
        	ok21=false;
            $(this).attr('style','border: 1px red solid');
        }
    
    });
    $('select[name="day1"]').focus(function(){
    }).blur(function(){
        if($(this).val() > 0){
        	ok22=true;
            $(this).attr('style','border: 1px #ddd solid');
        }else{
        	ok22=false;
            $(this).attr('style','border: 1px red solid');
        }
    
    });
    
  //地址
    $('select[name="s_province"]').focus(function(){
    }).blur(function(){	
        if($(this).val().length > 1){
			ok30=true;
			ok31=false;
			ok32=false;
        	$(this).attr('style','border: 1px #ddd solid');
        	$('#seachcity').attr('style','border: 1px #ddd solid');
        	$('#seachdistrict').attr('style','border: 1px #ddd solid');
        }else{
        	ok30=false;
            $(this).attr('style','border: 1px red solid');
        }
    
    });
    $('select[name="s_province"]').change(function(){
    	$('#seachcity').attr('style','border: 1px #ddd solid');
    	$('#seachdistrict').attr('style','border: 1px #ddd solid');
    });
    
    $('select[name="s_city"]').focus(function(){
    }).blur(function(){	
        if($(this).val().length > 1){
			ok31=true;
        	$(this).attr('style','border: 1px #ddd solid');
        }else{
        	ok31=false;
            $(this).attr('style','border: 1px red solid');
        }
    
    });
    $('select[name="s_county"]').focus(function(){
    }).blur(function(){	
    	var districtCount = document.getElementById('seachdistrict').options.length;
    	if(districtCount > 1)
    		{
		        if($(this).val().length > 1){
		        	ok32=true;
		        	$(this).attr('style','border: 1px #ddd solid');
		        }else{
		        	ok32=false;
		            $(this).attr('style','border: 1px red solid');
		        }
    		}
    
    });
 

    //提交按钮,所有验证通过方可提交
    $('.renewalbut').click(function(){
    	var districtCount = document.getElementById('seachdistrict').options.length;
    	if(ok20 && ok21 && ok22 && $('#yyyy').val() > 0 && $('#mm').val() > 0 && $('#dd').val() > 0){
    		ok4=true;
    	}else{
    		if($('#yyyy').val() <= 0){
    			$('#yyyy').attr('style','border: 1px red solid');
    		}else{
    			if($('#mm').val() <= 0){
    				$('#mm').attr('style','border: 1px red solid');
    			}else{
    				if($('#dd').val() <= 0){
    					$('#dd').attr('style','border: 1px red solid');
    				}
    			}
    		}
    		ok4=false;
    	}
    	//alert(document.getElementById('seachdistrict').options.length);
    	if(ok30 && ok31 && ok32 && $('#seachprov').val().length > 1 && $('#seachcity').val().length > 1 && $('#seachdistrict').val().length > 1){
    		ok5=true;
    	}else{
    		if($('#seachprov').val() <= 0){
    			$('#seachprov').attr('style','border: 1px red solid');
	    		ok5=false;
    		}else{
    			if($('#seachcity').val() <= 0){
    				$('#seachcity').attr('style','border: 1px red solid');
		    		ok5=false;
    			}else{
    				if(districtCount > 1 && $('#seachdistrict').val() <= 0){
    					$('#seachdistrict').attr('style','border: 1px red solid');
    		    		ok5=false;
    				}
    				else
    				{
    		    		ok5=true;
    				}
    			}
    		}
    		//ok5=false;
    	}
    	 
    	var isMob=/\d{7,11}$/; 
    	var value=document.getElementById("home_phone").value.trim();
   	    if(isMob.test(value)||value.length==0){
			ok2=true;
			$("#home_phone").attr('style','border: 1px #ddd solid');
   	    	$('.promptPhone').css({'display':'none'});
   	    }else{
   	    	ok2=false;
   	    	$("#home_phone").attr('style','border: 1px red solid');
			$('.promptPhone').css({'display':'block'});
			alert("请填写符合条件的住宅电话");
			return false;
   	    }
    	
        if(ok1 && ok3 && ok4 && ok5){
        	
        }else{
        	if(ok1==false){
				$('#nickname').attr('style','border: 1px red solid');
        		alert("请填写符合条件的昵称");
        		return false;
        	}
    		if(ok4==false){
    			alert("请将生日填写完整");
    			return false;
        	}
    		if(ok5==false){
    			alert("请将所在地填写完整");
    			return false;
        	}
    		if(ok3==false){
				$('#zip_code').attr('style','border: 1px red solid');
    			alert("请填写符合条件的邮编");
    			return false;
        	}
            return false;
        }
    });

});
	 
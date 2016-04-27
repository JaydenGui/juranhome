setTimeout(function(){
	$(':input[type=checkbox]').each(function(){
		var isChecked=$(this).prop('checked');
		//alert(isChecked);
		if(isChecked){
			$(this).parent().addClass("assist-show-click");
		}
	});
}, 2000);

number = 0;
inputCount = 1;
imgCount = 0;
ingShowCnt = 0;
delImgAry = [];
//newImgAry = [];
fileList = "";
newFileList = "";

app.directive('directive', function($timeout) {
    return {
      link: function(scope, element, attr) {
      	$timeout(function() {
      		number = $('#case-images li.exist img').length;
      		//alert(getImgCount());
      		$('#count-number').html(getImgCount());
      	});
      }
    }
});

$(function(){
    /*The style of the choice you are good at*/
    $('#designer_style input').on('change', function() {
    	var max = 5;
    	if($('#designer_style input:checked').length > max) {
    		$(this).prop('checked', false);
    		alert("最多只能选择五项");
    		return false;
    	}
    	$(this).parent().toggleClass("assist-show-click");
    	$(this).attr('checked', $(this).parent().hasClass("assist-show-click"));
    });
    
    /*5 choices*/
    $('.markhall-container-bg-skin').click(function(){
        var windowHeight=$(window).scrollTop();
        if($(window).scrollTop()>50){

            $('#needDetail').css('margin-top','0px');
        }else{
            var px=50-windowHeight+'px';
            $('#needDetail').css('margin-top',px);
        }
    });
    
    var num = 0;
    /*theme ImageSwitcher*/
    $(".change-theme-main .change-theme-arrow").click(function(){
        num++;
        if(num >3){
            num = 0;
        }
        var move =  num * -183;
        $('.change-theme-ul').stop().animate({'left':''+move+'px'},500);
    });

    $(".change-theme-ul li").click(function(){
    	var index=($(this).find("img").attr('alt'));
    	$("#pic_index").val(index);
        $(".change-theme-ul li").find("div").removeClass("click-theme");
        $(this).find("div").addClass("click-theme");
    });
    
    /* change theme*/
    $(".change-theme-save button").click(function(){
        var imgUrl= ($(".click-theme").siblings("img").attr('src'));
        $("#markHall-skin").attr('src',imgUrl);
    });
    
    $(document).on('click', '.uploading-img-img-del-img', function(){
    	number--;
    	
    	if($(this).parent().hasClass('exist'))
    		delImgAry.push($(this).parent().find('img').attr('fid'));
    	
    	$(this).parent().remove();
    	$("#count-number").html(getImgCount());
    	
    });
});

//产生上传图档列表
function buildImgList()
{
	var imgList = ",";
	
	$("#case-images").children().each(function(i,n){
		if($(n).attr("id") != "case-uploading-img")imgList += $(n).attr("id") + ",";
	});
	
	$("#fileList").val(imgList);
}

//Count upload images
function getImgCount()
{
	//var ImgListStr = $("#fileList").val();
	var ImgCount = 0;
	/*
	if(ImgListStr.length > 0)
	{
		ImgListStr = ImgListStr.substr(1, ImgListStr.length - 2);
		
		var ImgListArr = ImgListStr.split(",");
		ImgCount = ImgListArr.length;
	}*/
	
	$("#case-images").children().each(function(i,n){
			if($(n).attr("id") != "case-uploading-img")ImgCount++;
		});
	
	return ImgCount;
}

//Upload photo 
function previewImage(file) {
	buildImgList();
	var CurrentImageCount = getImgCount();
	//alert("Current image count => " + CurrentImageCount);
    if (file.files && file.files[0]) {
    	for(var i=0;i<file.files.length;i++){
    		if (!file.files[i].type == "image/jpeg" || !file.files[i].type == "image/png" || !file.files[i].type == "image/gif" || !file.files[i].type == "image/gif" || file.files[i].type == '') {
    			alert("您上传的图片格式有误！请选择png、gif、jpg、bmp格式的图片");
    			return false;
    		}
    		if(file.files[i].size>6*1048576){
        		alert(file.files[i].name + "　图片大小超标　(" + (file.files[i].size / 1048576) + "M)，请选小于6M的图片！");
        		//return false;
        	}
    		else
    		{
    			//newImgAry.push(file.files[i]);
    			
    			CurrentImageCount++;
    			if(CurrentImageCount>20){
    				alert("最多上传20张图片!");
    				return false;
    			}
    			
    			var PickedImg = new Image();
    			var _URL = window.URL || window.webkitURL;
    			PickedImg.setAttribute('src', _URL.createObjectURL(file.files[i]));
    			
    			$("#case-uploading-img").before('<li class="col-md-3 uploading-img-img" id="' + file.files[i].name + '" ><img width=100%  src=' + PickedImg.src + '  /><div class="uploading-img-img-del-img"></div></li>');
    			$("#count-number").html(getImgCount());
    		}
    	}    	
    	
    	var InputField = document.createElement("input");
    	InputField.setAttribute("type", "file");
    	InputField.setAttribute("id", "case-input-file" + inputCount);
    	InputField.setAttribute("name", "file");
    	InputField.setAttribute("onchange", "previewImage(this,1)");
    	InputField.setAttribute("multiple", "true");
    	InputField.setAttribute("style", "position:absolute; top:0; left:0; height:100%;width:100%;opacity: 0");

    	$("#file_fields").append(InputField);
    }
	buildImgList();
    //alert(getImgCount());
}

function skinpeeler(ele){
		setTimeout(function(){
		var skinsrc=$("img#markHall-skin").attr("src");	
		$(ele).each(function(){							
			var imgsrc = this.src;			
			var imgArr = imgsrc.split("/");
			var newImgsrc = "/"+imgArr[3]+"/"+imgArr[4]+"/"+imgArr[5]+"/"+imgArr[6];			
			if(newImgsrc==skinsrc){					
				$(this).parent("li").find("div").addClass("click-theme");
			}	
		});					
	},500);
}
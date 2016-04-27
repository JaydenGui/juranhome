/*control project-name value then show or hide the tip box*/
$(function(){	
	 //name
    var name=/^[\u4e00-\u9fa5]{2,10}$/;
    var num=/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/;
    var id=/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
    ok1=false;
    ok2=false;
    ok3=false;
    ok4=false;
    ok5=false;



    $("#lastname").focus(function(){
        $(this).next().text('请输入2-10个汉字').removeClass('state1').addClass('state2');
    }).blur(function(){
        if(!name.test($(this).val())){
            $(this).next().text('请输入2-10个汉字').removeClass('state1').addClass('state3');

        }else{
            ok1=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
        }

    });
    //phone
    $("#phone").focus(function(){
        $(this).next().text('请输入11位手机号码').removeClass('state1').addClass('state2');
    }).blur(function(){
        if(!num.test($(this).val())){
            $(this).next().text('请输入正确的格式').removeClass('state1').addClass('state3');

        }else{
            ok2=true;
            $(this).next().text('输入成功').removeClass('state1').addClass('state4');
        }

    });

    
    //Village name check
    $('input[name="house-name"]').focus(function(){
        $(this).next().text('小区名称不能为空且字数在3-20位之间').removeClass('state1').addClass('state2');
    }).blur(function(){
    	 if(!name.test($(this).val())){
             $(this).next().text('小区名称不能为空且字数在3-20位之间').removeClass('state1').addClass('state3');

         }else{
             ok3=true;
             $(this).next().text('输入成功').removeClass('state1').addClass('state4');
         }

    });
    
    //Area of validation, project price
    $('input[name="project-price"]').blur(function(){
        if($(this).val()> 0 && $(this).val().length <=20 && $(this).val()!=''){
            $('div[name="project-price-tip"]').text('输入成功').removeClass('state1').addClass('state4');

            ok4=true;
        }else{
            $('div[name="project-price-tip"]').text('请输入大于0的数字').removeClass('state1').addClass('state3');

        }
    });
    
    $('input[name="dwelling-area"]').blur(function(){
        if($(this).val()>= 0 && $(this).val().length <=20 && $(this).val()!=''){
            $('div[name="dwelling-area-tip"]').text('输入成功').removeClass('state1').addClass('state4');

            ok5=true;
        }else{
            $('div[name="dwelling-area-tip"]').text('请输入大于0的数字').removeClass('state1').addClass('state3');

        }
    });

    
    //The submit button, all validation through before submission
    $('.button').click(function(){
        if(ok1 && ok2 && ok3&& ok4&& ok5 ){
            $('form').submit();
        }else{
            alert('请将表单填写完整');
            return false;
        }
    });
  
      $("#file-1").fileinput({
        showUpload: false,
        showCaption: false,
        allowedFileExtensions : ['jpg', 'png','gif','bmp'],
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
    });
    
    $("#file-2").fileinput({
        showUpload: false,
        showCaption: false,
        allowedFileExtensions : ['jpg', 'png','gif','bmp'],
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
    });

    
  $(document).ready(function() {
        $("#file-2").fileinput({
            'showPreview' : false,
            'allowedFileExtensions' : ['jpg', 'png','gif','bmp'],
            'elErrorContainer': '#errorBlock'
        });

    });
    
    
});

/*input 20 images*/
/*$(function(){

   
    $("#file-0").fileinput({
     'allowedFileExtensions' : ['jpg', 'png','gif'],
     });
     $("#file-1").fileinput({
     uploadUrl: '#', // you must set a valid URL here else you will get an error
     allowedFileExtensions : ['jpg', 'png','gif'],
     overwriteInitial: false,
     maxFileSize: 1000,
     maxFilesNum: 10,
     fileNumLimit:10,
     msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
     //allowedFileTypes: ['image', 'video', 'flash'],
     slugCallback: function(filename) {
     return filename.replace('(', '_').replace(']', '_');
     }
     });

     $(".file").on('fileselect', function(event, n, l) {
     alert('File Selected. Name: ' + l + ', Num: ' + n);
     });

     $("#file-3").fileinput({
     showUpload: false,
     showCaption: false,
     browseClass: "btn btn-primary btn-lg",
     fileType: "any",
     previewFileIcon: "<i class='glyphicon glyphicon-king'></i>"
     });
     $("#file-4").fileinput({
     uploadExtraData: {kvId: '10'}
     });
     $(".btn-warning").on('click', function() {
     if ($('#file-4').attr('disabled')) {
     $('#file-4').fileinput('enable');
     } else {
     $('#file-4').fileinput('disable');
     }
     });
     $(".btn-info").on('click', function() {
     $('#file-4').fileinput('refresh', {previewClass:'bg-info'});
     });

     $('#file-4').on('fileselectnone', function() {
     alert('Huh! You selected no files.');
     });
     $('#file-4').on('filebrowse', function() {
     alert('File browse clicked for #file-4');
     });

     $(document).ready(function() {
     $("#test-upload").fileinput({
     'showPreview' : false,
     'allowedFileExtensions' : ['jpg', 'png','gif','bmp'],
     'elErrorContainer': '#errorBlock'
     });

     $("#test-upload").on('fileloaded', function(event, file, previewId, index) {
     alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
     });

     });

});*/

/*onload one image*/
function previewImage(file)
{
    var MAXWIDTH  = 200;
    var MAXHEIGHT = 150;
    var div = document.getElementById('preview');
    if (file.files && file.files[0])
    {
        div.innerHTML ='<img id=imghead>';
        var img = document.getElementById('imghead');
        img.onload = function(){
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width  =  rect.width;
            img.height =  rect.height;
//          img.style.marginLeft = rect.left+'px';
//          img.style.marginTop = rect.top+'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt){img.src = evt.target.result;}
        reader.readAsDataURL(file.files[0]);
    }
    else
    {
        var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imghead>';
        var img = document.getElementById('imghead');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
        div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
    }
}
function clacImgZoomParam( maxWidth, maxHeight, width, height ){
    var param = {top:0, left:0, width:width, height:height};
    if( width>maxWidth || height>maxHeight )
    {
        rateWidth = width / maxWidth;
        rateHeight = height / maxHeight;

        if( rateWidth > rateHeight )
        {
            param.width =  maxWidth;
            param.height = Math.round(height / rateWidth);
        }else
        {
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
        }
    }

    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
}
//left side menu linkage personal center
$(function(){
    $(".leftsidebar_box dt").css({"background-color":"#F6F6F6"});
    $(".leftsidebar_box dt img").attr("src",baseUrl+"/images/personalleft/select_xl01.png");

    $(".leftsidebar_box dd").hide();
    $(".leftsidebar_box dt").click(function(){
        $(".leftsidebar_box dt").css({"color": "#555"});
        $(".leftsidebar_box dt").css({"background-color":"#F6F6F6"});
        $(this).css({"background-color": "#007AFF"});
        $(this).css({"color": "#FFF"});
        $(this).parent().find('dd').removeClass("menu_chioce");
        $(".leftsidebar_box dt img").attr("src",baseUrl+"/images/personalleft/select_xl01.png");
        $(this).parent().find('img').attr("src",baseUrl+"/images/personalleft/select_xl.png");
		$(this).parent().find('dd').slideToggle(300);
			
        var name=$(this).html();
        $(".page-header p").html(name);
        $(".active").html(name);
    });
    $(".leftsidebar_box dl a dd").click(function(){
        $(".leftsidebar_box a dd").css({"background-color":"#F6F6F6"});
        $(this).css({"background-color":"#D3EDFA"});
    });

    $(".leftsidebar_box dl a dd").click(function(){
        var name = $(this).html();
        $(".page-header p").html(name);
        $(".active").html(name);
    });

//Home page title to switch
    $(".edit_personal_information").hide();
    $("#homepage a").click(function(){
        var index= $(this).attr("id");
        $(this).addClass('home_page_title titleactive').siblings().removeClass('home_page_title titleactive');
        if(index==1){
            $(".my_personal_center").show();
            $(".edit_personal_information").hide();
        }else{
            $(".my_personal_center").hide();
            $(".edit_personal_information").show();
        }
    });

//Looking for a designer to switch
    $(".latest_label").hide();
    $("#dddesig a").click(function(){
        var index= $(this).attr("id");
        $(this).addClass('desig desigactive').siblings().removeClass('desig desigactive');
        if(index==61){
            $(".figures_show").show();
            $(".latest_label").hide();
        }else{
            $(".figures_show").hide();
            $(".latest_label").show();
        }
    });
});





















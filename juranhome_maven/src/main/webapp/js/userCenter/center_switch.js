// Home page title to switch
$(function(){
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

// My collection
    $(".template").hide();
    $("#tukua a").click(function(){
        var index= $(this).attr("id");
        $(this).addClass('home_page_title titleactive').siblings().removeClass('home_page_title titleactive');
        if(index==101){
            $(".gallery").show();
            $(".template").hide();
        }else{
            $(".gallery").hide();
            $(".template").show();
        }
    });

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
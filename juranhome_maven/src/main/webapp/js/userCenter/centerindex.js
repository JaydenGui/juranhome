$(function(){
        //My collection
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

		function dishe(y){
		    $(".veiled").parent().parent().siblings("."+y).slideToggle(200);
		    $(this).css('background-image','url(../../images/message/up.gif)');
		    $(".veiled").addClass('veiledb').siblings().removeClass('veiledb');
		};


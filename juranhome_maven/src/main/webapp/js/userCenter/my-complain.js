 $(function(){
            /*news-center-notice news-center-public toggle show*/
            $(".view-details").hide();
            $(".view-del").hide();
            $(".visible-md").find('a').hover(function(){
                $(this).next('div').toggle();
            });
        })
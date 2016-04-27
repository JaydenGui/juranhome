 $(function(){
            /*div.hide when hover show*/
            $(".DiY-list-li").mouseenter(function(){
                $(this).find(".hide").stop().animate({bottom:'0px'});
            });
             $(".DiY-list-li").mouseleave(function(){
                 $(this).find(".hide").stop().animate({bottom:'-28px'});
             });

         /* Termination requirements window part */
         $('.del-window').click(function(event) {
             $('.mask').css({'height':$(document).height(),'width':$(document).width()}).show();
             $('.termination').addClass('in').removeClass('fade').fadeIn();
         });
         /* The close button to start */
         $('.close').click(function(event) {
             $('.mask').hide();
             $('.termination').hide();
         });
         /* The close button to end */

 })
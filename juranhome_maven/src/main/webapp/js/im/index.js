/*++++++++++++++++++++++++++++++++++++++++++++
 * im index
 * ============================================
 * @author xufengjuan
 * ============================================
 * @date 2016-3-23
 *+++++++++++++++++++++++++++++++++++++++++++++*/

$(function() {
    /**
     *scrollbar
     */
    $('.Default').perfectScrollbar();
    /**
     *left designer current state
     */
    $(document).on("click", ".xfj_here01", function() {
        $(this).eq(0).addClass('xfj_here1').removeClass('xfj_here01').siblings().addClass('xfj_here01').removeClass('xfj_here1');
    });
    /**
     *send button select
     */
    $('.xfj_list2').find('li').click(function() {
        $(this).addClass('li1').siblings().removeClass('li1')
    });
    /**
     *search validate
     */
    $('.xfj_close').hide();
    $('.xfj_search_float1').hide();
    $('.xfj_inp1').keyup(function() {
        $('.xfj_close').show();
        $('.xfj_btn1').hide();
        $('.xfj_search_float1').show();
    });
    $('.xfj_close').click(function() {
        $('.xfj_close').hide();
        $('.xfj_btn1').show();
        $('.xfj_inp1').val('');
        $('.xfj_search_float1').hide();
    });
	 /**
     *send image
     */
	$(document).on('click','#button1',function(){
		$('#button2').trigger("click");
	});

	
	/**
     *addhot teching
     */
	var click_teching3=true;
	var xfj_add=false;
	var xfj_add1=false;
	$('.xfj_teching1').click(function(){
		$('.xfj_teching1').hide();
		$('.xfj_teching2').show();
		xfj_add=false;
	});
	$('.xfj_teching2').click(function(){
		$('.xfj_teching2').hide();
		$('.xfj_teching3').show();
		click_teching3=true;
		xfj_add=true;
	});
	$('.xfj_teching3').click(function(){
		if(click_teching3==true){
			click_teching3=false;
			$('.xfj_teching1').show();
		}
	});
	$('.xfj_add1').click(function(){
		if(xfj_add==true){
			xfj_add=false;
			$(this).addClass('xfj_add2');
		};
		xfj_add1=true;
		
	});
	$('.add_hot_picture1').click(function(){
		if(xfj_add1==true){
			$('.xfj_teching3').hide();
			$('.add_hot_picture').wrap('<div class="l"></div>');
			$('.xfj_hot_active').show();
			$('.xfj_add1').removeClass('xfj_add2');
			$('.r').show();
		};
		xfj_add=true;
	});
	$('.xfj_delete').click(function(){
		$(this).addClass('xfj_delete1');
		$('.xfj_num3').hide();
		$('.xfj_delete3').show();
	});
	$('#xfj_sure').click(function(){
		$('.xfj_sure_content').hide();
		$('.xfj_sure_delete1').show();
	});
	$('.xfj_sure_close').click(function(){
		$('.xfj_delete1').removeClass('xfj_delete1');
		$('.xfj_num3').show();
		$('.xfj_delete3').hide();
	});
	$('.xfj_delete1').click(function(){
		$('.xfj_delete1').removeClass('xfj_delete1');
		$('.xfj_num3').show();
		$('.xfj_delete3').hide();
	});


	/**
     *bootstrap tooltip
     */
	$('[data-toggle="tooltip"]').tooltip();

});
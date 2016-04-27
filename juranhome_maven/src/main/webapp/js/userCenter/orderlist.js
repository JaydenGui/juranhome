(function($){
		$(function() {
			/*$('.pane1-config,.modifypanel-config,.termination,.complaints,.details-page,.Results-browse').css({'display':'none'});
			$('.Design-contract,.design-results,.final-results,.final-contract').css({'display':'none'});*/
			$('.order-status-page2').click(function(event) {
				$('.pane1-config').addClass('open').siblings().removeClass('open');
				// Order to show my home outfit for the first page for details
			});
			$('.left-input-button').click(function(event) {
				$('.orderlist').addClass('open').siblings().removeClass('open');
				// Order to show my home page
			});
			$('.Check-the-details,.apply-refund').click(function(event) {
				$('.details-page').addClass('open').siblings().removeClass('open');
				// Order to show my home outfit in the second page for details
				// To apply for a refund jump page
			});
			$('.pay').click(function(event) {
				//top.location='pay.html';
				//window.location.href="pay.html?act=logout";
				window.open("pay.html");
				// Jump to the payment page
			});
			/* Modify the requirements start window parts */
			$('.modifypanel-config-toggle').click(function(event) {
				$('.mask').css({'height':$(document).height(),'width':$(document).width()}).show();
				$('.modifypanel-config').addClass('in').removeClass('fade').fadeIn();
			});
			/* Modify the requirements window part is over */
		
			/* Termination requirements window part */
			$('.Termination-demand').click(function(event) {
				$('.mask').css({'height':$(document).height(),'width':$(document).width()}).show();
				$('.termination').addClass('in').removeClass('fade').fadeIn();
			});
			/* Termination requirements window part is over */
		
			/* Complaints button window part */
			$('.Complaints-controls').click(function(event) {
				$('.mask').css({'height':$(document).height(),'width':$(document).width()}).show();
				$('.complaints').addClass('in').removeClass('fade').fadeIn();
			});
			/* Complaints button window part is over */
		
			/* Design results window part */
			$('.order-information-result').click(function(event) {
				$('.mask').css({'height':$(document).height(),'width':$(document).width()}).show();
				$('.design-results').addClass('in').removeClass('fade').fadeIn();
			});
			/* Design results window part is over */
		
			/* Design contract window part */
			$('.order-information-bargain').click(function(event) {
				$('.mask').css({'height':$(document).height(),'width':$(document).width()}).show();
				$('.Design-contract').addClass('in').removeClass('fade').fadeIn();
			});
			/* Design contract window part is over */
		
			/* Part quantity room results window */
			$('.order-information-measurementroom').click(function(event) {
				$('.mask').css({'height':$(document).height(),'width':$(document).width()}).show();
				$('.Results-browse').addClass('in').removeClass('fade').fadeIn();
			});
			/* Results amount of room window part of the end */
		
			/* The last design result confirmed */
			$('.Confirm-final-design-results').click(function(event) {
				$('.mask').css({'height':$(document).height(),'width':$(document).width()}).show();
				$('.final-results').addClass('in').removeClass('fade').fadeIn();
			});
			/* The final design results confirm the end */
		
			/* Design contract confirmation */
			$('.Design-contract-confirmation').click(function(event) {
				$('.mask').css({'height':$(document).height(),'width':$(document).width()}).show();
				$('.final-contract').addClass('in').removeClass('fade').fadeIn();
			});
			/* Design contract confirmation */
		
			/* The close button to start */
			$('.close').click(function(event) {
				$('.mask').hide();
				$('.modifypanel-config').hide();
				$('.termination').hide();
				$('.complaints').hide();
				$('.design-results').hide();
				$('.Design-contract').hide();
				$('.Results-browse').hide();
				$('.final-results').hide();
				$('.final-contract').hide();
			});
			/* The close button to end */
			
			$('.house-img').hover(function() {
				// File upload control
				$('.house-img input').show(200);
			}, function() {
				$('.house-img input').hide(200);
			});
		
			
			$('.Arrow-menu').click(function(event) {
				$('.contract-content').slideToggle(600);
				// Show and hide the contract details
			});
		});
})(jQuery);
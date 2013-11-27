/**
 * Scripts for hotdog object
 */

$( "#hotdogSaveButton" ).click(function() {
			
			var hotdogBreadId = $('input[name=hotdogBread]:radio:checked').attr('id');
			var hotdogBreadSizeAndPriceId = $('#hotdogBreadSizeAndPrices' + hotdogBreadId).val();
			
			var hotdogSausageId = $('input[name=hotdogSausages]:radio:checked').attr('id');
			var hotdogSausageAmountAndPriceId = $('#hotDogSausageAmountAndPrice' + hotdogSausageId).val();
	
			var hotdogSauceWithAmountAndPriceIds = new Array();
			$.each($('input[name=hotdogSauces]:checkbox:checked'), function(index, value) {
				var hotdogSauceWithAmountAndPrice = new Object();
				var hotdogSauceId =  value.id;
				hotdogSauceWithAmountAndPrice.hotdogSauceId = hotdogSauceId;
				hotdogSauceWithAmountAndPrice.hotdogSauceAmountAndPriceId = $('#hotdogSauceAmountAndPrice' + hotdogSauceId).val();
				hotdogSauceWithAmountAndPriceIds.push(hotdogSauceWithAmountAndPrice);
			});
			
			var url = 'process-add-hotdog';
			$.ajax({
				url: url,
				type: "POST",
				contentType: "application/json",
				data:
					JSON.stringify(
						{	hotdogBread: {hotdogBreadId: hotdogBreadId, hotdogBreadSizeAndPriceId: hotdogBreadSizeAndPriceId},
							hotdogSausage: {hotdogSausageId: hotdogSausageId, hotdogSausageAmountAndPriceId: hotdogSausageAmountAndPriceId},
							hotdogSauces: hotdogSauceWithAmountAndPriceIds
						}
					)
			}).done(function(response) {
				alertify.success("Ajax salad succeeded");		
			});
		});/**
 * 
 */
$( "#sandwichSaveButton" ).click(function() {
			var sandwichBreadId = $('input[name=sandwichBread]:radio:checked').attr('id');
			var sandwichBreadSizeAndPriceId = $('#sandwichBreadSizeAndPrice' + sandwichBreadId).val();
			
			var sandwichSausageAndSandwichSausageAmountAndPriceIds = new Array();
			$.each($('input[name=sandwichSausages]:checkbox:checked'), function(index, value) {
				var sandwichSausageWithAmountAndPrice = new Object();
				var sandwichSausageId =  value.id;
				sandwichSausageWithAmountAndPrice.sandwichSausageId = sandwichSausageId;
				sandwichSausageWithAmountAndPrice.sandwichSausageAmountAndPriceId = $('#sandwichSausageAmountAndPrice' + sandwichSausageId).val();
				sandwichSausageAndSandwichSausageAmountAndPriceIds.push(sandwichSausageWithAmountAndPrice);
			});
			
			var sandwichVegetableWithAmountAndPriceIds = new Array();
			$.each($('input[name=sandwichVegetable]:checkbox:checked'), function(index, value) {
				var sandwichVegetableWithAmountAndPrice = new Object();
				var sandwichVegetableId = value.id;
				sandwichVegetableWithAmountAndPrice.sandwichVegetableId = sandwichVegetableId;
				sandwichVegetableWithAmountAndPrice.sandwichVegetableAmountAndPriceId = $('#sandwichVegetableAmountAndPrice' + sandwichVegetableId).val();
				sandwichVegetableWithAmountAndPriceIds.push(sandwichVegetableWithAmountAndPrice);
			});
			
			var sandwichSauceWithAmountAndPriceIds = new Array();
			$.each($('input[name=sandwichSauce]:checkbox:checked'), function(index, value) {
				var sandwichSauceWithAmountAndPrice = new Object();
				var sandwichSauceId =  value.id;
				sandwichSauceWithAmountAndPrice.sandwichSauceId = sandwichSauceId;
				sandwichSauceWithAmountAndPrice.sandwichSauceAmountAndPriceId = $('#sandwichSauceAmountAndPrice' + sandwichSauceId).val();
				sandwichSauceWithAmountAndPriceIds.push(sandwichSauceWithAmountAndPrice);
			});
			
			var sandwichSpiceWithAmountAndPriceIds = new Array();
			$.each($('input[name=sandwichSpice]:checkbox:checked'), function(index, value) {
				var sandwichSpiceWithAmountAndPrice = new Object();
				var sandwichSpiceId =  value.id;
				sandwichSpiceWithAmountAndPrice.sandwichSpiceId = sandwichSpiceId;
				sandwichSpiceWithAmountAndPrice.sandwichSpiceAmountAndPriceId = $('#sandwichSpiceAmountAndPrice' + sandwichSpiceId).val();
				sandwichSpiceWithAmountAndPriceIds.push(sandwichSpiceWithAmountAndPrice);
			});
			var url = 'process-add-sandwich';
			$.ajax({
				url: url,
				type: "POST",
				contentType: "application/json",
				data:
					JSON.stringify(
						{	sandwichBread: {sandwichBreadId: sandwichBreadId, sandwichBreadSizeAndPriceId: sandwichBreadSizeAndPriceId},
							sandwichSausages: {sandwichSausages: sandwichSausageAndSandwichSausageAmountAndPriceIds},
							sandwichVegetables: {sandwichVegetables: sandwichVegetableWithAmountAndPriceIds},
							sandwichSauces: {sandwichSauces: sandwichSauceWithAmountAndPriceIds},
							sandwichSpices: {sandwichSpices: sandwichSpiceWithAmountAndPriceIds}
						}
					)
			}).done(function(response) {
				alertify.success("Ajax success");		
			});
		});
		
$(document).ready(function(){
	$('input').each(function(){
		var self = $(this),
		label = self.next(),
		label_text = label.text();
	
		label.remove();
		self.iCheck({
			checkboxClass: 'icheckbox_line-blue',
			radioClass: 'iradio_line-blue',
			insert: '<div class="icheck_line-icon"></div>' + label_text
		});
	});
});
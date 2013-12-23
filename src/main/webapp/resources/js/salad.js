/**
 * Scripts for Salad object
 */

$( "#saladSaveButton" ).click(function() {
			
			var saladIngredientAndSaladIngredientAmountAndPriceIds = new Array();
			$.each($('input[name=saladIngredient]:checkbox:checked'), function(index, value) {
				var saladIngredientWithAmountAndPrice = new Object();
				var saladIngredientId =  value.id;
				saladIngredientWithAmountAndPrice.saladIngredientId = saladIngredientId;
				saladIngredientWithAmountAndPrice.saladIngredientAmountAndPriceId = $('#saladIngredientAmountAndPrice' + saladIngredientId).val();
				saladIngredientAndSaladIngredientAmountAndPriceIds.push(saladIngredientWithAmountAndPrice);
			});
			
			var url = 'process-add-salad';
			$.ajax({
				url: url,
				type: "POST",
				contentType: "application/json",
				data:
					JSON.stringify(
						{	
							saladIngredients: {saladIngredients: saladIngredientAndSaladIngredientAmountAndPriceIds},
						}
					)
			}).done(function(response) {
				alertify.success(response.saladSavedMessage);		
			});
		});
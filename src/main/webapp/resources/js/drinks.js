/**
 * Scripts for drinks object
 */

$( "#drinkSaveButton" ).click(function() {
			var drinkId = $('input[name=drink]:radio:checked').attr('id');
			var drinkSizeAndPriceId = $('#drinkSizeAndPrices' + drinkId).val();
			
			var drinkAddonWithAmountAndPriceIds = new Array();
			$.each($('input[name=drinkAddOn]:checkbox:checked'), function(index, value) {
				var drinkAddonWithAmountAndPrice = new Object();
				var drinkAddonId =  value.id;
				drinkAddonWithAmountAndPrice.drinkAddonId = drinkAddonId;
				drinkAddonWithAmountAndPrice.drinkAddonAmountAndPriceId = $('#drinkAddOnAmountAndPrices' + drinkAddonId).val();
				drinkAddonWithAmountAndPriceIds.push(drinkAddonWithAmountAndPrice);
			});
			
			var url = 'process-add-drink';
			$.ajax({
				url: url,
				type: "POST",
				contentType: "application/json",
				data:
					JSON.stringify(
						{	drink: {drinkId: drinkId, drinkSizeAndPriceId: drinkSizeAndPriceId},
							drinkAddons: {drinkAddons: drinkAddonWithAmountAndPriceIds}
						}
					)
			}).done(function(response) {
				alertify.success("Ajax succeeded");		
			});
		});
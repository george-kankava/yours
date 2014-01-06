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

$('input').on('ifChecked', function(event){
	var ingredientName = $(event.target.outerHTML).attr('name');
	if(ingredientName === 'sandwichBread') {
		var selectElement = $('#' + ingredientName + 'SizeAndPrice' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#' + ingredientName + 'SizeAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice += parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'sandwichSausage') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice += parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'sandwichVegetable') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice += parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'sandwichSauce') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice += parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'sandwichSpice') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice += parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'saladIngredient') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		saladPrice += parseFloat(price);
		$('#saladPrice').text(parseFloat(Math.round(saladPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'drink') {
		var selectElement = $('#' + ingredientName + 'SizeAndPrices' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#' + ingredientName + 'SizeAndPrices' + event.target.id + " :selected").attr('ingredient-price');
		drinkPrice += parseFloat(price);
		$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
		$.get('get-drink-addons.ajax', {drinkId : event.target.id}).done(function(response) {
			$('#drink-addon-table').empty();
			$('#drink-addon-table').append(response);
		});
	} else if(ingredientName === 'hotdogBread') {
		var selectElement = $('#hotdogBreadSizeAndPrices' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#hotdogBreadSizeAndPrices' + event.target.id + " :selected").attr('ingredient-price');
		hotdogPrice += parseFloat(price);
		$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
	} if(ingredientName === 'hotdogSausages') {
		var selectElement = $('#hotDogSausageAmountAndPrice' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#hotDogSausageAmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		hotdogPrice += parseFloat(price);
		$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
	} if(ingredientName === 'hotdogSauces') {
		var selectElement = $('#hotdogSauceAmountAndPrice' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#hotdogSauceAmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		hotdogPrice += parseFloat(price);
		$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
	}
});
$('input').on('ifUnchecked', function(event){
	var ingredientName = $(event.target.outerHTML).attr('name');
	if(ingredientName === 'sandwichBread') {
		var selectElement = $('#' + ingredientName + 'SizeAndPrice' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#' + ingredientName + 'SizeAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice -= parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'sandwichSausage') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice -= parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'sandwichVegetable') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice -= parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'sandwichSauce') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice -= parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'sandwichSpice') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		sandwichPrice -= parseFloat(price);
		$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'saladIngredient') {
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		saladPrice -= parseFloat(price);
		$('#saladPrice').text(parseFloat(Math.round(saladPrice * 100) / 100).toFixed(2));
	} else if(ingredientName === 'drink') {
		var selectElement = $('#' + ingredientName + 'SizeAndPrices' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		drinkPrice = parseFloat(0);
		$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
	} if(ingredientName === 'hotdogBread') {
		var selectElement = $('#hotdogBreadSizeAndPrices' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#hotdogBreadSizeAndPrices' + event.target.id + " :selected").attr('ingredient-price');
		hotdogPrice -= parseFloat(price);
		$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
	} if(ingredientName === 'hotdogSausages') {
		var selectElement = $('#hotDogSausageAmountAndPrice' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#hotDogSausageAmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		hotdogPrice -= parseFloat(price);
		$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
	} if(ingredientName === 'hotdogSauces') {
		var selectElement = $('#hotdogSauceAmountAndPrice' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#hotdogSauceAmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		hotdogPrice -= parseFloat(price);
		$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
	}
});
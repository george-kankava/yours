<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tr class="sandwich-sauce-${sandwichSauce.id }">
	<td><select class="form-control">
			<option>${sandwichSauce.nameGeo }</option>
			<option>${sandwichSauce.nameEng }</option>
			<option>${sandwichSauce.nameRus }</option>
	</select></td>
	<td><select class="form-control">
			<option>${sandwichSauce.descriptionGeo }</option>
			<option>${sandwichSauce.descriptionEng }</option>
			<option>${sandwichSauce.descriptionRus }</option>
	</select></td>
	<td><select id="sandwich-sauce-amount-and-price-${sandwichSauce.id}"
		class="form-control">
			<c:forEach items="${sandwichSauce.sauceAmountAndPrices }" var="sandwichSauceAmountAndPrice">
				<option value="${sandwichSauceAmountAndPrice.id }">${sauceAmountAndPrice.portion } - ${sauceAmountAndPrice.price }</option>
			</c:forEach>
	</select></td>
	<td>
		<button id="sandwich-sauce-amount-and-price-select-item-remove-${sandwichSauce.id }" type="button" class="btn btn-warning">Remove</button>
	</td>
	<td><a data-toggle="modal" href="#myModal-${sandwichSauce.id}"
		class="btn btn-success">Add</a> <!-- Modal -->
		<div class="modal fade" id="myModal-${sandwichSauce.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Add</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id="sandwichSauceId-${sandwichSauce.id}" name="sandwichSauceId" value="${sandwichSauce.id}">
						<div class="form-group">
							<label for="sandwichSauceAmount-${sandwichSauce.id }">Amount</label> <input type="text"
								class="form-control" id="sandwichSauceAmount-${sandwichSauce.id}" name="amount" placeholder="Enter Amount">
						</div>
						<div class="form-group">
							<label for="sandwichSaucePrice-${sandwichSauce.id }">Price</label> 
							<input type="text" class="form-control" id="sandwichSaucePrice-${sandwichSauce.id}" name="price" placeholder="Enter Price">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" id="my-modal-${sandwichSauce.id}" class="btn btn-primary">Add</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal --></td>
	<td><button id="sandwich-sauce-remove-btn-${sandwichSauce.id }" type="button" class="btn btn-danger">Remove</button></td>
</tr>
<script>
$('#my-modal-${sandwichSauce.id}').click(function() {
	var url =  'process-sandwich-sauce-amount-and-price';
	$.ajax({
		url: url,
		data: {
			sandwichSauceId: $('#sandwichSauceId-${sandwichSauce.id}').val(),
			amount: toUnicode($('#sandwichSauceAmount-${sandwichSauce.id}').val()),
			price: $('#sandwichSaucePrice-${sandwichSauce.id}').val()
		}
	}).done(function(sandwichSauceAmountAndPrice) {
		$('#sandwich-sauce-amount-and-price-${sandwichSauce.id}').append('<option value=' + sandwichSauceAmountAndPrice.id + ' selected="selected">' + sandwichSauceAmountAndPrice.portion + ' - ' + parseFloat(Math.round(sandwichSauceAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
		$('#myModal-${sandwichSauce.id}').modal('hide');
		alertify.success("Data has been saved");
	});
});
$('#sandwich-sauce-amount-and-price-select-item-remove-${sandwichSauce.id }').click(function() {
	alertify.confirm("Do you really want to remove this entry?", function (e) {
		if (e) {
			var url = 'remove-sandwich-sauce-amount-and-price';
			$.ajax({
				url: url,
				data: {
					sandwichSauceAmountAndPriceId: $('#sandwich-sauce-amount-and-price-${sandwichSauce.id}').val()
				}
			}).done(function() {
				$("#sandwich-sauce-amount-and-price-${sandwichSauce.id} option[value=" + $('#sandwich-sauce-amount-and-price-${sandwichSauce.id}').val() + "]").remove();
				alertify.error("Data has been removed");
			});			
		}
	});
});
$('#sandwich-sauce-remove-btn-${sandwichSauce.id }').click(function() {
	alertify.confirm("Do you really want to remove this entry?", function (e) {
	    if (e) {
	    	var url = 'remove-sandwich-sauce';
			$.ajax({
				url: url,
				data: {sandwichSauceId: '${sandwichSauce.id}'}
			}).done(function() {
				$('.sandwich-sauce-${sandwichSauce.id }').remove();
				alertify.error("Data has been removed");
			});			    	
	    } 
	});
});
</script>
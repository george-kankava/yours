<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr class="sandwich-sausage-${sandwichSausage.id }">
	<td>
		<select class="form-control">
			<option>${sandwichSausage.nameGeo }</option>
			<option>${sandwichSausage.nameEng }</option>
			<option>${sandwichSausage.nameRus }</option>
		</select>
	</td>
	<td>
		<select class="form-control">
			<option>${sandwichSausage.descriptionGeo }</option>
			<option>${sandwichSausage.descriptionEng }</option>
			<option>${sandwichSausage.descriptionRus }</option>
		</select>
	</td>
	<td>
		<select id="sandwich-sausage-amount-and-price-${sandwichSausage.id }" class="form-control">
			<c:forEach items="${sandwichSausage.sausageAmountAndPrices }" var="sausageAmountAndPrice">
				<option>${sausageAmountAndPrice.portion} - ${sausageAmountAndPrice.price }</option>
			</c:forEach>
		</select>
	</td>
	<td>
		<button id="sandwich-sausage-amount-and-price-select-item-remove-${sandwichSausage.id }" type="button" class="btn btn-warning">Remove</button>
	</td>
	<td><a data-toggle="modal" href="#myModal-${sandwichSausage.id }" class="btn btn-success">Add</a>
	<!-- Modal -->
	<div class="modal fade" id="myModal-${sandwichSausage.id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Add</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" id="sandwichSausageId-${sandwichSausage.id }" name="sandwichSausageId" value="${sandwichSausage.id}">
					<div class="form-group">
						<label for="sandwichSausageAmount-${sandwichSausage.id }">Amount</label>
						<input type="text" class="form-control" id="sandwichSausageAmount-${sandwichSausage.id }" id="sandwichSausageAmount" placeholder="Enter Amount">
					</div>
					<div class="form-group">
						<label for="sandwichSausagePrice-${sandwichSausage.id }">Price</label>
						<input type="text" class="form-control" id="sandwichSausagePrice-${sandwichSausage.id }" id="sandwichSausagePrice" placeholder="Enter Price">
					</div>		
					</div>
						<div class="modal-footer">	
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button id="my-modal-${sandwichSausage.id}" type="button" class="btn btn-primary">Add</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div><!-- /.modal -->						
		</td>
	<td><button id="sandwich-sausage-remove-btn-${sandwichSausage.id }" type="button" class="btn btn-danger">Remove</button></td>
</tr>
<script>
$('#my-modal-${sandwichSausage.id}').click(function() {
	var url =  'process-sandwich-sausage-amount-and-price';
	$.ajax({
		url: url,
		data: {
			sandwichSausageId: $('#sandwichSausageId-${sandwichSausage.id}').val(),
			amount: toUnicode($('#sandwichSausageAmount-${sandwichSausage.id}').val()),
			price: $('#sandwichSausagePrice-${sandwichSausage.id}').val()
		}
	}).done(function(sandwichSausageAmountAndPrice) {
		$('#sandwich-sausage-amount-and-price-${sandwichSausage.id}').append('<option value=' + sandwichSausageAmountAndPrice.id + ' selected="selected">' + sandwichSausageAmountAndPrice.portion + ' - ' + parseFloat(Math.round(sandwichSausageAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
		$('#myModal-${sandwichSausage.id}').modal('hide');
		alertify.success("Data has been saved");
	});
});
$('#sandwich-sausage-amount-and-price-select-item-remove-${sandwichSausage.id }').click(function() {
	alertify.confirm("Do you really want to remove this entry?", function (e) {
		if (e) {
			var url = 'remove-sandwich-sausage-amount-and-price';
			$.ajax({
				url: url,
				data: {
					sandwichSausageAmountAndPriceId: $('#sandwich-sausage-amount-and-price-${sandwichSausage.id}').val()
				}
			}).done(function() {
				$("#sandwich-sausage-amount-and-price-${sandwichSausage.id} option[value=" + $('#sandwich-sausage-amount-and-price-${sandwichSausage.id}').val() + "]").remove();
				alertify.error("Data has been removed");
			});			
		}
	});
});
$('#sandwich-sausage-remove-btn-${sandwichSausage.id }').click(function() {
	alertify.confirm("Do you really want to remove this entry?", function (e) {
	    if (e) {
	    	var url = 'remove-sandwich-sausage';
			$.ajax({
				url: url,
				data: {sandwichSausageId: '${sandwichSausage.id}'}
			}).done(function() {
				$('.sandwich-sausage-${sandwichSausage.id }').remove();
				alertify.error("Data has been removed");
			});			    	
	    } 
	});
});
</script>
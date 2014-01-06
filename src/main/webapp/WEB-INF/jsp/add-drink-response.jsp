<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr class="drink-${drink.id }">
	<td><select class="form-control">
			<option>${drink.nameGeo }</option>
			<option>${drink.nameEng }</option>
			<option>${drink.nameRus }</option>
	</select></td>
	<td><select class="form-control">
			<option>${drink.descriptionGeo }</option>
			<option>${drink.descriptionEng }</option>
			<option>${drink.descriptionRus }</option>
	</select></td>
	<td><select id="drink-size-and-price-${drink.id}"
		class="form-control">
			<c:forEach items="${drink.drinkSizeAndPrices }" var="drinkSizeAndPrice">
				<option value="${drinkSizeAndPrice.id }">${drinkSizeAndPrice.size } - ${drinkSizeAndPrice.price }</option>
			</c:forEach>
	</select></td>
	<td>
		<button id="drink-size-and-price-select-item-remove-${drink.id }" type="button" class="btn btn-warning">Remove</button>
	</td>
	<td><a data-toggle="modal" href="#myModal-${drink.id}" class="btn btn-success">Add</a> <!-- Modal -->
		<div class="modal fade" id="myModal-${drink.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal aria-hidden="true">&times;</button>
						<h4 class="modal-title">Add</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id="drinkId-${drink.id}" name="drinkId" value="${drink.id}">
						<div class="form-group">
							<label for="drinkSize-${drink.id }">Size</label> <input type="text" class="form-control" id="drinkSize-${drink.id}" placeholder="Enter Size">
						</div>
						<div class="form-group">
							<label for="drinkPrice-${drink.id}">Price</label> 
							<input type="text" class="form-control" id="drinkPrice-${drink.id}" placeholder="Enter Price">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" id="my-modal-${drink.id}" class="btn btn-primary">Add</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal --></td>
	<td><button id="drink-remove-btn-${drink.id }" type="button" class="btn btn-danger">Remove</button></td>
</tr>
<script>
$('#my-modal-${drink.id}').click(function() {
	var url =  'process-drink-size-and-price';
	$.ajax({
		url: url,
		data: {
			drinkId: $('#drinkId-${drink.id}').val(),
			size: toUnicode($('#drinkSize-${drink.id}').val()),
			price: $('#drinkPrice-${drink.id}').val()
		}
	}).done(function(drinkSizeAndPrice) {
		$('#drink-size-and-price-${drink.id}').append('<option value=' + drinkSizeAndPrice.id + ' selected="selected">' + drinkSizeAndPrice.size + ' - ' + parseFloat(Math.round(drinkSizeAndPrice.price * 100) / 100).toFixed(2) + '</option>');
		$('#myModal-${drink.id}').modal('hide');
	});
});
$('#drink-size-and-price-select-item-remove-${drink.id }').click(function() {
	alertify.confirm("Do you really want to remove this entry?", function (e) {
		if (e) {
			var url = 'remove-drink-size-and-price';
			$.ajax({
				url: url,
				data: {
					drinkSizeAndPriceId: $('#drink-size-and-price-${drink.id}').val()
				}
			}).done(function() {
				$("#drink-size-and-price-${drink.id} option[value=" + $('#drink-size-and-price-${drink.id}').val() + "]").remove();
				alertify.error("Data has been removed");
			});			
		}
	});
});
$('#drink-remove-btn-${drink.id }').click(function() {
	alertify.confirm("Do you really want to remove this entry?", function (e) {
	    if (e) {
	    	var url = 'remove-drink';
			$.ajax({
				url: url,
				data: {drinkId: '${drink.id}'}
			}).done(function() {
				$('.drink-${drink.id }').remove();
				alertify.error("Data has been removed");
			});			    	
	    } 
	});
});
</script>
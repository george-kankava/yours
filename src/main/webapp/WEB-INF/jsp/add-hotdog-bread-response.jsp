<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr class="hotdog-bread-${hotdogBread.id }">
	<td><select class="form-control">
			<option>${hotdogBread.nameGeo }</option>
			<option>${hotdogBread.nameEng }</option>
			<option>${hotdogBread.nameRus }</option>
	</select></td>
	<td><select class="form-control">
			<option>${hotdogBread.descriptionGeo }</option>
			<option>${hotdogBread.descriptionEng }</option>
			<option>${hotdogBread.descriptionRus }</option>
	</select></td>
	<td><select id="hotdog-bread-size-and-price-${hotdogBread.id}" class="form-control">
			<c:forEach items="${hotdogBread.hotdogBreadSizeAndPrices }" var="hotdogBreadSizeAndPrice">
				<option value="${hotdogBreadSizeAndPrice.id }">${hotdogBreadSizeAndPrice.size } - ${hotdogBreadSizeAndPrice.price }</option>
			</c:forEach>
	</select></td>
	<td>
		<button id="hotdog-bread-size-and-price-select-item-remove-${hotdogBread.id }" type="button" class="btn btn-warning">Remove</button>
	</td>
	<td><a data-toggle="modal" href="#myModal-${hotdogBread.id}" class="btn btn-success">Add</a> <!-- Modal -->
		<div class="modal fade" id="myModal-${hotdogBread.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Add</h4>
					</div>
					<form class="form-inline" role="form">
						<div class="modal-body">
							<input type="hidden" id="hotdogBreadId-${hotdogBread.id}" name="hotdogBreadId" value="${hotdogBread.id}">
							<div class="form-group">
								<label for="hotdogBreadSize-${hotdogBread.id }">Size</label> 
								<input type="text" class="form-control" id="hotdogBreadSize-${hotdogBread.id}" name="size" placeholder="Enter Size">
							</div>
							<div class="form-group">
								<label for="hotdogBreadPrice-${hotdogBread.id }">Price</label> 
								<input type="text" class="form-control" id="hotdogBreadPrice-${hotdogBread.id}" name="price" placeholder="Enter Price">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" id="my-modal-${hotdogBread.id}" class="btn btn-primary">Add</button>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal --></td>
	<td><button id="hotdog-bread-remove-btn-${hotdogBread.id }"
			type="button" class="btn btn-danger">Remove</button></td>
</tr>
<script>
$('#my-modal-${hotdogBread.id}').click(function() {
	var url =  'process-hotdog-bread-size-and-price';
	$.ajax({
		url: url,
		data: {
			hotdogBreadId: $('#hotdogBreadId-${hotdogBread.id}').val(),
			size: toUnicode($('#hotdogBreadSize-${hotdogBread.id}').val()),
			price: $('#hotdogBreadPrice-${hotdogBread.id}').val()
		}
	}).done(function(hotdogBreadSizeAndPrice) {
		$('#hotdog-bread-size-and-price-${hotdogBread.id}').append('<option value=' + hotdogBreadSizeAndPrice.id + ' selected="selected" >' + hotdogBreadSizeAndPrice.size + ' - ' + parseFloat(Math.round(hotdogBreadSizeAndPrice.price * 100) / 100).toFixed(2) + '</option>');
		$('#myModal-${hotdogBread.id}').modal('hide');
	});
});
$('#hotdog-bread-size-and-price-select-item-remove-${hotdogBread.id }').click(function() {
	alertify.confirm("Do you really want to remove this entry?", function (e) {
		if (e) {
			var url = 'remove-hotdog-bread-size-and-price';
			$.ajax({
				url: url,
				data: {
					hotdogBreadSizeAndPriceId: $('#hotdog-bread-size-and-price-${hotdogBread.id}').val()
				}
			}).done(function() {
				$("#hotdog-bread-size-and-price-${hotdogBread.id} option[value=" + $('#hotdog-bread-size-and-price-${hotdogBread.id}').val() + "]").remove();
				alertify.error("Data has been removed");
			});			
		}
	});
});
$('#hotdog-bread-remove-btn-${hotdogBread.id }').click(function() {
	alertify.confirm("Do you really want to remove this entry?", function (e) {
	    if (e) {
	    	var url = 'remove-hotdog-bread';
			$.ajax({
				url: url,
				data: {hotdogBreadId: '${hotdogBread.id}'}
			}).done(function() {
				$('.hotdog-bread-${hotdogBread.id }').remove();
				alertify.error("Data has been removed");
			});			    	
	    } 
	});
});
</script>
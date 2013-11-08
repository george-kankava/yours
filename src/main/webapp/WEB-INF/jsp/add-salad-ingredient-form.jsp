<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Bread" /></span>
</h5>
<div class="col-md-3">
		<table class="table table-bordered">
			<tr>
				<td><input type="text" class="form-control" id="ingredientGeo" placeholder="Ingredient Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="ingredientEng" placeholder="Ingredient Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="ingredientRus" placeholder="Ingredient Rus" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="ingredientDescGeo" placeholder="Ingredient Desc Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="ingredientDescEng" placeholder="Ingredient Desc Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="ingredientDescRus" placeholder="Ingredient Desc Rus" /></td>
			</tr>
			<tr>
				<td><button type="button" id="salad-ingredient-add-btn" class="btn btn-default">Add</button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-salad-ingredients">
			<thead>
				<tr>
					<th>Ingredient Name</th>
					<th>Ingredient Desc</th>
					<th colspan="3">Amount And Price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${saladIngredients }" var="saladIngredient">
					<tr class="salad-ingredient-${saladIngredient.id }">
						<td>
							<select class="form-control">
								<option>${saladIngredient.nameGeo }</option>
								<option>${saladIngredient.nameEng }</option>
								<option>${saladIngredient.nameRus }</option>
							</select>
						</td>
						<td>
							<select class="form-control">
								<option>${saladIngredient.descriptionGeo }</option>
								<option>${saladIngredient.descriptionEng }</option>
								<option>${saladIngredient.descriptionRus }</option>
							</select>
						</td>
						<td>
							<select id="salad-ingredient-amount-and-price-${saladIngredient.id}" class="form-control">
								<c:forEach items="${saladIngredient.saladIngredientAmountAndPrices }" var="ingredientAmountAndPrice">
									<option value="${ingredientAmountAndPrice.id }">${ingredientAmountAndPrice.amount } - ${ingredientAmountAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="salad-ingredient-amount-and-price-select-item-remove-${saladIngredient.id }" type="button" class="btn btn-warning">Remove</button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${saladIngredient.id}" class="btn btn-success">Add</a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${saladIngredient.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title">Add</h4>
        								</div>
        								<form class="form-inline" role="form">
        									<div class="modal-body">
        											<input type="hidden" id="saladIngredientId-${saladIngredient.id}" name="saladIngredientId" value="${saladIngredient.id}">
  													<div class="form-group">
    													<label for="saladIngredientAmount-${saladIngredient.id}">Amount</label>
    													<input type="text" class="form-control" id="saladIngredientAmount-${saladIngredient.id}" placeholder="Enter Amount">
													</div>
  													<div class="form-group">
    													<label for="saladIngredientPrice-${saladIngredient.id}">Price</label>
    													<input type="text" class="form-control" id="saladIngredientPrice-${saladIngredient.id}" placeholder="Enter Price">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          										<button type="button" id="my-modal-${saladIngredient.id}"  class="btn btn-primary">Add</button>
        									</div>
        									</form>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="salad-ingredient-remove-btn-${saladIngredient.id }" type="button" class="btn btn-danger">Remove</button></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#salad-ingredient-add-btn').click(function() {
		var url = 'process-add-salad-ingredient-form';
		$.ajax({
			url: url,
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify({
				nameGeo: toUnicode($('#ingredientGeo').val()),
				nameEng: toUnicode($('#ingredientEng').val()),
				nameRus: toUnicode($('#ingredientRus').val()),
				descriptionGeo: toUnicode($('#ingredientDescGeo').val()),
				descriptionEng: toUnicode($('#ingredientDescEng').val()),
				descriptionRus: toUnicode($('#ingredientDescRus').val())
			})
		}).done(function(response) {
			$('#ingredientGeo').val('');
			$('#ingredientEng').val('');
			$('#ingredientRus').val('');
			$('#ingredientDescGeo').val('');
			$('#ingredientDescEng').val('');
			$('#ingredientDescRus').val('');
			$('.table-salad-ingredients > tbody:last').append(response);
			alertify.success("Data has been saved");			
		});
	});
	<c:forEach items="${saladIngredients }" var="saladIngredient">
		$('#my-modal-${saladIngredient.id}').click(function() {
			var url =  'process-salad-ingredient-amount-and-price';
			$.ajax({
				url: url,
				data: {
					saladIngredientId: $('#saladIngredientId-${saladIngredient.id}').val(),
					amount: toUnicode($('#saladIngredientAmount-${saladIngredient.id}').val()),
					price: $('#saladIngredientPrice-${saladIngredient.id}').val()
				}
			}).done(function(saladIngredientAmountAndPrice) {
				$('#salad-ingredient-amount-and-price-${saladIngredient.id}').append('<option value=' + saladIngredientAmountAndPrice.id + ' selected="selected">' + saladIngredientAmountAndPrice.amount + ' - ' + parseFloat(Math.round(saladIngredientAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
				$('#myModal-${saladIngredient.id}').modal('hide');
				alertify.success("Data has been saved");
			});
		});
		$('#salad-ingredient-amount-and-price-select-item-remove-${saladIngredient.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
				if (e) {
					var url = 'remove-salad-ingredient-amount-and-price';
					$.ajax({
						url: url,
						data: {
							saladIngredientAmountAndPriceId: $('#salad-ingredient-amount-and-price-${saladIngredient.id}').val()
						}
					}).done(function() {
						$("#salad-ingredient-amount-and-price-${saladIngredient.id} option[value=" + $('#salad-ingredient-amount-and-price-${saladIngredient.id}').val() + "]").remove();
						alertify.error("Data has been removed");
					});			
				}
			});
		});
		$('#salad-ingredient-remove-btn-${saladIngredient.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
			    if (e) {
			    	var url = 'remove-salad-ingredient';
					$.ajax({
						url: url,
						data: {saladIngredientId: '${saladIngredient.id}'}
					}).done(function() {
						$('.salad-ingredient-${saladIngredient.id }').remove();
						alertify.error("Data has been removed");
					});		    	
			    } 
			});
		});
	</c:forEach>
</script>

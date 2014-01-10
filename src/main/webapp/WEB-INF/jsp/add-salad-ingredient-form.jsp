<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Bread" /></span>
</h5>
<div class="col-md-3">
		<table class="table table-bordered">
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.salad.ingredient.type.geo" var="ingredientTypeGeo"></spring:message>
				<td><input type="text" class="form-control" id="ingredientGeo" placeholder="${ingredientTypeGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.salad.ingredient.type.eng" var="ingredientTypeEng"></spring:message>
				<td><input type="text" class="form-control" id="ingredientEng" placeholder="${ingredientTypeEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.salad.ingredient.type.rus" var="ingredientTypeRus"></spring:message>
				<td><input type="text" class="form-control" id="ingredientRus" placeholder="${ingredientTypeRus }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.salad.ingredient.desc.geo" var="ingredientDescGeo"></spring:message>
				<td><input type="text" class="form-control" id="ingredientDescGeo" placeholder="${ingredientDescGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.salad.ingredient.desc.eng" var="ingredientDescEng"></spring:message>
				<td><input type="text" class="form-control" id="ingredientDescEng" placeholder="${ingredientDescEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.salad.ingredient.desc.rus" var="ingredientDescRus"></spring:message>
				<td><input type="text" class="form-control" id="ingredientDescRus" placeholder="${ingredientDescRus }" /></td>
			</tr>
			<tr>
				<td><button type="button" id="salad-ingredient-add-btn" class="btn btn-default"><spring:message code="yours.food.service.add.button.title"></spring:message></button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-salad-ingredients">
			<thead>
				<tr>
					<th><spring:message code="yours.food.service.admin.salad.ingredient.type"></spring:message></th>
					<th><spring:message code="yours.food.service.admin.salad.ingredient.desc"></spring:message></th>
					<th colspan="3"><spring:message code="yours.food.service.admin.salad.amount.and.price"></spring:message></th>
					<th><spring:message code="yours.food.service.remove.button.title"></spring:message></th>
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
							<button id="salad-ingredient-amount-and-price-select-item-remove-${saladIngredient.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${saladIngredient.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${saladIngredient.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
        								</div>
        								<form class="form-inline" role="form">
        									<div class="modal-body">
        											<input type="hidden" id="saladIngredientId-${saladIngredient.id}" name="saladIngredientId" value="${saladIngredient.id}">
  													<div class="form-group">
    													<label for="saladIngredientAmount-${saladIngredient.id}"><spring:message code="yours.food.ingredients.amount"></spring:message></label>
    													<spring:message var="enterAmount"  code="yours.food.service.admin.enter.amount.title"></spring:message>
    													<input type="text" class="form-control" id="saladIngredientAmount-${saladIngredient.id}" placeholder="${enterAmount }">
													</div>
  													<div class="form-group">
    													<label for="saladIngredientPrice-${saladIngredient.id}"><spring:message code="yours.food.ingredient.price"></spring:message></label>
    													<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
    													<input type="text" class="form-control" id="saladIngredientPrice-${saladIngredient.id}" placeholder="${enterPrice }">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
          										<button type="button" id="my-modal-${saladIngredient.id}"  class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
        									</div>
        									</form>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="salad-ingredient-remove-btn-${saladIngredient.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
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
			alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');			
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
				alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
			});
		});
		$('#salad-ingredient-amount-and-price-select-item-remove-${saladIngredient.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
				if (e) {
					var url = 'remove-salad-ingredient-amount-and-price';
					$.ajax({
						url: url,
						data: {
							saladIngredientAmountAndPriceId: $('#salad-ingredient-amount-and-price-${saladIngredient.id}').val()
						}
					}).done(function() {
						$("#salad-ingredient-amount-and-price-${saladIngredient.id} option[value=" + $('#salad-ingredient-amount-and-price-${saladIngredient.id}').val() + "]").remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			
				}
			});
		});
		$('#salad-ingredient-remove-btn-${saladIngredient.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
			    if (e) {
			    	var url = 'remove-salad-ingredient';
					$.ajax({
						url: url,
						data: {saladIngredientId: '${saladIngredient.id}'}
					}).done(function() {
						$('.salad-ingredient-${saladIngredient.id }').remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});		    	
			    } 
			});
		});
	</c:forEach>
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tr class="sandwich-vegetable-${sandwichVegetable.id }">
	<td>
		<select class="form-control">
			<option>${sandwichVegetable.nameGeo }</option>
			<option>${sandwichVegetable.nameEng }</option>
			<option>${sandwichVegetable.nameRus }</option>
		</select>
	</td>
	<td>
		<select id="sandwich-vegetable-amount-and-price-${sandwichVegetable.id }" class="form-control">
			<c:forEach items="${sandwichVegetable.vegetableAmountAndPrices }" var="vegetableAmountAndPrice">
				<option value="${vegetableAmountAndPrice.id }">${vegetableAmountAndPrice.portion} - ${vegetableAmountAndPrice.price }</option>
			</c:forEach>
		</select>
	</td>
	<td>
		<button id="sandwich-vegetable-amount-and-price-select-item-remove-${sandwichVegetable.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
	</td>
	<td><a data-toggle="modal" href="#myModal-${sandwichVegetable.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
		<!-- Modal -->
		<div class="modal fade" id="myModal-${sandwichVegetable.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id="sandwichVegetableId-${sandwichVegetable.id }" name="sandwichVegetableId" value="${sandwichVegetable.id}">
					<div class="form-group">
						<label for="sandwichVegetableAmount-${sandwichVegetable.id }"><spring:message code="yours.food.ingredients.amount"></spring:message></label>
						<spring:message var="enterAmount"  code="yours.food.service.admin.enter.amount.title"></spring:message>
						<input type="text" class="form-control" id="sandwichVegetableAmount-${sandwichVegetable.id }" name="amount" placeholder="${enterAmount }">
					</div>
					<div class="form-group">
						<label for="sandwichVegetablePrice-${sandwichVegetable.id }"><spring:message code="yours.food.ingredient.price"></spring:message></label>
						<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
						<input type="text" class="form-control" id="sandwichVegetablePrice-${sandwichVegetable.id }" name="price" placeholder="${enterPrice }">
					</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
						<button id="my-modal-${sandwichVegetable.id }" type="submit" class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</td>
	<td><button id="sandwich-vegetable-remove-btn-${sandwichVegetable.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
</tr>
<script>
$('#my-modal-${sandwichVegetable.id}').click(function() {
	var url =  'process-sandwich-vegetable-amount-and-price';
	$.ajax({
		url: url,
		data: {
			sandwichVegetableId: $('#sandwichVegetableId-${sandwichVegetable.id}').val(),
			amount: toUnicode($('#sandwichVegetableAmount-${sandwichVegetable.id}').val()),
			price: $('#sandwichVegetablePrice-${sandwichVegetable.id}').val()
		}
	}).done(function(sandwichVegetableAmountAndPrice) {
		$('#sandwich-vegetable-amount-and-price-${sandwichVegetable.id}').append('<option value=' + sandwichVegetableAmountAndPrice.id + ' selected="selected">' + sandwichVegetableAmountAndPrice.portion + ' - ' + parseFloat(Math.round(sandwichVegetableAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
		$('#myModal-${sandwichVegetable.id}').modal('hide');
		alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
	});
});
$('#sandwich-vegetable-amount-and-price-select-item-remove-${sandwichVegetable.id }').click(function() {
	alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
		if (e) {
			var url = 'remove-sandwich-vegetable-amount-and-price';
			$.ajax({
				url: url,
				data: {
					sandwichVegetableAmountAndPriceId: $('#sandwich-vegetable-amount-and-price-${sandwichVegetable.id}').val()
				}
			}).done(function() {
				$("#sandwich-vegetable-amount-and-price-${sandwichVegetable.id} option[value=" + $('#sandwich-vegetable-amount-and-price-${sandwichVegetable.id}').val() + "]").remove();
				alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
			});
		}
	});
});
$('#sandwich-vegetable-remove-btn-${sandwichVegetable.id }').click(function() {
	alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
	    if (e) {
	    	var url = 'remove-sandwich-vegetable';
			$.ajax({
				url: url,
				data: {sandwichVegetableId: '${sandwichVegetable.id}'}
			}).done(function() {
				$('.sandwich-vegetable-${sandwichVegetable.id }').remove();
				alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
			});			    	
	    } 
	});
});
</script>